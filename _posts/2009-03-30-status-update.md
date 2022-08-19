---
title: "Status Update"
date: 2009-03-30
author: ["mkanat"]
categories:
- Status
---

## Introduction and Updates

We released two versions of Bugzilla today. Bugzilla 3.2.3 has some important bug fixes, and Bugzilla 3.3.4 is our latest development snapshot.

## About Bugzilla 3.3.4

Bugzilla 3.3.4 is our latest development release leading up to Bugzilla 3.4\. Bugzilla 3.3.4 is feature-complete. This means that from here on out until the final release of Bugzilla 3.4, we will only be fixing bugs on the 3.4 branch--we won't be adding any new features.

Bugzilla 3.3.4 is still unstable, and should not be used in production environments. There are still known bugs that have not been fixed, in this release.

There have been a few big changes since Bugzilla 3.3.3:

*   There is a brand-new super-simple front page for Bugzilla.
*   The form for filing a bug is now much simpler by default.
*   Obsolete attachments are now hidden by default, on a bug.
*   You can now log in using a form in the header and footer on every page in Bugzilla.
*   When editing a bug, text inputs grow with your browser window.
*   When you log out of Bugzilla, you will be sent to the front page, not just a blank page with a message saying you've logged out.
*   The `Bug.get` WebService function now accepts a "permissive" argument that can be used to make it not die on errors.
*   You can now have custom fields only show up in a particular product.

Development for Bugzilla 3.4 is now done on the **`BUGZILLA-3_4-BRANCH`** branch in CVS instead of on trunk. So if you are updating via CVS, make sure to do `cvs -q up -dP -r BUGZILLA-3_4-BRANCH` when updating, if you want to stay on the 3.4 branch.

The trunk (`HEAD`) is open for feature development toward Bugzilla 3.6.

## Stay Updated About Bugzilla

As usual, we'd like to remind all Bugzilla administrators that to assist them in keeping up-to-date with release announcements and security advisories, we provide an ultra-low-volume administrator mailing list ([announce@bugzilla.org](https://lists.bugzilla.org/cgi-bin/mj_wwwusr?func=lists-full-long&extra=announce)). We advise all Bugzilla administrators to subscribe so they can keep up with important Bugzilla announcements.

Those looking to get involved with Bugzilla development may want to consider joining the [developers list (developers@bugzilla.org)](https://lists.bugzilla.org/cgi-bin/mj_wwwusr?func=lists-long-full&extra=developers). This list offers discussion on new features and issues. Developers are invited to subscribe to the list. You may also want to read our [Contributor's Guide](https://www.bugzilla.org/docs/contributor.html). You might also want to contribute to other [Bugzilla areas](https://wiki.mozilla.org/Bugzilla:Bugzilla:Teams).

## Bugzilla Meetings

Come to our [meetings](https://wiki.mozilla.org/Bugzilla:Meetings) every month! Anybody is welcome to attend who is interested in helping out with the Bugzilla Project, or just anybody who wants to put in their two cents on how development should go.

You can learn more about the meetings at the [wiki page about Bugzilla Meetings](https://wiki.mozilla.org/Bugzilla:Meetings).
