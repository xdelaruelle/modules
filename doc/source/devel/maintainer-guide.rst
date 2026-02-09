.. _maintainer-guide:

Maintainer guide
================

Maintainers ensure that the project remains reliable, sustainable, and aligned
with :ref:`its mission<CHARTER>`. Maintainers oversee contributions, manage
releases, guide contributors, and uphold project standards.

Maintainers are stewards of both the code-base and the community. Strive to
balance technical excellence with empathy and collaboration. Core
responsibilities are described below.

Code stewardship
----------------

* Review and merge pull requests (PRs) carefully and fairly.
* Ensure that all code follows project **coding standards**, **testing**, and
  **documentation** requirements.
* Keep the main branch in a **buildable and releasable** state.
* Maintain compatibility across supported platforms (e.g., Linux, macOS, BSDs,
  Windows).

Community management
--------------------

* Engage respectfully with users and contributors via:

  - GitHub issues and pull requests
  - Mailing list and chat
  - HPC community events

* Mentor new contributors and ensure a welcoming, inclusive culture.
* Enforce and model the project’s `Code of conduct`_.

.. _Code of conduct: https://github.com/envmodules/modules?tab=coc-ov-file#readme

Issue and pull request triage
-----------------------------

* Label issues appropriately (``bug``, ``enhancement``, ``question``, etc.).
* Review pull requests for:

  - Completeness (tests, docs)
  - Coding style and maintainability
  - Reproducibility of reported issues

* Merge (rebase merging) once review and CI checks are passed.

Documentation & communication
-----------------------------

* Keep user and developer documentation up to date.
* Maintain consistency between ``README``, ``INSTALL``, and manual pages.
* Communicate major changes through release notes, mailing list, chat and
  social media.

Infrastructure & tooling
------------------------

* Maintain CI pipelines and automated test coverage.
* Manage GitHub Actions, Cirrus, test scripts, and build tools.
* Ensure reproducibility and backward compatibility across builds.

Reference materials
-------------------

* :ref:`CHARTER`
* :ref:`GOVERNANCE`
* :ref:`CONTRIBUTING`
* :ref:`create-new-release`
* :ref:`plan-next-release-content`
* :ref:`organize-tsc-meeting`
* `Security policy`_

.. _Security policy: https://github.com/envmodules/modules/security

.. vim:set tabstop=2 shiftwidth=2 expandtab autoindent:
