---
title: "Status Update"
date: 2005-05-11
author: ["jake"]
categories:
- Status
---

## Introduction

The previous three months have seen some of the most active Bugzilla development in history. The 2.20 release is promising to be very impressive. The team has been hard at work to bring long awaited features such as bugmail threading support and an optional third level of classification (in addition to the current Products and Components).

If you're looking to get more involved in the actual development of Bugzilla, you may wish to consider joining the [developer's list](https://lists.bugzilla.org/cgi-bin/mj_wwwusr?func=lists-long-full&extra=developers). This higher volume list is used by the development team to discuss many aspects of the development process and Bugzilla's future.

## New Releases

### 2.18.1

2.18.1 is our first bug-fix release for 2.18\. Overall, the initial 2.18 release proved to be pretty stable, but a few polishes and bug-fixes made their way into 2.18.1, and we do encourage anybody running 2.18 to update to 2.18.1.

### 2.19.3

The latest in our bleeding edge trunk development is now 2.19.3\. This version has seen significant changes since 2.19.2 was released and, once fully stable, will become 2.20\. Like all development releases, this has received much less testing than a stable release. Because of the feverish pace of development during this latest cycle, this version is actually slightly less stable than a typical development release.

If you are currently running 2.19.2, this update to 2.19.3 should be considered "at your own risk." The pace of development between 2.19.2 and 2.19.3 has been frenzied and there could still be issues in the code. If you are willing to try out 2.19.3 and help us with the regression testing, it would be most appreciated. Remember that development snapshots are not recommended for production use unless you have a competent Perl programmer available. They may work perfectly well, but they've had less testing.

## Security Bugs Fixed

We fixed two minor security issues in our three most recent releases. See the [Security Advisory](/security/2.16.8/) for details.

## Major Recent Developments

### Internal API Changes

In order to better facilitate future changes to the code many of Bugzilla's internal functions have been moved into modules and/or changed names. This will not matter to the average user of Bugzilla; however, this may cause some minor problems for administrators who have made customizations to the code of their local installation. This has also caused many patches on [bugzilla.mozilla.org](https://bugzilla.mozilla.org) to no longer apply cleanly.

However, these internal APIs are expected to remain fairly stable between now and the final release of 2.20.

### Cross-Database Compatability

The team is very excited to see one of the most requested changes to Bugzilla finally starting to take shape. While it's not likely to be fully supported for the 2.20 release, there has been major progress made toward allowing Bugzilla to run on more than just the MySQL database server. We have decided to start the database portability with PostgreSQL, but we won't stop there. Once the infrastructure is fully in place, it will make adding support for other ANSI compatible database servers trivial.

The 2.19.3 development release is the first official release that is able to create a database on PostgreSQL. However, we recommend doing this only if you are interested in helping to test Bugzilla on PostgreSQL as there are still significant features of Bugzilla that do not work on PostgreSQL. Also, there is very little support for actually using Bugzilla with a PostgreSQL database at this time. Official support for running Bugzilla on PostgreSQL is coming soon, but it's not here yet. Anybody wishing to assist with the development and/or testing of PostgreSQL support is encouraged to watch [bug 98304](https://bugzilla.mozilla.org/show_bug.cgi?id=98304) and all of its blockers.

#### Help us out with other databases

If you have some other database you'd like to see supported, please let us know! It is not hard to write a new component for Bugzilla for a new database. We already have bugs filed for support for: [Oracle](https://bugzilla.mozilla.org/show_bug.cgi?id=189947), [Ingres](https://bugzilla.mozilla.org/show_bug.cgi?id=249400), [Sybase](https://bugzilla.mozilla.org/show_bug.cgi?id=173130), [Firebird](https://bugzilla.mozilla.org/show_bug.cgi?id=249254), and [MS-SQL](https://bugzilla.mozilla.org/show_bug.cgi?id=285122).

However, they all need somebody to work on them! If you're interested, come talk to us in #mozwebtools on irc.mozilla.org, or tell us on the [developer's list](https://lists.bugzilla.org/cgi-bin/mj_wwwusr?func=lists-long-full&extra=developers).

### Ability to Upgrade from 2.8 Restored

Starting with 2.18.1 and 2.19.3, you can now successfully upgrade from the very old Bugzilla 2.8\. Upgrading from Bugzilla 2.8 has been broken for a while, but now that it's fixed, this is definitely a good time to upgrade. Such old releases have many security issues which have been fixed in newer releases.

## Upcoming Events and Changes

### MySQL 3.23 Support Deprecated

The decision has been made in [bug 204217](https://bugzilla.mozilla.org/show_bug.cgi?id=204217) to no longer support MySQL 3.23 in future releases. 2.20 and all its point releases will continue to be fully supported on MySQL 3.23.41 and above, but the minimum version will be bumped to 4.0.2 early on in the 2.21 development cycle.

### Upcoming UI Hackathons

Myk Melez has proposed that early in the development for 2.22 that the Bugzilla team should focus on making large improvements to the User Interface. His proposal for this is to have a number of weekly hackathons where teams of people agree to dedicate time to discussing UI improvements, coding them, reviewing them, and getting them checked in. Under this proposal, the [normal procedures](/developers) would still apply, but by having reviewers and approvers on hand, they could be greatly accelerated. For more information, see the archive of [Myk's post](https://lists.bugzilla.org/cgi-bin/mj_wwwusr?list=developers&brief=on&func=archive-get-part&extra=200503/18) to the Developer's list.

## Continuing to Support the 2.16 Branch

Official support on the 2.16 branch for security issues and major bugs will continue until 2.22 is released, which is currently projected for sometime in November 2005\. Our hope is that this will give our current 2.16 users enough time to plan an upgrade to one of the other supported versions.

## Dave's Corner

**An update from Dave Miller, Project Leader**

There has been a lot happening in the last six months, both with myself and with Bugzilla. Shortly before Bugzilla 2.18 released, I got hired by the Mozilla Foundation as a system administrator. This has been a most rewarding and challenging experience for me! However, being that we've been a bit shorthanded, I've actually wound up with less time to spend on Bugzilla instead of more, despite heading up the Bugzilla project actually being part of my job description. We currently have a position posted on our [careers](https://www.mozilla.org/foundation/careers.html) page to get some additional help, and we also have an intern this summer, so I'm confident that it's temporary, but in the meantime I've felt like the Bugzilla project hasn't been getting anywhere near the kind of attention it deserves from me lately.

I had some family issues to deal with that came up during our final push to release version 2.18, and that prompted me to make a desperate cry for help getting the release out the door. Max Kanat-Alexander came to my rescue and coordinated the efforts of several others who also pitched in, and most of the 2.18 release was pulled off without my having to do anything other than roll the tarballs and post stuff that was handed to me onto the website. Max did an awesome job with this, and I invited him to become the release manager for Bugzilla, which he graciously accepted. Max is a former technical support manager for a large software company best known for their mail server products, and recently gave that up to start a new [consulting company](http://www.everythingsolved.com/), which among other things, specializes in Bugzilla. The 2.18.1 and 2.19.3 release is entirely his doing! It's my great pleasure to have him taking on this responsibility, and helping reinvigorate the Bugzilla project, and helping so many of our contributors get their patches reviewed!

On to other news... if you haven't already noticed, we are running slightly late with the 2.20 release. Most of this is a result of the cross-database compatibility code being taken in. At the point it was time to freeze, it was so close, and such a big deal, that we just couldn't turn it away. With all of the incredible work that's gone in since 2.19.2, I'm confident that you'll agree that the extra wait for 2.20 was well worth it once you get your hands on it. Barring any major regressions getting reported from the 2.19.3 release, we should have a 2.20 release candidate within the next few weeks, and a final release not too long after.

## Checkins Since Last Update

You can see the list updates between any Bugzilla release and the current release by using the table on our [changes page](https://github.com/bugzilla/bugzilla/compare/).
