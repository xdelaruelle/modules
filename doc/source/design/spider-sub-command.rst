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

Specific impact
---------------

* As every ``.modulerc`` files are evaluated during the ``scan`` step (to
  collect modulepaths), tags, hiding rules & co applies to modulefiles from
  different modulepaths or those defined within a global rc file.

* A bad environment state (like inconsistent loaded environment variables)
  produces an error exit code on ``spider``

.. vim:set tabstop=2 shiftwidth=2 expandtab autoindent:
