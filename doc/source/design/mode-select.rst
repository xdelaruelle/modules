.. _mode-select:

Mode select: irreversible module actions
========================================

This design document describes how the `Lmod mode select`_ feature could be
implemented in Tcl modulefiles.

.. _Lmod mode select: https://lmod.readthedocs.io/en/latest/370_irreversible.html

Goal is to describe a solution that could be the same over the different
``module`` implementations. This way the Tcl modulefiles relying on such
feature will be processed the same way whatever the ``module`` implementation.

Feature description
-------------------

*The mode select feature allows modulefiles to specify actions that should
only be executed in specific modes (load or unload). This is particularly
useful for operations that are irreversible or need special handling during
module load/unload cycles.*

When mode select is used, the command is executed as-is if current evaluation
mode corresponds to one set. Which means a ``setenv`` with a mode select for
``unload`` evaluation, is evaluated as a ``setenv`` command when unloading
modulefile.

Such feature does not cope with module dependency definition.

Proposed interface for Tcl modulefile
-------------------------------------

Proposition is to add a ``--mode`` option on concerned Tcl modulefile
commands. This ``--mode`` option accepts a Tcl as value, for instance:

* ``--mode load``
* ``--module {load unload}``

Concerned Tcl modulefile commands are:

* ``setenv``
* ``unsetenv``
* ``prepend-path``
* ``append-path``
* ``remove-path``
* ``pushenv``
* ``module load``

Support in Modules
------------------

*Mode select* is not supported at the moment in Modules. Support can be added
if someone shows up and expresses a need.

The implementation of this feature for the ``module load`` command may be
non-trivial: currently when unloading modules, only modulefile unloads are
expected.. Dependency resolution mechanism is expecting to have all the
properties of the system when starting by looking at the loaded environment.
Adding the ability to throw modulefile loads during this unload process
requires to revise the current dependency resolution mechanism.

Due to that, implementation if asked may first be done only for modulefile Tcl
commands others than ``module load``.

.. vim:set tabstop=2 shiftwidth=2 expandtab autoindent:
