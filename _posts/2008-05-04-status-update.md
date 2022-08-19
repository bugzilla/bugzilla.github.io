---
title: "Status Update"
date: 2008-05-04
author: ["Cedrik"]
categories:
- Status
---

## Introduction and Updates

We've released four releases today: 3.0.4, 3.1.4, 2.22.4 and 2.20.6

A few security vulnerabilities were discovered in the four branches which you can read about in the [Security Advisory](/security/2.20.5/).

## About Bugzilla 3.1.4

3.1.4 is a lot more stable than 3.1.3 was, but it's still not a final release, so we don't recommend using it in a production environment. In particular, anybody using Oracle with Bugzilla should be extremely cautious about using this version of Bugzilla.

Here are a few significant enhancements in this release compared to 3.1.3:

*   The bug editing form has been redesigned.
*   Using 'Test' in mail_delivery_method now generates valid mbox file so you can easily perform QA tests.
*   Bugmail threading in email clients has been enhanced.
*   SMTP authentication is now supported.
*   A user who has product-specific editbugs privileges for all bugs listed in a bug list can now use the "Change several bugs at once" link to do mass-changes.
*   Custom fields can now be deleted if they have never been used.
*   More and more of Bugzilla now works correctly with multi-byte languages. Also, many UTF-8 problems from 3.1.3 have been fixed.
*   There have been various performance improvements in database access.

We encourage you to test this release and file bugs if you find things that are broken!

Our next development release should be 3.2 RC1, with an estimated release date in the second quarter of 2008\. Stay tuned!

## Bugzilla 2.20 Series End of Life

We would warn you that Bugzilla 2.20 series will soon reach End Of Life, meaning that no future security or bug fixes will be issued for 2.20 installations. We strongly advise Bugzilla administrators to upgrade their installations to version 3.0.4.

## Stay Updated About Bugzilla

As usual, we'd like to remind all Bugzilla administrators that to assist them in keeping up-to-date with release announcements and security advisories, we provide an ultra-low-volume administrator mailing list ([announce@bugzilla.org](https://lists.bugzilla.org/cgi-bin/mj_wwwusr?func=lists-full-long&extra=announce)). We advise all Bugzilla administrators to subscribe so they can keep up with important Bugzilla announcements.

Those looking to get involved with Bugzilla development may want to consider joining the [developers list (developers@bugzilla.org)](https://lists.bugzilla.org/cgi-bin/mj_wwwusr?func=lists-long-full&extra=developers). This list offers discussion on new features and issues. Developers are invited to subscribe to the list. You may also want to read our [Contributor's Guide](https://www.bugzilla.org/docs/contributor.html). You might also want to contribute to other [Bugzilla areas](https://wiki.mozilla.org/Bugzilla:Bugzilla:Teams).

## Bugzilla Meetings

Come to our [meetings](https://wiki.mozilla.org/Bugzilla:Meetings) every month! Anybody is welcome to attend who is interested in helping out with the Bugzilla Project, or just anybody who wants to put in their two cents on how development should go.

You can learn more about the meetings at the [wiki page about Bugzilla Meetings](https://wiki.mozilla.org/Bugzilla:Meetings).
