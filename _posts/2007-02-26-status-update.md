---
title: "Status Update"
date: 2007-02-26
author: ["mkanat"]
categories:
- Status
---

## Introduction and Updates

Today we've released the first Release Candidate for [Bugzilla 3.0](/releases/3.0/)! This has been fairly well-tested, since the code is running on [bugzilla.mozilla.org](https://bugzilla.mozilla.org/) and it's also been fully tested by our [QA Team](https://wiki.mozilla.org/Bugzilla:QA).

**Localizers**: Now is a good time to start translating templates for Bugzilla 3.0! We're going to freeze the templates as much as possible between now and the final release of 3.0, so if you translate the templates for rc1, you'll easily have a 3.0 translation.

## About Bugzilla 3.0rc1

The best place to find out about the release is the [release notes](/releases/3.0/), which are now in HTML and linked from the front page of every installation by default.

Provided all goes well with RC1, we expect to release the final version of Bugzilla 3.0 within a few weeks. If you find any important bugs that you think should prevent release of Bugzilla 3.0, please [file them](/contributing/reporting_bugs) and put a "?" in the blocking3.0 flag.

## Plugins!

One thing we'd really like to see for Bugzilla 3.0 is some plugins! Bugzilla 3.0 has a lot of ways to write plugins, and if it doesn't support what you want to do with your plugin, we'd be happy to add hooks for you. Right now we don't have a standard place to store plugins, but if you make one, link it from the [Bugzilla Addons](https://wiki.mozilla.org/Bugzilla:Addons) page, and then tell us on the [developers mailing list](https://lists.bugzilla.org/cgi-bin/mj_wwwusr?func=lists-long-full&extra=developers).

Also, if you know of any Bugzilla addons (or any other product that interacts with Bugzilla) that aren't listed on that page, please add them!

## What's Going on with the Bugzilla Project?

This is the little section where we tell you about the development team and new news about the actual development process.

We're just about to start work on our roadmap for Bugzilla 3.2, which will control our development for the next 6-9 months. We have a [draft roadmap](https://wiki.mozilla.org/Bugzilla:Roadmap) up now.

Max Kanat-Alexander (mkanat) and Frédéric Buclin (LpSolit) now have the power to approve bugs for checkin, meaning that there are now four "approvers" (including justdave and myk).

We have some plans to make it even easier to contribute to Bugzilla! Stay tuned to www.bugzilla.org for details.

## Upcoming EOL for Bugzilla 2.18

Users of Bugzilla 2.18 should be aware that it will reach End-Of-Life with the final release of Bugzilla 3.0\. Once Bugzilla 3.0 is released, no new patches will be released for Bugzilla 2.18, even for security issues.

We recommend that all Bugzilla 2.18 users upgrade to 2.22.2 (or 3.0, when it comes out) at their earliest convenience.

## Stay Updated About Bugzilla

As usual, we'd like to remind all Bugzilla administrators that to assist them in keeping up-to-date with release announcements and security advisories, we provide an ultra-low-volume administrator mailing list ([announce@bugzilla.org](https://lists.bugzilla.org/cgi-bin/mj_wwwusr?func=lists-full-long&extra=announce)). We advise all Bugzilla administrators to subscribe so they can keep up with important Bugzilla announcements.

Those looking to get involved with Bugzilla development may want to consider joining the [developers list (developers@bugzilla.org)](https://lists.bugzilla.org/cgi-bin/mj_wwwusr?func=lists-long-full&extra=developers). This list offers discussion on new features and issues. Developers are invited to subscribe to the list. You may also want to read our [Contributor's Guide](/contributing/).

## Bugzilla Meetings

Come to our [meetings](https://wiki.mozilla.org/Bugzilla:Meetings) every other week! Anybody is welcome to attend who is interested in helping out with the Bugzilla Project, or just anybody who wants to put in their two cents on how development should go.

You can learn more about the meetings at the [wiki page about Bugzilla Meetings](https://wiki.mozilla.org/Bugzilla:Meetings).
