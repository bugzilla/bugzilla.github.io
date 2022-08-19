---
title: "Status Update"
date: 2009-01-05
author: ["mkanat"]
categories:
- Status
---

## Introduction and Updates

Today we have an unstable development release, Bugzilla 3.3.1\. This is our first development snapshot toward Bugzilla 3.4\. There aren't any release notes yet for it, so we're just going to talk about the release here in the status update and highlight a few of the new features.

## About Bugzilla 3.3.1

Bugzilla 3.3.1 has been under development for quite some time. We branched for 3.4 in May of 2008, but our main development focus was still 3.2 until it was released. So 3.4 got some occasional new features for a long time, and then a lot of enhancements recently, after we released 3.2.

Bugzilla 3.4 is going to be a time-based release, meaning that we're going to have a feature freeze on January 29 no matter how many features we have, or what the features look like. Hopefully this should allow us to release relatively quickly and have a Bugzilla 3.4 by May.

However, since we're freezing very soon, it's important that you let us know what you think about the new features! Either download the [new development release](/download/#v34) or go check out the features using one of the "CVS" installations on [landfill](https://landfill.bugzilla.org/).

Here's a list of some of the new features in 3.3.1:

*   Users can now choose what time zone to display times in.
*   New custom field type: Bug ID
*   You can now show or hide particular custom fields based on the value of another field.
*   The list of values for a drop-down or multi-select custom field can now be different depending on the value of another field.
*   When you do a search, you will now see a basic description of what you searched for at the top of the bug list.
*   New WebService functions: Bug.get_history, User.get
*   You can now update the dependency fields when changing several bugs at once.
*   You can now use drop-down custom fields as axises in reports.
*   There is now an email preference that allows you to receive mail when a bug is newly created.
*   You can now see summarized timetracking data at the bottom of a bug list.
*   You can now re-order the columns of a bug list.
*   Bugzilla now uses SHA-2 to store passwords in the database instead of the Unix crypt() function. This allows Bugzilla to recognize passwords longer than eight characters.
*   Various parameters have been removed and replaced with Bugzilla behaving sensibly by default.
*   The X-Bugzilla-Type header in bugmail now differentiates between bugmails for new bugs and bug updates.
*   You can now add private comments when changing several bugs at once.
*   Abbreviated data in bug lists is shown fully in tooltips.
*   When you run checksetup.pl, it will re-write your <kbd>localconfig</kbd> file, update the comments, and remove any old variables automatically.
*   If you try to put an invalid regular expression into any field that accepts a regex, Bugzilla will now throw an error instead of just failing on the database side.

## Stay Updated About Bugzilla

As usual, we'd like to remind all Bugzilla administrators that to assist them in keeping up-to-date with release announcements and security advisories, we provide an ultra-low-volume administrator mailing list ([announce@bugzilla.org](https://lists.bugzilla.org/cgi-bin/mj_wwwusr?func=lists-full-long&extra=announce)). We advise all Bugzilla administrators to subscribe so they can keep up with important Bugzilla announcements.

Those looking to get involved with Bugzilla development may want to consider joining the [developers list (developers@bugzilla.org)](https://lists.bugzilla.org/cgi-bin/mj_wwwusr?func=lists-long-full&extra=developers). This list offers discussion on new features and issues. Developers are invited to subscribe to the list. You may also want to read our [Contributor's Guide](https://www.bugzilla.org/docs/contributor.html). You might also want to contribute to other [Bugzilla areas](https://wiki.mozilla.org/Bugzilla:Bugzilla:Teams).

## Bugzilla Meetings

Come to our [meetings](https://wiki.mozilla.org/Bugzilla:Meetings) every month! Anybody is welcome to attend who is interested in helping out with the Bugzilla Project, or just anybody who wants to put in their two cents on how development should go.

You can learn more about the meetings at the [wiki page about Bugzilla Meetings](https://wiki.mozilla.org/Bugzilla:Meetings).
