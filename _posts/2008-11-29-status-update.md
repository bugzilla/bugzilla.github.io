---
title: "Status Update"
date: 2008-11-29
author: ["mkanat"]
categories:
- Status
---

## Introduction and Updates

Today is the release of our first major feature update since 3.0, [Bugzilla 3.2](/releases/3.2/)! This status update will tell you a bit about Bugzilla 3.2, talk about some of its new features, and then talk about the road to Bugzilla 4.0.

## About Bugzilla 3.2

3.2 has a _lot_ of new features. In many ways, this is one of the releases that we've put the most "polish" into. After conquering a lot of major obstacles and doing lots of code clean-up to prepare for the Bugzilla 3.0 series, we were finally able to focus on a lot of usability issues and annoyances that we've always wanted to fix.

For example, we cleaned up the <kbd>show\_bug.cgi</kbd> UI, and thanks to the new UI, you can change the status of a bug and reassign it at the same time. We added mid-air collision protection to attachment updates. The Diff Viewer shows the line numbers of the files that are being patched. And _lots_ of other great improvements that will be appreciated by long-term users and new users alike, on top of all the [new major features](/releases/3.2) that we added.

## Bugzilla 3.2 Has Oracle Support

So, Bugzilla 3.2 is our first release to support Oracle as a database backend. It took a _lot_ of work to support Oracle for this release, and we're grateful that Oracle Corp. provided a developer to implement those changes.

Now, Bugzilla is an open-source project, and we don't advocate using proprietary database systems. We'd still recommend that new Bugzilla installations use MySQL or PostgreSQL, if you can. However, if your company uses Oracle and can't use anything else, now you can use Bugzilla!

Note that implementing Oracle support in Bugzilla was very complex, and so for Bugzilla 3.2, we're only saying that we have "experimental" support for it. We're aware of some bugs, and there may be other bugs we're not aware of. However, we're not aware of any _major_ issues that would totally prevent an organization from using Bugzilla on Oracle.

## The Road to Bugzilla 4.0

So, after we branched for 3.2, we wrote out a [roadmap for Bugzilla 4.0](https://wiki.mozilla.org/Bugzilla:Roadmap). For Bugzilla 4.0, our focus is _inter-Bugzilla communication_ and _integration_. That is, the ability for other tools to talk to Bugzilla, and for two Bugzilla installations to talk to each other. We want to have a greatly-improved WebServices interface for Bugzilla 4.0, among other features.

However, as we started to work toward these goals, it became apparent that they were too large for us to complete in one release cycle--we'd be waiting a year or two in order to get out Bugzilla 4.0, and we want to do regular releases.

So what we've decided is that Bugzilla 4.0 is a "feature-based release"--that is, we won't call Bugzilla "4.0" until we actually achieve our roadmap. The roadmap may change somewhat between now and 4.0, but we still have to finish whatever's on the roadmap to get to 4.0.

In the mean time, until we achieve those features, we are going to do _time-based_ releases in the 3.x series. So, for example, we are going to freeze for 3.4 exactly _two months_ after 3.2 is released, no matter what features 3.4 has at that time.

So, what you should be seeing from us in the near future are faster, smaller major releases, where we have a new major release approximately every six months, which is what we always wanted to do anyway. Then, after several of these smaller releases we will eventually reach the feature set required for 4.0, and that release will be called 4.0.

This whole system is an experiment, so if it doesn't work we might change our plans. But these are our plans for now.

## Bugzilla 2.20 Series End of Life

Now Bugzilla 3.2 final is released, the Bugzilla 2.20 series has reached End Of Life, meaning that no future security or bug fixes will be issued for 2.20 installations. We strongly advise Bugzilla administrators to upgrade their installations to version 3.2.

## Stay Updated About Bugzilla

As usual, we'd like to remind all Bugzilla administrators that to assist them in keeping up-to-date with release announcements and security advisories, we provide an ultra-low-volume administrator mailing list ([announce@bugzilla.org](https://lists.bugzilla.org/cgi-bin/mj_wwwusr?func=lists-full-long&extra=announce)). We advise all Bugzilla administrators to subscribe so they can keep up with important Bugzilla announcements.

Those looking to get involved with Bugzilla development may want to consider joining the [developers list (developers@bugzilla.org)](https://lists.bugzilla.org/cgi-bin/mj_wwwusr?func=lists-long-full&extra=developers). This list offers discussion on new features and issues. Developers are invited to subscribe to the list. You may also want to read our [Contributor's Guide](https://www.bugzilla.org/docs/contributor.html). You might also want to contribute to other [Bugzilla areas](https://wiki.mozilla.org/Bugzilla:Bugzilla:Teams).

## Bugzilla Meetings

Come to our [meetings](https://wiki.mozilla.org/Bugzilla:Meetings) every month! Anybody is welcome to attend who is interested in helping out with the Bugzilla Project, or just anybody who wants to put in their two cents on how development should go.

You can learn more about the meetings at the [wiki page about Bugzilla Meetings](https://wiki.mozilla.org/Bugzilla:Meetings).
