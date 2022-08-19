---
title: "Status Update"
date: 2008-08-12
author: ["mkanat"]
categories:
- Status
---

## Introduction and Updates

Today we released three versions of Bugzilla: 3.0.5, 3.2rc1, and 2.22.5.

3.0.5 has general bug fixes and small polishes for the 3.0.x series.

3.2rc1 is our first release candidate for 3.2, and if everything goes well, we expect our next release to be 3.2.

2.22.5 only contains a security fix, the same security fix that all today's releases contain. You can read more about it in the [Security Advisory](/security/2.22.4/).

## About Bugzilla 3.2rc1

The major difference between a Release Candidate and a development release is that a Release Candidate goes through QA. Also, a Release Candidate has [Release Notes](/releases/3.2/) so you can see all the new features we've added, and any other things that you should know about.

Not all of our automated QA scripts have been updated yet for 3.2, but 3.2rc1 has passed all of the automated QA tests that are currently available. Our [QA Team](https://wiki.mozilla.org/Bugzilla:QA) could always use help, if you're interested.

3.2rc1 should be fairly stable, but of course it is not a final release. We encourage people to go out and install it in a test environment, but important installations should not be using it in production.

## Work Toward Bugzilla 4

If you were paying attention closely, you may have noticed that we branched for Bugzilla 3.2 some time ago. The Bugzilla 3.2 code lives on a branch called <kbd>BUGZILLA-3_2-BRANCH</kbd>, and the current CVS <kbd>HEAD</kbd> has a version of 3.3.

Usually we wait for a Release Candidate to branch, but this time we branched as soon as we were frozen for 3.2, to encourage further feature development toward Bugzilla 4\. (Bugzilla 3.3 will most likely become Bugzilla 4, although there may be a 3.4 release before Bugzilla 4.)

Generally, you _really_ should **not** be using 3.3, as that's our super-unstable, bleeding-edge code.

The major focus of Bugzilla 4 is _integration_. We want to have a full XML-RPC API and a powerful extensions system for Bugzilla. Our general plans for Bugzilla 4 can be seen on the [Bugzilla Roadmap](https://wiki.mozilla.org/Bugzilla:Roadmap).

## Bugzilla 2.20 Series End of Life

When Bugzilla 3.2 final is released, the Bugzilla 2.20 series will reach End Of Life, meaning that no future security or bug fixes will be issued for 2.20 installations. We strongly advise Bugzilla administrators to upgrade their installations to version 3.0.5.

## Stay Updated About Bugzilla

As usual, we'd like to remind all Bugzilla administrators that to assist them in keeping up-to-date with release announcements and security advisories, we provide an ultra-low-volume administrator mailing list ([announce@bugzilla.org](https://lists.bugzilla.org/cgi-bin/mj_wwwusr?func=lists-full-long&extra=announce)). We advise all Bugzilla administrators to subscribe so they can keep up with important Bugzilla announcements.

Those looking to get involved with Bugzilla development may want to consider joining the [developers list (developers@bugzilla.org)](https://lists.bugzilla.org/cgi-bin/mj_wwwusr?func=lists-long-full&extra=developers). This list offers discussion on new features and issues. Developers are invited to subscribe to the list. You may also want to read our [Contributor's Guide](https://www.bugzilla.org/docs/contributor.html). You might also want to contribute to other [Bugzilla areas](https://wiki.mozilla.org/Bugzilla:Bugzilla:Teams).

## Bugzilla Meetings

Come to our [meetings](https://wiki.mozilla.org/Bugzilla:Meetings) every month! Anybody is welcome to attend who is interested in helping out with the Bugzilla Project, or just anybody who wants to put in their two cents on how development should go.

You can learn more about the meetings at the [wiki page about Bugzilla Meetings](https://wiki.mozilla.org/Bugzilla:Meetings).
