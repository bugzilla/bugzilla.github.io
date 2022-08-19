---
title: "Status Update"
date: 2007-08-23
author: ["mkanat"]
categories:
- Status
---

## Introduction and Updates

We've released several releases today, and lots of exciting things are happening in the world of Bugzilla development!

3.0 was very stable, but 3.0.1 has a lot of great polish fixes for the 3.0 series, making it our best release ever.

3.1.1 has lots of new features, and you can read about it below, but it's **very** unstable. We found critical bugs in it right up to the moment of release, so you definitely should not use it in a production environment.

2.22.3 fixes some critical bugs in the 2.22 series. 2.20.5 fixes one critical bug.

All of the releases also contain security fixes, which you can read about in the [Security Advisory](/security/2.20.4/).

## About Bugzilla 3.1.1

All of the other releases have release notes, but this one has lots of new features and no release notes! So here's some highlights:

*   More fields in Atom-formatted bug lists.
*   Bugzilla includes some microformats on show_bug.cgi and a few other places.
*   Bugzilla is fully templatized now, with the templatization of <kbd>sanitycheck.cgi</kbd>.
*   The UI for editing a group in <kbd>editgroups.cgi</kbd> got a major overhaul.
*   You can save a column list with your Saved Searches now.
*   You can specify multiple fail-over LDAP servers for authentication.
*   <kbd>process_bug.cgi</kbd> is in the middle of a major overhaul. Most of its code is being moved into <kbd>Bugzilla::Bug</kbd>.
*   Bugzilla now uses InnoDB tables for MySQL.
*   Bugzilla now uses database transactions in several places.
*   Bugzilla now enforces referential integrity in several places at the database level.
*   Even more of checksetup.pl is now localizable.
*   checksetup.pl now prints out modules in the order they should be installed.
*   The various administrative control panel links have been removed from the footer in favor of a single "Administration" link that goes to a new page that has links to all the various administrative controls.
*   You can expand/collapse comments when viewing a bug.
*   You can limit the recursion level of dependency graphs, now.
*   You can now customize bug statuses and their relationships.
*   The "Help" system (usually seen on query.cgi) now should work in all browsers, not just Firefox.
*   You can now see what Components a user is the Default Assignee or QA Contact of when you edit the user as an administrator.
*   The Keywords box is now enhanced with JavaScript to make editing the field easier.
*   You can now see how many users have subscribed to your Saved Search.
*   If you have a bug in groups and you move it to another product, Bugzilla is now more friendly about asking you what groups you want the bug to be/remain in.
*   If you have <kbd>usemenuforusers</kbd> turned on, Bugzilla will now show a drop-down box for flag requestees containing only people in the grant group.
*   Saved Searches now list what group they are shared to, in the list of searches you can select from.
*   Bugzilla now supports RADIUS authentication.
*   You can now have icons placed next to users who are in certain groups.
*   Bugzilla now requires Perl 5.8.1 or newer.
*   Bugzilla now has a new look that you can choose with the "Dusk" skin.
*   The [%# 1.0@bugzilla.org %] comments at the top of every template file have been removed, as we never used them for their intended purpose.
*   The <kbd>languages</kbd> parameter has been removed. Bugzilla now just reads the contents of the <kbd>template/</kbd> directory to discover what languages are installed.

Remember though that most of these features haven't received any testing at all! So they might not even work. But we encourage you to test this release and file bugs if you find things that are broken!

## Development Schedule for 3.2

We've changed our schedule to accomodate our current development and our goals for Bugzilla 3.2.

Our "soft freeze" (where we don't accept new feature patches, but we will work on finishing up bugs that we currently have in progress) is tentatively planned for September 21, and our "hard freeze" (where we don't accept any new features at all) on October 2\.

The more [contributors](/contribute/) we get, particularly in the area of Release and QA, the faster we can get this release out when it's ready!

## Upcoming EOL of Bugzilla 2.20

With the release of Bugzilla 3.2, the Bugzilla 2.20.x series will reach End Of Life, meaning that there won't be any further bug-fix updates, even if critical security issues are discovered.

We recommend that all Bugzilla 2.20 users upgrade to 3.0.1 at their earliest convenience. [Upgrade instructions](/releases/3.0.1/#v30_upgrading) are in the Bugzilla 3.0 Release Notes.

## New Contributor Documentation

The documentation for people who want to contribute to Bugzilla has been completely overhauled! Check out our [new contributor documentation](https://wiki.mozilla.org/Bugzilla:Developers).

## Stay Updated About Bugzilla

As usual, we'd like to remind all Bugzilla administrators that to assist them in keeping up-to-date with release announcements and security advisories, we provide an ultra-low-volume administrator mailing list ([announce@bugzilla.org](https://lists.bugzilla.org/cgi-bin/mj_wwwusr?func=lists-full-long&extra=announce)). We advise all Bugzilla administrators to subscribe so they can keep up with important Bugzilla announcements.

Those looking to get involved with Bugzilla development may want to consider joining the [developers list (developers@bugzilla.org)](https://lists.bugzilla.org/cgi-bin/mj_wwwusr?func=lists-long-full&extra=developers). This list offers discussion on new features and issues. Developers are invited to subscribe to the list. You may also want to read our [Contributor's Guide](https://www.bugzilla.org/docs/contributor.html).

## Bugzilla Meetings

Come to our [meetings](https://wiki.mozilla.org/Bugzilla:Meetings) every month! Anybody is welcome to attend who is interested in helping out with the Bugzilla Project, or just anybody who wants to put in their two cents on how development should go.

You can learn more about the meetings at the [wiki page about Bugzilla Meetings](https://wiki.mozilla.org/Bugzilla:Meetings).
