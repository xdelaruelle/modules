.. _EESSI:

Adding Environment Modules support to EESSI
===========================================

The `European Environment for Scientific Software Installations`_ (EESSI) is
a collaboration among European HPC centres and industry partners aiming to
provide a common, optimized stack of scientific software installations usable
across diverse systems (HPC clusters, workstations, cloud) regardless of
Linux distribution or CPU architecture

This document analyzes the EESSI framework to determine how it can be adapted
to support the Environment Modules tool alongside the existing Lmod support.

.. _European Environment for Scientific Software Installations: https://www.eessi.io

Providing equivalent functionality
----------------------------------

Here we analyze the content of the EESSI CVMFS repository to find the files
that are specific to Lmod and define how they should be ported to provide the
same functionality with Environment Modules.

Files not mentioned here, like ``init/lmod_eessi_archdetect_wrapper.sh``, do
not need to be adapted to get used in an Environment Modules context.

.. _EESSI Lua module:

``init/modules/EESSI/2025.06.lua`` module
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This Lua modulefile requires a corresponding Tcl version for Environment
Modules to interpret it. Below are the commands to use when creating the
equivalent Tcl modulefile to ensure the same functionality:

* ``report`` procedure is equivalent to ``LmodMessage``
* ``error`` command is equivalent to ``LmodError``
* ``module-help`` (v5.6+) is equivalent to ``help`` (if version below 5.6 is
  expected, define a ``ModulesHelp`` procedure)
* ``module-tag`` command is equivalent to ``add_property`` (needed to define
  the ``sticky`` tag)

.. _EESSI bash script:

``init/bash`` script
^^^^^^^^^^^^^^^^^^^^

Among other things this script sources module tool initialization script, then
use the ``module`` command to setup environment.

The only adaptation required is to source the Environment Modules
initialization script if this module tool is selected.

.. _EESSI Lmod initialization shell scripts:

``init/lmod/<shell>`` scripts
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This scripts initializes module tool the following way:

* reset ``MODULEPATH`` to only point to EESSI modulepath
* source module tool initialization script
* if initialization has not been performed yet:

  * it load default modules defined externally in
    ``LMOD_SYSTEM_DEFAULT_MODULES``  or load ``EESSI/$EESSI_VERSION``
  * define this as the initial environment

* otherwise, module tool refresh shell alias and functions in currently loaded
  modules

Sourcing Environment Modules initialization script will setup the initial
environment defined in its ``initrc`` configuration script unless either the
``MODULEPATH`` or ``LOADEDMODULES`` environment variables are non-empty.

Here the idea is to unset ``MODULEPATH`` and ``LOADEDMODULES`` to be able to
initialize EESSI environment with the content of ``initrc``. With such
strategy, environment definition is only defined in ``initrc`` and not in
every shell initialization script.

.. code-block:: tcl

    #%Module
    if {[string length [getenv EESSI_SITE_MODULEPATH]]} {
        module use --append [getenv EESSI_SITE_MODULEPATH]
    }
    module use --append [getenv EESSI_MODULEPATH]
    module load EESSI/$EESSI_VERSION

Before unsetting ``LOADEDMODULES``, it is important to purge any eventually
loaded modules, including sticky modules. If such command fails, because for
instance ``module`` command is not defined, it should not disturb the script.

The initialization script could look like to setup EESSI environment with
Environment Modules:

.. code-block:: sh

    if [ -z "$__Init_Default_Modules" ]; then
        export __Init_Default_Modules=1;

        # unset pre-existing module environment
        module purge --force --no-redirect 2>/dev/null || true
        unset MODULEPATH
        unset LOADEDMODULES
    fi

    # Choose an EESSI CVMFS repository
    EESSI_CVMFS_REPO="${EESSI_CVMFS_REPO:-/cvmfs/software.eessi.io}"
    # Choose an EESSI version
    EESSI_VERSION_DEFAULT="2025.06"
    EESSI_VERSION="${EESSI_VERSION:-${EESSI_VERSION_DEFAULT}}"
    export EESSI_MODULEPATH="${EESSI_CVMFS_REPO}/versions/${EESSI_VERSION}/init/modules"
    . "${EESSI_CVMFS_REPO}/versions/${EESSI_VERSION}/compat/linux/$(uname -m)/usr/share/Modules/init/bash"

The ``module refresh`` part could be omitted as Environment Modules
initialization process already performs a refresh if an environment is found
set.

``init/Magic_Castle/bash`` script
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This script is similar to `EESSI Lmod initialization shell scripts`_ described
above and the same adaptation strategy could be applied here.

``$EESSI_SOFTWARE_PATH/modules`` modulepaths
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

These modulepaths contains Lua modulefiles. Environment Modules only supports
modulefiles written in Tcl language. Thus Tcl modulefiles are needed in EESSI
in addition to Lua modulefiles.

The features used in Lua modulefiles are also available in Tcl modulefiles,
thus if Tcl modulefiles are generated by EasyBuild in EESSI repository, they
will provide the same functionalities than those provided by Lua modulefiles.

``$EESSI_SOFTWARE_PATH/.lmod/lmodrc.lua`` config file
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

``lmodrc.lua`` config file, pointed by ``LMOD_RC`` environment variable is
only used to define location of module cache data.

Environment Modules does not require such file as cache information is
always stored at the root of each modulepath. Just build the cache files with
``module cachebuild`` command in a session where the EESSI modulepaths are
enabled.

As a consequence ``LMOD_RC`` and ``LMOD_CONFIG_DIR`` environment variable
should not be ported to Environment Modules.

``$EESSI_SOFTWARE_PATH/.lmod/SitePackage.lua`` config file
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This ``SitePackage.lua`` config file has 3 purposes:

* Define a Lmod ``load`` hook through ``eessi_load_hook`` function
* Define a Lmod ``isVisible`` hook through ``hide_2022b_modules`` function
* Call ``load_site_specific_hooks`` function that sources additional
  site-specific ``SitePackage.lua`` files if they exist

The ``load`` hook is used to:

* Print warning message when loading specific module to advice to use other
  version of this module: such warning can be defined in modulepath-specific
  ``.modulerc`` file with the ``module-warn`` command introduced in
  Environment Modules version 5.6.
* Breaking load of specific module if some files are not found: Environment
  Modules can achieve the same functionality in modulepath-specific
  ``.modulerc`` file with the ``module-forbid`` command. The local files check
  will be performed on any ``module`` command but these forbidden modules will
  be seen already on a ``module avail``.

The ``isVisible`` hook is used to hide modules coming from the ``2022b`` or
``12.2.0`` toolchains. Environment Modules can achieve the same functionality
with a modulepath-specific ``.modulerc`` file that calls ``module-hide``
command for each of these modules. The full module name and version should be
used, not a regular expression or a glob pattern. Thus it is advised to
generate the ``.modulerc`` file after looking at the existing modulefiles in
modulepath directory.

To provide the same functionality than the ``load_site_specific_hooks``
function, a ``siteconfig.tcl`` config file will be needed that will load
additional site-specific ``siteconfig.tcl`` files if they exist. The
``source`` Tcl command should be called from ``siteconfig.tcl`` main context
to load these files.

The main ``siteconfig.tcl`` file should be placed in a central location within
the EESSI repository and each Environment Modules installation should point to
it via a symbolic link. No ``LMOD_PACKAGE_PATH`` environment variable should
be ported to Environment Modules.

Branching depending on chosen module tool
-----------------------------------------

EESSI project provides to users two ways to initialize. The following sections
suggest adaptations to these initialization methods to also support
Environment Modules.

Loading an EESSI environment module
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Provide EESSI Environment Modules initialization shell scripts like `EESSI
Lmod initialization shell scripts`_ in a ``init/envmodules`` directory (as
``init/modules`` directory already exists for another purpose).

Create a Tcl counterpart for `EESSI Lua module`_. Such Tcl modulefile can be
stored in the same directory as the Lua modulefile: when evaluating the
``EESSI/2025.06`` module, Lmod will interpret the ``EESSI/2025.06.lua`` file
and Environment Modules the ``EESSI/2025.06`` file.

Sourcing the EESSI ``bash`` initialization script
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Introduce the ``EESSI_MODULE_TOOL`` environment variable that branches to:

* *Environment Modules* if variable is set to ``EnvironmentModules``
* *Lmod* if variable is not set or if set to ``Lmod``

Use this ``EESSI_MODULE_TOOL`` environment variable in `EESSI bash script`_ to
determine the correct module tool initialization script to source.

.. code-block:: sh

    case "${EESSI_MODULE_TOOL:-Lmod}" in
        Lmod) source $EESSI_EPREFIX/usr/share/Lmod/init/bash ;;
        EnvironmentModules) source $EESSI_EPREFIX/usr/share/Modules/init/bash ;;
        *) error "Module tool '$EESSI_MODULE_TOOL' is not supported" ;;
    esac

Such adaptation helps to keep a single ``bash`` initialization script whatever
the module tool used.

Reducing maintenance load
-------------------------

``EESSI/2025.06`` modulefile only in Tcl syntax
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To reduce the maintenance load, it would be nice to have the ``EESSI``
modulefiles only in Tcl and not in both Tcl and Lua syntaxes.

Lmod supports evaluation of Tcl modulefiles, but we need to check that a
syntax understood by both module tools exists to have a single implementation
of ``EESSI`` modulefile.

Based on the analysis of `EESSI Lua module`_, the following things should be
taken into account:

* ``report`` procedure should be added to Lmod to support an equivalent to
  ``LmodMessage`` in Tcl evaluation context
* ``module-help`` is available on Lmod (in the not yet released version after
  8.7.65): if EESSI would like to support older Lmod releases, the
  ``ModulesHelp`` procedure should be used instead
* ``add-property`` should be used instead of ``module-tag`` to define the
  module ``sticky``: Environment Modules 5.6+ supports defining a tag with
  this command

.. vim:set tabstop=2 shiftwidth=2 expandtab autoindent:
