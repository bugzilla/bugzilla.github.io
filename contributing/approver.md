---
title: "Approvers' Guide"
---

The purpose of approval is for the project leader to be able to keep
control of the entire Bugzilla product, to ensure similar, bad or
conflicting features aren't introduced. Approval does not usually
involve in depth review of code, although nothing prohibits this. If
approval isn't granted, the approver might decide to ask for a
re-review, a new patch, or resolve the bug entirely without check in.

Since the repository is publicly visible, security fixes must only be
committed immediately before a new package is released. See the
documentation on how to
[release](https://www.bugzilla.org/contributing/release.html).

## Current Approvers

Only blessed approvers can approve bugs, currently:

  - justdave
  - glob

## Approval Process

  - **approval+** if the patch and idea is good
  - **approval-** if the concept of the bug is not good. this is
    identical to WONTFIX (i don't know why this exists)
  - If the concept of a bug is good, but the patch isn't, add a
    **review-** to the patch

## Branch Policies

  - **Trunk**
      - No restrictions on approved checkins
      - Flag: **approval+**
  - **Current Stable**
      - Bug fixes and performance improvements only, no new features
        large scale performance improvements may not be eligible
      - Schema changes are not allowed
      - Documentation changes are allowed
      - Changes to the documentation in docbook or perldoc format
      - Excludes any changes to templates that aren't part of bug fix,
        other than typos or grammatical fixes
      - Example flag depending on current stable release:
        **approval4.4+**
  - **Prior Releases**
      - Current policy is the last two releases before the current
        stable
      - Security, crash, data loss, and selected critical fixes only
      - No documentation changes unrelated to the above changes allowed
      - Example flags depending on prior two release versions:
        **approval4.0+** and **approval 4.2+**
  - **Obsolete Versions**
      - No changes allowed
