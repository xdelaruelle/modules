.. _FAQ:

Frequently Asked Questions
==========================

Module command
--------------

How does the ``module`` command work?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The command ``module`` is an alias for something like:

sh:

.. code-block:: sh

     module ()
     {
        eval "$(/some/path/modulecmd sh "$@")"
     }

csh:

.. code-block:: csh

     eval "`/some/path/modulecmd csh !*:q`"

Where the ``modulecmd`` outputs valid shell commands to *stdout* which manipulates the shell's environment. Any text that is meant to be seen by the user **must** be sent to *stderr*. For example:

.. code-block:: tcl

     puts stderr "\n\tSome Text to Show\n"

I have installed Modules but I get a ``module: command not found`` error
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This error means the ``module`` shell function or alias is not defined in your
shell session.

After :ref:`installing Modules<INSTALL>` and depending on the OS distribution
you use, some additional steps may be necessary to make ``module`` properly
defined in shell sessions whatever their kind (interactive or
non-interactive).

Follow the :ref:`enable-modules-in-shells` guidelines to adapt the
initialization files of the shell you use.

I put the ``module`` command in a script and I run the script... it doesn't change my environment?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

A child process (script) can not change the parent process environment. A ``module load`` in a script only affects the environment for the script itself. The only way you can have a script change the current environment is to *source* the script which reads it into the current process.

sh:

.. code-block:: sh

     . somescript

csh:

.. code-block:: csh

     source somescript

How do I capture the module command output?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This ties in with the very first question. Since the :ref:`module(1)` command is essentially an *eval*, the visible output to the screen must necessarily be sent to *stderr*. It becomes a matter on how to capture output from *stderr* for the various shells. The following examples just show how to spool the output from the **avail** command to a file. This also works for the various other module commands like **list**, **display**, etc. There are also various tricks for piping *stderr* to another program.

sh:

.. code-block:: sh

     module avail 2> spoolfile

csh: (overwrite existing file)

.. code-block:: csh

     module avail >&! spoolfile

How to use the module command from Makefile?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To make use of the ``module`` command from a Makefile, the shell initialization script should first be sourced within Makefile rule to define the ``module`` function in that context. Environment variable ``MODULESHOME`` may help to locate the shell initialization script in a generic way, like done in the following example:

.. code-block:: Makefile

     module_list:
     	source $$MODULESHOME/init/bash; module list

How to preserve my loaded environment when running ``screen``?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Usually the `Screen`_ terminal utility is installed with the *setgid* bit
set. Depending on the operating system, when a *setgid* program is ran, it may
not inherit several environment variables from its parent context like
:envvar:`LD_LIBRARY_PATH`. This is a safeguard mechanism to protect the
privileged process from being fooled by malicious dynamic libraries.

As a result, if your currently loaded environment has defined
:envvar:`LD_LIBRARY_PATH`, you will find it cleared in the ``screen`` session.

One way to get your environment correctly initialized within ``screen`` session
is to reload it once started with :subcmd:`module reload<reload>` command:

.. parsed-literal::

    :ps:`$` module load foo/1.0
    :ps:`$` echo $LD_LIBRARY_PATH
    /path/to/lib
    :ps:`$` screen
    :ps:`$` module list
    Currently Loaded Modulefiles:
     1) foo/1.0  
    :ps:`$` echo $LD_LIBRARY_PATH

    :ps:`$` module reload
    :ps:`$` echo $LD_LIBRARY_PATH
    /path/to/lib

Other way around is to reconfigure ``screen`` not to rely on the *setgid* bit
for its operations. You may also look at the `tmux`_ utility, which is an
alternative to ``screen`` that do not use the *setgid* mechanism.

.. _Screen: https://www.gnu.org/software/screen/
.. _tmux: https://github.com/tmux/tmux/wiki


Modulefiles
-----------

I want the modulefile to source some rc script that came with some application
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

See the module :ref:`sh-to-mod_sub-command` sub-command to translate the
environment changes done by a shell script into a :ref:`modulefile(5)`.

You could also check the :ref:`source-sh_modulefile_command` to directly
import the environment changes performed by a shell script within a
:ref:`modulefile(5)`.

How do I specify the *default* modulefile for some modulefile directory?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Modules usually uses the the highest lexicographically sorted :ref:`modulefile(5)` under the directory, unless there is a ``.version`` file in that directory which has a format like the following where ``native`` is a modulefile (or a sub-directory) in that directory. It's also possible to set the default with a ``.modulerc`` file with a **module-version** command.

.. code-block:: tcl

     #%Module
     set ModulesVersion native

I cannot access regular man pages now I have loaded some module
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If your system does not have the :envvar:`MANPATH` environment variable set by
default, and you load a module that defines it, you must append a colon
(``:``) to the end of the :envvar:`MANPATH` value. This ensures continued
access to the system's default man pages.

See :ref:`man-path` cookbook recipe for details.

I don't want a *default* modulefile for the directory?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Follow the same prescription as setting a *default*, but give some *bogus* value, say *no_default*. The :ref:`module(1)` command will return an error message when no specific version is given.


Build Issues
------------

The configure script complains about TclX
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
::

     ...
     checking for TclX configuration (tclxConfig.sh)... not found
     checking for TclX version... using 8.4
     checking TCLX_VERSION... 8.4
     checking TCLX_LIB_SPEC... TCLX_LIB_SPEC not found, need to use --with-tclx-lib
     checking TCLX_INCLUDE_SPEC... TCLX_INCLUDE_SPEC not found, need to use --with-tclx-inc
     ...

TclX is an optional library that can speed up some operations. You don't need TclX for modules to compile and work, so you can add the --without-tclx option when configuring and it should proceed to completion. In fact, it should have succeeded anyways and just not attempt to use TclX.

Otherwise, you can load the TclX library package for your OS and the ``configure`` script should find it. If not then if you know where the ``tclxConfig.sh`` file or the library and include files are placed then use the following options::

     --with-tclx=<dir>       directory containing TclX configuration
                             (tclxConfig.sh) [[searches]]
     --with-tclx-ver=X.Y     TclX version to use [[search]]
     --with-tclx-lib=<dir>   directory containing tclx libraries (libtclxX.Y)
                             [[none]]
     --with-tclx-inc=<dir>   directory containing tclx include files
                             (tclExtend.h,...) [[none]]


General information
-------------------

Why does Modules use Tcl?
^^^^^^^^^^^^^^^^^^^^^^^^^

The first versions of the *Modules* package used shell scripts to do its
magic. The original authors then chose to implement the same in C to speed
things up and to add features. At the time the only easily embeddable
interpreter was Tcl which provided a standard language and the glue.

A pure Tcl version of the modulecmd script is available, and starting with
Modules version 4, it became the default implementation. The use of Tcl for
both the core commands and modulefile interpretation simplifies the addition
of new features.

How can I help?
^^^^^^^^^^^^^^^

See the :ref:`CONTRIBUTING` documentation. It provides guidelines on how to
ask questions, report issues, submit patches.

How do I download the source repository?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Anonymously clone the git repository:

.. code-block:: sh

     git clone https://github.com/envmodules/modules.git

Then you can create a specific branch and start your local adaptation if any:

.. code-block:: sh

     cd modules
     git checkout -b my_work

I cannot find answer to my question
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If your question isn't answered in the :ref:`INSTALL` documentation or the
:ref:`module(1)` and :ref:`modulefile(5)` man pages, you may also refer to the
:ref:`cookbook` section, which offers various installation examples.

If you still can't find the information you need, consult the
:ref:`CONTRIBUTING` documentation to learn how to ask your question within
the Modules community.
