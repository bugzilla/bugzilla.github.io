---
title: "Status Update"
date: 2005-09-30
author: ["mkanat"]
categories:
- Status
---

## Introduction and Updates

OK! It's been a busy few months since our last Status Update, including a lot of work toward the final release of Bugzilla 2.20, and our first release of the 2.21 series, 2.21.1\. We are also releasing a bug-fix release for the 2.18 series, 2.18.4\. Though the 2.16 branch is still supported (for a short time), there was no 2.16 release required this time around.

As usual, we'd like to remind all Bugzilla administrators that to assist them in keeping up-to-date with release announcements and security advisories, we provide an ultra-low-volume administrator mailing list ([announce@bugzilla.org](https://lists.bugzilla.org/cgi-bin/mj_wwwusr?func=lists-full-long&extra=announce)). We advise all Bugzilla administrators to subscribe so they can keep up with important Bugzilla announcements.

Those looking to get involved with Bugzilla development may want to consider joining the [developers list (developers@bugzilla.org)](https://lists.bugzilla.org/cgi-bin/mj_wwwusr?func=lists-long-full&extra=developers). This list offers discussion on new features and issues. Developers are invited to subscribe to the list. You may also want to read our [Contributor's Guide](https://www.bugzilla.org/docs/contributor.html).

## New Releases

### 2.20

At long last, we have released Bugzilla 2.20! 2.20 has all sorts of great [new features](/releases/2.20/).

2.20 is our first major release which has _not_ been run on bugzilla.mozilla.org before release. This is because the Mozilla Foundation system administrators have been quite overwhelmed and haven't been able to do the upgrade. We expect to eventually have 2.20 running on bugzilla.mozilla.org, but it may be a few weeks or months before it happens.

However, it is also our first major release that has been thoroughly tested by the new Bugzilla QA Team, which you can read more about, further down in this Status Update.

Also, many installations have used Bugzilla 2.20rc2, and we had almost no bugs reported against that version, increasing our confidence in the stability of this release.

#### Upgrading to 2.20

Upgrading to 2.20 is the same as upgrading to any other version of Bugzilla, and you can read the section of the [Release Notes](/releases/2.20/) called "How to Upgrade From An Older Bugzilla" for instructions.

In particular, remember to read through _all_ the Release Notes, from the version you are upgrading from to the version that you are upgrading to. Certain new features require manual changes if you would like to use them. And, if you have customized your Bugzilla, sometimes there are manual changes you must make to be sure that your customizations stay around.

#### PostgreSQL Support in 2.20

One of the most-requested features of Bugzilla has been the ability to support other databases, and so 2.20 is the first official release to support a database other than MySQL. The first database that we are supporting other than MySQL is [PostgreSQL](http://www.postgresql.org/). Though support for PostgreSQL is marked as "experimental" in 2.20, most of the features do work.

Also included in Bugzilla 2.20 is a script to copy a Bugzilla database between MySQL and PostgreSQL, <kbd>contrib/bzdbcopy.pl</kbd>. You can read the file itself for instructions, but just remember that your PostgreSQL Bugzilla installation and your MySQL Bugzilla installation have to be _identical_ versions of Bugzilla in order for it to work.

Particular thanks goes out to [Max Kanat-Alexander](http://www.everythingsolved.com/), Tomáš Kopal, various PostgreSQL users, and all the Bugzilla reviewers for making PostgreSQL support a reality.

### 2.21.1

We've been doing some large code re-organization for 2.21.1, making Bugzilla even easier to customize. In particular, [Async Open Source](http://www.async.com.br/) has contributed significant changes to the way that we handle products, components, versions, milestones, and classifications in the code, which simplify the code for both customizers and core Bugzilla developers.

There are quite a few nice enhancements in 2.21.1, including:

*   The ability to do relative date searches by hour, in addition to days and other units of time.
*   "Alias" added to the New Bug form, for those who can edit the alias.
*   Added a user preference for whether or not to go to the next bug in your list after submitting changes to a bug.
*   Users can now actually _access_ flag descriptions.
*   Bugzilla will optionally convert BMP attachments into PNGs for you.
*   The <kbd>CGI.pl</kbd> file is entirely gone.
*   You can now edit the Status Whiteboard when you are changing multiple bugs at once.
*   The <kbd>move.pl</kbd> script's functionality has been merged into <kbd>process_bug.cgi</kbd>.
*   QuickSearch is now in perl instead of in JavaScript.
*   There is now limited ability for multiple different projects to share one Bugzilla codebase with different data stores.
*   New Bugzilla installations will use UTF-8 encoding for all pages.
*   The way that groups work in the database has changed, and large-scale Bugzilla use should be much faster, as a result.
*   The actual attachment data has been moved to a separate database table, separate from the attachments table. This should greatly improve searches on attachment information not related to the attachment contents.
*   You can now specify multiple emails, comma-separated, when setting the requestee of a flag.
*   "Bug Creation Time" is now available in the Boolean Charts.

### 2.18.4

This release fixes a few bugs reported to us, in addition to fixing one security issue.

This is the last 2.18 release where we considered non-critical bugs. All future releases on the 2.18 branch will fix only security or dataloss issues.

## The QA Team

One of the new developments in the Bugzilla world is the Bugzilla QA Team, headed by Frederic Buclin (aka "LpSolit"). They have been doing detailed tests on our major releases, before we release them, to make sure that all our major features work.

Our QA team is composed entirely of volunteers -- if you'd like to help out, contact LpSolit on IRC (irc.mozilla.org) in the [#qa-bugzilla](irc://irc.mozilla.org/qa-bugzilla) channel or by [email](mailto:LpSolit@gmail.com). Helping out with Bugzilla QA is a great, easy way to contribute to the Bugzilla Project.

## Release Schedules

Our 2.20 release was behind schedule, but that was somewhat expected. As an Open Source project, we rely totally on volunteer efforts to release a version, and so sometimes we can't have hard release schedules. We freeze the development tree every six months, but how long it takes to release after that depends on a lot of factors, mostly how much development we did in those six months, and thus how many bugs we find and fix during the freeze.

One thing that contributed to the extended delay of the 2.20 release is that we allowed some new feature development even after the freeze, and also that our development time total on 2.20 was longer than six months. We expect our next release, 2.22, to be quicker to release, as we've had less time to develop on it. And future releases should stick more and more to our freeze schedule.

Per our standard six-month plan, the 2.22 branch would have been frozen on September 15\. However, we couldn't freeze a 2.22 without having 2.20 released. Currently, the plan is to freeze 2.22 one month after the release of 2.21.1\. That way, we have some time to react to feedback on the 2.21 series, but we won't be extending the 2.22 release indefinitely.

Hopefully, then, within three months after the freeze for 2.22, we will have a release. Hopefully, we'll have it even sooner than that, but as I said, it's hard to determine that sometimes, with volunteer efforts.

If you'd like to see faster Bugzilla releases, the best way is to come help out, yourself! To get started contributing to Bugzilla, you can read the [Contributor's Guide](/contributing/) and the [Developer's Guide](/contributing/developer).

## Oracle Support

[Oracle](http://www.oracle.com/) themselves are working with the Bugzilla team on porting Bugzilla to Oracle. We hope to have workable Oracle support by the release of Bugzilla 2.24\. If you'd like to keep track of how it's going, CC yourself on the [Oracle support tracking bug](https://bugzilla.mozilla.org/show_bug.cgi?id=bz-oracle).

If you would like to help port Bugzilla to Oracle or any other database, feel free to contact the [developers list (developers@bugzilla.org)](https://lists.bugzilla.org/cgi-bin/mj_wwwusr?func=lists-long-full&extra=developers). Porting Bugzilla to a new database system is usually easy, since we have a whole infrastructure in place for it.

## The Status of Bugzilla 2.16

Bugzilla 2.16 has been locked-down to security fixes only for a long time. Starting with the release of Bugzilla 2.22, Bugzilla 2.16 will no longer be supported at all by the Bugzilla Project. We encourage all Bugzilla administrators to upgrade to Bugzilla 2.20 as soon as possible.

## Trunk Checkins Since the Last Status Update

You can see a list of all recent changes to Bugzilla code using the table on our [detailed changes page](https://github.com/bugzilla/bugzilla/compare/).
