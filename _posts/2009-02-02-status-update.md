---
title: "Status Update"
date: 2009-02-02
author: ["mkanat"]
categories:
- Status
---

## Introduction and Updates

The Bugzilla Project has been making some really good progress lately. We've fixed all the oldest security bugs in Bugzilla with this set of releases, and we've also done a tremendous amount of feature development and general improvement work toward Bugzilla 3.4.

The security fixes in this upgrade are worth reading about, since some functionality in your Bugzilla may change after this upgrade, depending on how you choose to configure certain parameters. See the [Security Advisory](/security/2.22.6/) for Details.

## About Bugzilla 3.3.2

Even though it's only been a few weeks, we've done a tremendous amount of development between 3.3.1 and 3.3.2.

The Bugzilla Project is especially thankful to [Canonical](http://www.canonical.com/), who funded [Everything Solved](http://www.everythingsolved.com/) to add a bunch of new WebServices functions and an exciting new "See Also" field where you can put the URLs to bugs in other Bugzilla installations.

There are lots more features than just those, though. Here's a summary of the major new enhancements in 3.3.2 since 3.3.1:

*   Email addresses are now only displayed to logged-in users.
*   Aliases are displayed instead of bug ids in the Depends On and Blocks lists, if the bugs have aliases.
*   A "See Also" field that accepts URLs to Bugzilla bugs and Launchpad bugs, designed to allow you to refer to bugs in other installations. This won't be getting any new functionality for Bugzilla 3.4, but future releases will automatically update the other Bugzilla to let it know that you set a See Also.
*   New WebService methods: Bug.update_see_also, Bug.search, Bug.comments, Bugzilla.time
*   The WebService Bug.get method now returns more fields.
*   The WebService Bug.add_comment method now returns the comment_id of the added comment.
*   More of Bugzilla now uses the shadow DB when possible.
*   You now have the option to view more details information in time-tracking summary reports.

And we expect Bugzilla 3.4 to have a few more new features than those, too.

The current estimated release date for Bugzilla 3.4 is May 15, 2009, although that's a very rough estimate and may change.

## Stay Updated About Bugzilla

As usual, we'd like to remind all Bugzilla administrators that to assist them in keeping up-to-date with release announcements and security advisories, we provide an ultra-low-volume administrator mailing list ([announce@bugzilla.org](https://lists.bugzilla.org/cgi-bin/mj_wwwusr?func=lists-full-long&extra=announce)). We advise all Bugzilla administrators to subscribe so they can keep up with important Bugzilla announcements.

Those looking to get involved with Bugzilla development may want to consider joining the [developers list (developers@bugzilla.org)](https://lists.bugzilla.org/cgi-bin/mj_wwwusr?func=lists-long-full&extra=developers). This list offers discussion on new features and issues. Developers are invited to subscribe to the list. You may also want to read our [Contributor's Guide](https://www.bugzilla.org/docs/contributor.html). You might also want to contribute to other [Bugzilla areas](https://wiki.mozilla.org/Bugzilla:Bugzilla:Teams).

## Bugzilla Meetings

Come to our [meetings](https://wiki.mozilla.org/Bugzilla:Meetings) every month! Anybody is welcome to attend who is interested in helping out with the Bugzilla Project, or just anybody who wants to put in their two cents on how development should go.

You can learn more about the meetings at the [wiki page about Bugzilla Meetings](https://wiki.mozilla.org/Bugzilla:Meetings).

