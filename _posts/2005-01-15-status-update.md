---
title: "Status Update"
date: 2005-01-15
author: ["jake"]
categories:
- Status
---

## Introduction

It's been about 3 months since our [last update](2004-10-24.html) and the corresponding 3rd release candidate for Bugzilla 2.18, but at long last we are pleased to announce the full release of Bugzilla 2.18\. Though it's been more than 2 1/2 years in the making, we think you'll find the [new features](/releases/2.18/) were worth the wait.

If you didn't get an email notification of this new release, but would like to for future releases, be sure to [subscribe](https://lists.bugzilla.org/cgi-bin/mj_wwwusr?func=lists-full-long&extra=announce) to our "announce" list. This is a low volume mailing list that covers releases and security advisories. We recommend that all Bugzilla administrators subscribe to this list.

If you're looking to get more involved in the actual development of Bugzilla, you may wish to consider joining the [developer's list](https://lists.bugzilla.org/cgi-bin/mj_wwwusr?user=&passw=&func=lists-long-full&extra=developers). This higher volume list is used by the development team to discuss many aspects of the development process and Bugzilla's future.

## New Releases

### 2.18

More than 2 1/2 years in the making, 2.18 is our latest stable release of Bugzilla. This new version offers an impressive list of [new features](/releases/2.18/) as well as a number of bug fixes over 2.16, our previous stable release. The security fixes in 2.16.8 are included in 2.18 as well.

As always, be sure you have a good backup before attempting to upgrade to Bugzilla 2.18\. There are many irreversible database changes between 2.16 and 2.18\. While we don't anticipate any problems with the migration, it never hurts to be safe.

### 2.16.8

If you are unable or currently unwilling to upgrade to 2.18, we highly recommend that you upgrade to 2.16.8\. In addition to some very small yet useful bugfixes, there are also security issues with 2.16.7 that have been fixed for 2.16.8.

### 2.19.2

The latest in our bleeding edge trunk development is now 2.19.2\. This development snapshot doesn't have any major new features over 2.19.1, but it does have the same security fixes as 2.16.8 and 2.18\. There are also many bugfixes to the new features from 2.19.1 as well as a few small usability enhancements.

If you are currently running 2.19.1, we highly recommend that you update to 2.19.2\. Remember that development snapshots are not recommended for production use unless you have a competent Perl programmer available. They may work perfectly well, but they've had less testing.

## Security Bugs Fixed

These releases contain fixes for security bugs that exist in prior versions of Bugzilla. Be sure to read the [Security Advisory](/security/2.16.7-nr) for more information.

## It's finally over!

**An update from Dave Miller, Project Leader**

Our 9 month branch freeze for 2.18 is finally over, that is. It took a long time because of the two years of free development to clean up after, but it's resulted in one of our best releases yet! And the upcoming 2.20 is showing signs of being even better!

First off I'd like to thank all of the developers for putting up with the "harsh working conditions" of trying to stablize the 2.18 branch and the current cvs trunk as well over the last three months.

Although the trunk is quite stable at the moment as a result, we decided it would be very confusing to shove another release down everyone's throats just a few weeks later, so the trunk has been reopened, and we'll be freezing again for 2.20 in March (hopefully releasing in April). As a result, we've pushed back our previous release schedule by 6 months, so 2.22 will be freezing in September 2005, and releasing a month or so later.

We will be honoring our earlier promise to support the 2.16 branch until version 2.22 releases, which puts the End-Of-Life date for Bugzilla 2.16.x somewhere in the vicinity of October 2005.

## Checkins Since Last Update

Our last status update happened to coincide with our last release, which makes finding the change list pretty easy. Just visit our [changes](https://github.com/bugzilla/bugzilla/compare/) page and pick the link for changes between the previous and current releases.
