.. _modulecmd(1):

modulecmd
=========

SYNOPSIS
--------

**modulecmd** *shell* [*switches*] [*sub-command* [*sub-command-args*]]

DESCRIPTION
-----------

The :command:`modulecmd` command is a generic wrapper pointing to Modules
execution engine :command:`modulecmd.tcl`.

The :command:`modulecmd.tcl` command is the low-level execution engine of the
Environment Modules system. It is responsible for evaluating modulefile
logic and emitting shell-specific commands that modify the user's
environment.

Unlike the user-facing :command:`module` command, :command:`modulecmd.tcl`
does not directly alter the environment. Instead, it writes shell code to
standard output, which must be evaluated by the calling shell.

The :command:`module` shell function or wrapper script invokes
:command:`modulecmd.tcl` internally and evaluates its output to apply
environment changes.

The following shells are supported: sh, csh, tcsh, bash, ksh, zsh, fish, cmd,
pwsh, python, perl, ruby, tcl, cmake, r and lisp.

See the :ref:`modulecmd startup`, :ref:`command line switches` and
:ref:`module sub-commands` sections in the :ref:`module(1)` man page.

Direct invocation of :command:`modulecmd` is primarily intended for debugging
and advanced usage. End users should normally use the :command:`module`
command instead.

EXIT STATUS
-----------

:command:`modulecmd` exits with ``0`` on successful execution. Otherwise ``1``
is returned.

ENVIRONMENT
-----------

See the :ref:`ENVIRONMENT<module ENVIRONMENT>` section in the :ref:`module(1)`
man page.

FILES
-----

See the :ref:`FILES<module FILES>` section in the :ref:`module(1)` man page.

SEE ALSO
--------

:ref:`envml(1)`, :ref:`ml(1)`, :ref:`module(1)`, :ref:`modulefile(5)`
