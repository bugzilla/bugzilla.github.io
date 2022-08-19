---
title: "Status Update"
date: 2008-02-01
author: ["Cedrik", "mkanat"]
categories:
- Status
---

## Introduction and Updates

When we released 3.0.3, Bugzilla 3.1.3 wasn't quite ready to release. But today, few weeks after the 3.0.3 all the features we wanted for this development release are ready, and so we're releasing today!

3.1.3 has lots of new features as you can read about it below, but it's still unstable, so you definitely should not use it in a production environment.

## About Bugzilla 3.1.3

Here are some highlights:

*   Bugzilla now has **experimental** support for Oracle databases. Please note that you cannot currently upgrade an Oracle database. That is, if you install Bugzilla on Oracle, you will have to drop the entire database to upgrade to any new version. This will _probably_ be fixed before the final release of 3.2.
*   The user interface for editing bugs has been redesigned. It will be even better in the final release of Bugzilla 3.2.
*   Huge performance and memory improvements for mod_perl users (same fix that was in 3.0.3.)
*   Incoming bugmail is now converted to UTF-8.
*   Bugzilla now uses transactions instead of locking the database tables.
*   Various LDAP handling improvements.
*   Plugins can now extend the Webservice interface.
*   There's now a tool to auto-install missing Perl packages on non-Windows systems. It can install to a local directory, so you don't even have to be root or modify your system's Perl installation.
*   Mid-Air Collision protection for attachments.
*   Many useless intermediate pages have been removed, especially in admin pages.
*   You can now add comments to bugs using XML-RPC.
*   New custom field type: Date/Time field, with a JavaScript widget for picking a date.
*   You can now reverse the sort of a buglist by clicking on a header twice.
*   Bugzilla's support for multi-byte languages has greatly improved. We did this by making Bugzilla treat strings as "characters" instead of as "bytes."

Also, if you've ever looked at the code for <kbd>process_bug.cgi</kbd>, we encourage you to look at its code in this new release and see how different it is!

We encourage you to test this release and file bugs if you find things that are broken!

## Documentation

The documentation has been improved: many new sections that were missing were added and most of the user interface pages have now links towards the appropriate section.

## The New User Experience Team

Bugzilla now has a [User Experience Team](https://wiki.mozilla.org/Bugzilla:UE) that focuses on improving Bugzilla's user interface and the general experience that users have. If you're interested in helping out, email the team leader, [Guy Pyrzak](mailto:guy.pyrzak@gmail.com)!

## The New Localization Team

Bugzilla now has [a team of contributors that focuses on making Bugzilla easier to localize](https://wiki.mozilla.org/Bugzilla:L10N). They are currently researching what things need to be done to improve Bugzilla's localizability. The team's coordinator is Vitaly Fedrushkov from Russia (SnowyOwl on IRC). If you are interested in helping out, let him know on IRC, or let one of the Bugzilla developers know and they will pass it on to him.

## FAQ Moved to the Wiki

For the Bugzilla 3.2 documentation, we've decided to move the Bugzilla FAQ onto [our wiki](https://wiki.mozilla.org/Bugzilla). You can see it here: [Bugzilla:FAQ](https://wiki.mozilla.org/Bugzilla:FAQ). We encourage any experienced Bugzilla administrators to look over the current questions, make sure they're up to date, and add any new questions that need to be added!

## Stay Updated About Bugzilla

As usual, we'd like to remind all Bugzilla administrators that to assist them in keeping up-to-date with release announcements and security advisories, we provide an ultra-low-volume administrator mailing list ([announce@bugzilla.org](https://lists.bugzilla.org/cgi-bin/mj_wwwusr?func=lists-full-long&extra=announce)). We advise all Bugzilla administrators to subscribe so they can keep up with important Bugzilla announcements.

Those looking to get involved with Bugzilla development may want to consider joining the [developers list (developers@bugzilla.org)](https://lists.bugzilla.org/cgi-bin/mj_wwwusr?func=lists-long-full&extra=developers). This list offers discussion on new features and issues. Developers are invited to subscribe to the list. You may also want to read our [Contributor's Guide](https://www.bugzilla.org/docs/contributor.html). You might also want to contribute to other [Bugzilla areas](https://wiki.mozilla.org/Bugzilla:Bugzilla:Teams).

## Bugzilla Meetings

Come to our [meetings](https://wiki.mozilla.org/Bugzilla:Meetings) every month! Anybody is welcome to attend who is interested in helping out with the Bugzilla Project, or just anybody who wants to put in their two cents on how development should go.

You can learn more about the meetings at the [wiki page about Bugzilla Meetings](https://wiki.mozilla.org/Bugzilla:Meetings).
