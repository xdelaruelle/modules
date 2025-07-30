.. _require-via:

Require via
===========

As described in the :ref:`spider-sub-command` design document, a loaded module
that enables a modulepath is considered the *via* module of other loaded
modules whose modulefiles are stored in this modulepath.

This document is about considering a *via* module as a requirement for the
loaded module stored in the modulepath it enables. This means, as with other
kinds of requirements, that unloading a *via* module:

* raises an error if ``auto_handling`` is disabled, as a dependent module is
  loaded
* automatically unloads all dependent modules if ``auto_handling`` is enabled
  (*DepUn* mechanism)
* automatically reloads all dependent modules if ``auto_handling`` is enabled
  and an alternative *via* module is loaded (*DepRe* mechanism)

This feature provides a *module hierarchy* mechanism.

It is controlled by the :mconfig:`require_via` configuration option, which is
disabled by default to maintain compatibility in Modules version 5 branch.
This option will be enabled by default when moving to Modules version 6.

Via module requirement
----------------------

When :mconfig:`require_via` is enabled, *via* module is considered a
requirement by loaded modules whose modulefiles are stored in this enabled
modulepath. The same properties as for requirements defined with
:mfcmd:`prereq` apply:

* active requirement if *via* module is loaded before its dependent
* if *via* module is loaded after its dependent, it is considered a *Non
  Particular Order* (NPO) requirement: such requirement is inactive
* if several loaded modules enable the same modulepath, the one considered as
  the *via* module depends on :mconfig:`unload_match_order` config option

A module enabling an already enabled modulepath is not considered a via
module. In this situation a loaded module whose modulefile is stored in this
modulepath do not have a dependency on any modulepath-enabling loaded modules.
Since modulepath have already been enabled before other modules are loaded.
Same behavior is observed on Lmod.

Modulepath enabling may be expressed with reference to external environment
variables. Modulepath resolution is thus dynamic.

*Via* module requirement adds to the other kinds of requirements which are
checked to guarantee the consistency of the loaded environment. Depending on
:mconfig:`auto_handling` value, load or unload operations that impact
dependency consistency may lead to:

* an error if ``auto_handling`` is disabled
* automatic dependent module unload or reload if ``auto_handling`` is enabled

Dependent Reload mechanism update
---------------------------------

Dependent modules of a *via* module are targeted by the Dependent Reload
(DepRe) mechanism if *via* module is swapped or unloaded by Conflict Unload
(ConUn) mechanism.

As introduced with the ConUn mechanism, a test is made prior reloading each
DepRe module to check if it is loadable. If test determines module is not
able to reload, the reload is skipped and the module is considered a Dependent
Unload (DepUn) module.

This test checks no conflicting module are loaded and requirements are loaded.
A new check is added for all DepRe modules attempting to reload: it should be
available in enabled modulepaths.

Either the modulepath where module is stored is still enabled or module is
found in enabled modulepaths.

This availability new check is not linked to the ``require_via`` configuration
option. It is performed even when option is disabled. What is linked to this
option is to include the dependent of a *via* module in the DepRe mechanism.

*NOTE*: The availability of used variants is not checked by this mechanism.
Thus if modulefile is found but it does not contain anymore the used variant,
a DepRe error is obtained.

*FUTURE*: DepRe module reload may be attempted whatever the conditions and in
case of error, this evaluation is silenced if error is of following kind:
conflict present, requirement missing, module not available, variant not
available. Such behavior would help if variant is not available anymore or
if module in new modulepath does not express the same conflicts or
requirements.

In case of modulepath change and module reload, tags defined in the disabled
modulepath does not apply anymore to the reloading module. Tags defined in new
modulepath does. Extra tags are re-applied to the reloading module.

Unused modulepath
-----------------

When modulepath is unused from the command-line, nothing is unloaded as
dependency is based on *via* module. If *via* module is unloaded afterward,
dependency link is still active if ``require_via`` is enabled.

*CORNER CASE*: There is an exception if module is virtual since its modulepath
cannot be guessed for sure, thus the dependency link cannot be maintained with
such modules.

*FUTURE*: storing modulepath of loaded modulefiles in environment would help
to know for sure the modulepath where the virtual module is stored even if the
modulepath is no longer enabled in environment.

*NOTE*: When modulepath is unused from the command-line, Lmod inactivates
modules stored in this modulepath. If modulepath is unused externally and the
*via* module is then unloaded, Lmod still inactivates modules stored in this
modulepath.

*CORNER CASE*: if modulepath is unused, no *via* module loaded and modules
stored in this path are loaded, loading the *via* module for this part does
not trigger a reload of modules stored in this path. It is not known that the
module to load is the *via* module, thus modules stored in this path are not
set to reload prior this module load.

Several modules enabling same modulepath
----------------------------------------

When same modulepath is enabled by multiple modules, the *via* module is
determined, like other kinds of requirements, based on
:mconfig:`unload_match_order` configuration option:

* when it equals ``returnlast``: lastly loaded module before dependent is the
  *via* module
* when it equals ``returnfirst``: firstly loaded module before dependent is
  the *via* module

Any module enabling modulepath but loaded after dependent is considered a *Non
Particular Order* dependency. It is taken into account if regular *via* module
loaded before dependent is unloaded. In this case, the dependent is reloaded
to adopt the *via* module loaded afterward as its new dependency.

When several modules enabling same modulepath are loaded before the dependent,
unloading the one considered the *via* module currently unloads the dependent.
The other potential *via* modules are not taken into account, unless one is
loaded after the dependent module. Same behavior is observed with other kinds
of requirements.

*FUTURE*: take into account alternative *via* module loaded before dependent
when main one is unloaded, to reload dependent and bind it to the new *via*
module (lastly or firstly loaded one, depending on ``unload_match_order``).

.. vim:set tabstop=2 shiftwidth=2 expandtab autoindent:
