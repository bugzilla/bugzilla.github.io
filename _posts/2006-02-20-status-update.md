---
title: "Status Update"
date: 2006-02-20
author: ["mkanat"]
categories:
- Status
---

## Introduction and Updates

It's been quite a few interesting months since our last Status Update, and there have been many interesting things happening in the Bugzilla Project! Thanks to the effort of the Bugzilla team, we're releasing our first Release Candidate for 2.22, which has been tested by QA and we think is pretty stable! We also have a huge number of bug-fixes in 2.20.1, making the very-stable 2.20 even better. Finally, we have some security fixes the 2.18 and 2.16 branches.

The future of the Bugzilla Project looks good. We have some good plans for Bugzilla development that you can read all about below.

Oh, and if you're using 2.16, remember that there won't be any more security fixes for that branch after we release the final version of 2.22, which will happen very soon. That means that 2.16 will be completely "dead," so upgrade as soon as possible!

As usual, we'd like to remind all Bugzilla administrators that to assist them in keeping up-to-date with release announcements and security advisories, we provide an ultra-low-volume administrator mailing list ([announce@bugzilla.org](https://lists.bugzilla.org/cgi-bin/mj_wwwusr?func=lists-full-long&extra=announce)). We advise all Bugzilla administrators to subscribe so they can keep up with important Bugzilla announcements.

Those looking to get involved with Bugzilla development may want to consider joining the [developers list (developers@bugzilla.org)](https://lists.bugzilla.org/cgi-bin/mj_wwwusr?func=lists-long-full&extra=developers). This list offers discussion on new features and issues. Developers are invited to subscribe to the list. You may also want to read our [Contributor's Guide](https://www.bugzilla.org/docs/contributor.html).

## New Releases

### 2.22rc1

This is our first Release Candidate of 2.22\. It's gone through QA Testing with our new Bugzilla QA Team, so we think it's fairly stable. However, it hasn't received a lot of wide-scale testing yet, so it should still only be used in testing environments.

However, we do encourage you to heavily test this release! We really think our next release will be 2.22 final, and it's your feedback that will determine if that's the case.

Since this is a Release Candidate, we also now have [release notes](/releases/2.22/) for the 2.22 series. You can read them to see what new features and bug fixes we have in the 2.22 series.

### 2.20.1

Bugzilla 2.20 was one of our most stable releases ever, thanks to our QA Team. However, we still managed to fix many, many bugs for the 2.20.1 release. This is probably the most bugs we've ever fixed for a point release. Basically, the 2.20 series is now even more polished than it was when we first released it.

We're aware of very few significant issues remaining on the 2.20 branch, which is good since it will likely go into "lockdown" mode with the release of 2.22\. That is, only security and dataloss bugs will be fixed on the 2.20 branch after we release 2.22.

If you want to know some of the major things we fixed for 2.20.1, you can read the [release notes](/releases/2.20.1/). If you want to see everything we fixed, you can use the [status changes page](https://github.com/bugzilla/bugzilla/compare/2.20) to see all the patches we've checked in on the 2.20 branch since the release of 2.20.

### 2.18.5 and 2.16.11

These are both just security fix releases. You can read the [Security Advisory](/security/2.18.4/) to see what we fixed.

Note that this is very likely to be the last 2.16 release, unless we do any further security fixes for the 2.16 branch along with the final 2.22 release.

## Trunk Re-opens

With the release of 2.22rc1, we have branched 2.22 development, and the trunk is now open! We plan to have the trunk open for a while this time, you can read about that in the "roadmap" section below.

Anyhow, this means go ahead and start hacking away! We have many great things lined up to check in right now, such as the beginnings of custom fields. Our next release should be great.

## Bugzilla Meetings

The Bugzilla Project now has [meetings](https://wiki.mozilla.org/Bugzilla:Meetings) every other week! Anybody is welcome to attend who is interested in helping out with the Bugzilla Project, or just anybody who wants to put in their two cents on how development should go.

You can learn more about the meetings at the [wiki page about Bugzilla Meetings](https://wiki.mozilla.org/Bugzilla:Meetings).

## Bugzilla 3.0: The Roadmap

So, we would very much like our next release of Bugzilla to be called 3.0\. In our very first Bugzilla Meeting, we decided that the three critical features we would have to have for that would be:

*   mod_perl support
*   Custom Fields
*   Better Skins

As such, those are our three primary goals right now. However, some other interesting things should be getting into 3.0 as well.

We have not yet decided to break any backwards-compatibility for 2.x users. 2.x users will definitely be able to upgrade to 3.0, no matter what we decide. However, if anybody would like to propose any backward-incompatible changes, now is the time!

To help plan our development, LpSolit (Frederic Buclin) drafted a [Bugzilla Roadmap](https://wiki.mozilla.org/Bugzilla:Roadmap) and we revised it during our first Bugzilla Meeting. Check it out, it shows where we're going and what our plans are, and it's very up-to-date.

If you want to add something to the roadmap, attend one of our [Bugzilla Meetings](https://wiki.mozilla.org/Bugzilla:Meetings) and make your suggestion.

Anything added to the roadmap needs somebody who can work on it. Although we'd certainly love every feature in the world to make it into 3.0, we only have a certain number of developers, and they only have a certain amount of time! That means that if you don't have the time to code an enhancement, don't suggest adding it to the roadmap (unless you can convince somebody else to work on it).

As you can see from the roadmap, we're expecting our next release to be in September. Yes, that's a long ways from now, but we'd like to call it 3.0, so we're giving it a bit of extra time. When July rolls around we may consider doing a 2.24, but we'll have to see how things are, at that time.

## Making It Easier to Start Working on Bugzilla

We've been engaged in making it easier to start working on Bugzilla, if you're a new contributor. We have a lot of ideas on how to do this, but we haven't had time to implement all of them. If you'd like to help make life easier for new developers, come into IRC and ask what you can do to help.

Right now, you can search for bugs that have the string "[Good Intro Bug]" in the Status Whiteboard. These are bugs that Bugzilla Developers think would be good for newcomers to the Bugzilla Project. They're usually somewhat-simple fixes that will give you an understanding of how Bugzilla works without requiring a lot of in-depth knowledge about Bugzilla.
