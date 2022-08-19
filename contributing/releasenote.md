---
title: "Release Noting Guide"
---

The following is a guide for anyone who needs to work on the release
notes of Bugzilla which appear at docs/rel_notes.txt.

Release notes can be inserted as a part of a patch, especially if you
are willing to follow the appropriate style. The person responsible for
the release notes may end up changing what you wrote.

Typically however people are forgetful, so release notes are updated by
the release noter towards the end of the development cycle. The release
noter will attempt to discover what has been forgotten.

If you are not the release noter, to ensure things are release noted it
is generally easier to comment on the release notes bug for this
development version (search for "release notes") than create actual
patches.

## General Style Issues

Please attempt to follow the existing style of the release notes. In
particular, this means:

  - Please use present tense as opposed to past tense - "Bugzilla no
    longer falls over" as opposed to "Bugzilla fell over".
  - Please use the same heading style and heading titles for new
    sections and subsections.
  - Please use the same style for indicating bug numbers.
  - Please use the same style for differentiating separate issues.

## Updating Release Notes Before Release

The following gives a list of tasks that should be performed on the
release notes before release:

  - Update the introduction.
  - Update the dependencies section with any new dependencies.
  - Determine if any new deprecations have to be added.
  - Determine if the existing deprecations are now enforced and can
    therefore be removed.
  - Determine if there have been any new important outstanding issues
    discovered.
  - Determine if there are any previously outstanding issues fixed in
    this version, if so, move them to one of the subsections for this
    version.
  - Using a combination of Bonsai and Bugzilla, ensure all the
    subsections contain all significant issues. Do not include all
    issues or you will make the release notes too cluttered to be
    useful. All security issues go in the "Security Issues" section.
    Otherwise, if the administrator may need to know the issue, put it
    in the "Important Changes" section. Otherwise, if it is a bug fix,
    put it in the "Bug fixes" section. Otherwise, put it in the "Other
    Changes" section.
  - If there are new software requirements, add an entry into "Important
    Changes" documenting them, and similarly another entry for version
    requirement changes.
  - Release notes for previous versions are not kept for historical
    value, they are kept for administrators who are jumping over
    versions of Bugzilla. Hence, search the previous versions' notes and
    determine if any notes are no longer relevant and delete any that
    aren't.
  - Search bugs fixed during this development version for the text
    "release note", and see if there is anything that needs to be done
    indicated on any of these bugs.
  - Ensure you have taken into account all comments on the release notes
    "bug" for this development version.
  - Double check all your bug numbers.

## Updating Release Notes After Release

Once you have released, there are a few tasks you should do to prepare
for the development version:

  - Create new sections for the next stable release that is being
    developed. Create a new major section, and new subsections,
    "Security Issues", "Important Changes", "Other Changes", and "Bug
    Fixes".

  - Eliminate the introduction for the previous version, and insert text
    saying something like:
    
    ``` 
    2.108 has not been released yet - these are prerelease notes.
    
    Insert nice little intro for version 2.10.8 here.
    ```

## Stable Point Releases

Stable point releases are generally done on branches, and hence their
release notes can fork from those on the trunk.

However, administrators often jump from stable point releases up to the
next stable major release, so you need the trunk to indicate what has
changed since the point releases.

Hence, please ensure that the release notes are brought from the branch
to the trunk. You should place the section for that version before the
one for the current development version.

Furthermore, check that there aren't existing notes in the development
version section that instead apply to the stable point release section.
If so, move them there. If there is an similar note already in the
stable point release section, consolidate them there.
