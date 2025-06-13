.. _envml(1):

envml
=====

SYNOPSIS
--------

**envml** [*MODULE_ACTION*]... [--] *COMMAND* [*ARG*]...

DESCRIPTION
-----------

The :command:`envml` command configures the environment using specified
Environment Modules actions and then given command.

This is useful for running a command in a modified environment without
permanently altering the current shell session.

:command:`envml` interprets its first arguments as module actions, then
switches to command execution after either encountering ``--`` or determining
that the remaining arguments form the actual command to run.

MODULE_ACTION FORMAT
--------------------

Each module action argument can be one of the following forms:

- ``purge``
  Unload all currently loaded modulefiles.

- ``restore[=coll]``
  Restore the module environment from the named collection ``coll``. If no
  name is given, restores the default collection.

- ``unload=mod1[&mod2...]``
  Unload one or more specified modulefiles.

- ``switch=mod1&mod2``
  Unload ``mod1`` and load ``mod2``.

- ``[load=]mod1[&mod2...]``
  Load one or more specified modulefiles. ``load=`` can be omitted.

Multiple MODULE_ACTIONs can be passed in a single argument using the colon
(``:``) separator. The ampersand (``&``) is used to specify multiple modules
in a single action.

COMMAND EXECUTION
-----------------

Everything following the ``--`` separator is treated as the command to execute
in the modified environment.

If no ``--`` separator is provided, :command:`envml` assumes the first
argument is a MODULE_ACTION and the remaining arguments form the command to
execute.

OPTIONS
-------

.. option:: --help, -h

 Display usage information and exit.

EXAMPLES
--------

Restore default module collection then run ``command arg1 arg2``:

.. code-block:: sh

    envml restore command arg1 arg2

Purge all modules, then load ``mod1`` and ``mod2``, and run the command:

.. code-block:: sh

    envml purge:mod1:mod2 command arg1 arg2

Use the ``--`` separator to avoid ambiguity:

.. code-block:: sh

    envml restore load=mod1&mod2 -- command arg1 arg2

EXIT STATUS
-----------

The :command:`envml` command returns the exit status of the executed command
or ``1`` if module action fails.

DIAGNOSTICS
-----------

If the :command:`module` command is not available in the shell (i.e., not a
shell function), :command:`envml` will print an error and exit.

SEE ALSO
--------

:ref:`module(1)`, :ref:`ml(1)`, :ref:`modulefile(5)`
