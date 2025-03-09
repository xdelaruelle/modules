.. _spider-sub-command:

spider sub-command
==================

:subcmd:`spider` sub-command scans all the enabled modulepaths and the
modulepaths enabled by modules in every modulepaths to return the modules
matching the search query.

Sub-command properties
----------------------

General properties:

* Shortcut name: ``spi``
* Accepted option: same as :subcmd:`avail`
* Expected number of argument: 0 to N
* Accept boolean variant specification: yes
* Parse module version specification: yes
* Accept extra match search: yes
* Accept only extra match search: yes
* Fully read modulefile when checking validity: no
* Sub-command only called from top level: yes
* Insensitive case match: ``search`` mode
* Collect tags: yes

:subcmd:`spider` is implemented as a two-step process:

* find all modulepaths through a scan evaluation to fetch all ``use`` elements
* perform an :subcmd:`avail` sub-command on all these modulepaths

All kind of options and search queries supported by :subcmd:`avail`
sub-command are supported by :subcmd:`spider`.

The collect of modulepaths starts by scanning the global/user rc space and the
currently enabled modulepaths in :envvar:`MODULEPATH`. Each modulefile in
these modulepaths are evaluated to find if they enable other modulepaths with
either ``module use``, ``append-path MODULEPATH`` or ``prepend-path
MODULEPATH`` modulefile commands. Found modulepaths are added to the list of
modulepaths to scan to evaluate in turn their modulefiles to find other
modulepaths.

Each modulepath is converted to its absolute path name to avoid multiple scan.
Empty strings are discarded. Symbolic link modulepath are not converted into
their target directory. Which means this symlink modulepath will appear on its
own.

Modulepath are reported in the following order. First each modulepath defined
in the ``MODULEPATH`` environment variable. Then each modulepath enabled by
modulefiles of the global/user rc space, then of the first modulepath
evaluated, then of the second evaluated and so on. Being added in an *append*
or a *prepend* mode does not change the report order.

Configuration
-------------

Several configuration options are added to be able to set a different behavior
for ``spider`` than for ``avail``:

* :mconfig:`spider_output` and :mconfig:`spider_terse_output` configuration
  options define what content to report in ``spider`` output. See
  :ref:`output-configuration` document to learn the properties of these
  options.

* :mconfig:`spider_indepth` configuration option to enable or disable indepth
  module search result.

Reporting
---------

With the introduction of the ``spider`` sub-command comes the *via* concept.
When a modulepath is enabled by a given module, it is said that modulepath is
available *via* this module.

This information is reported on regular output next to the modulepath name. If
a module enables a modulepath, the mention *(via module/version)* is added.
Via information is reported if ``via`` element is set on the corresponding
output configuration option. ``via`` is not supported on terse output mode, to
avoid breaking parsing of such output. ``via`` is set by default on
``spider_output`` configuration option. Via information is not reported if
modulepath is not reported.

During a ``spider`` processing the *via* information is collected from the
extra specifier *use* employed by modules. First evaluated module that enable
the modulepath will be the one reported.

Modulepath usage record
^^^^^^^^^^^^^^^^^^^^^^^

When loading a module that enable a modulepath, this information is stored in
the loaded environment through the :envvar:`__MODULES_LMUSE` environment
variable. This information is used to report the *via* information on
``avail`` and ``spider`` output. With that, the *via* information is
consistently available to user, whether the modulepath is already enabled or
can be through the addition of another module. This *via* information stored
in ``__MODULES_LMUSE`` is also used to establish a dependency link between the
modulepath and the loaded module.

Note that a path added with ``module use`` is converted in its absolute path
form whereas with ``append-path`` and ``prepend-path`` the entry is set as-is.
This is reflected in the path entry recorded in ``__MODULES_LMUSE``. Which
means users should carefully define path in their absolute form when set to
``MODULEPATH`` with ``append-path`` or ``prepend-path``.

When path entry contains an environment variable reference, this reference is
recorded as is in ``MODULEPATH`` and relative entry in ``__MODULES_LMUSE``.
Path pointed by this entry evolves with changes made to referred environment
variable.

JSON output
^^^^^^^^^^^

The *via* information is always reported on the JSON output. A ``via`` key is
added on each module reported. If module is part of a modulepath that is
enabled by another module, the value of the ``via`` key is set to the name
and version of this module. As modulepaths are just keys in the JSON document
produced, the via information is stored in each module JSON object rather once
next to the modulepath information.

Pre-enabled modulepath
^^^^^^^^^^^^^^^^^^^^^^

When a modulepath is already enabled and a modulefile evaluation enables it
again, the reference counter for this path is increased. This path reference
counter increase is performed whatever the modulefile command used to enable
the path (``module use``, ``append-path`` and ``prepend-path``).

If the same path is then enabled again by another loading modulefile, the
reference counter is increased again. Unload of these modulefiles decreases
the reference counter.

The reference counter information is taken into account to determine if
modulepath is enabled via a loaded module. Which means that if a modulepath
is pre-enabled then a modulefile is enabling it again, the reference counter
will help to say that modulepath is not ``via`` this loaded module. There is
no *via* if reference counter is greater than the number of loaded modules
enabling the modulepath.

Note that enabling an already enabled modulepath from the command line will
not trigger any reference counter updates on Modules, even if a reference
counter is specifically set for the given modulepath. As a result, the *via*
information of an enabled modulepath is not changed if user enables it again
from the command-line.

Specific impact
---------------

* As every ``.modulerc`` files are evaluated during the ``scan`` step (to
  collect modulepaths), tags, hiding rules & co applies to modulefiles from
  different modulepaths or those defined within a global rc file.

* A bad environment state (like inconsistent loaded environment variables)
  produces an error exit code on ``spider``

Corner cases
------------

* If a modulepath is used by a module but this module also unuse it thereafter
  this modulepath is kept recorded in the ``__MODULES_LMUSE`` tracking
  environment variable.

* On :subcmd:`list` sub-command JSON output, ``via`` information is currently
  always empty. Could be improved in the future.

.. vim:set tabstop=2 shiftwidth=2 expandtab autoindent:
