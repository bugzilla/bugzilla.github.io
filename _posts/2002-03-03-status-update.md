---
title: "Bugzilla Status Update"
date: 2002-03-03
author: ["justdave"]
categories:
- Status
---

## Introduction

Unfortunately, it is clear at this point that we will not make our revised goal of March 1st for the 2.16 release, either. We were almost there at one point, then we discovered several files that needed to be templatized that got missed in the first round, and a number of regressions in other parts of Bugzilla that really need to be fixed before we can release. Although we've had a feverish rate of checkins in the last two weeks compared to the last couple months, the new template bugs and the regressions have added to our buglist, so it appears that we're going backwards. I hate moving targets, so I'm only going to say that it'll be out whenever it's done now, but I can tell you it won't be long. We're moving at a rapid pace now.

## Highly Misleading & Meaningless Statistics

|Date|2.16 Bugs With Patches Waiting For Review|2.16 Bugs Waiting For Patches|2.16 Release Blockers|2.18 Bugs|Other Bugs|
|--- |--- |--- |--- |--- |--- |
|2002-03-03|16 bugs|17 bugs|23 bugs|487 bugs|430 bugs|
|2002-02-13|24 bugs|21 bugs|23 bugs|481 bugs|405 bugs|
|2002-02-11|34 bugs|35 bugs|27 bugs|477 bugs|396 bugs|
|2002-01-18|49 bugs|61 bugs|34 bugs|459 bugs|337 bugs|
|2001-10-19|112 bugs|329 bugs||36 bugs|299 bugs|

## Templatisation Update

Bugzilla Templatisation is taking longer than expected, but we're considerably far along at this point. There are currently 10 user-visible cgi pages left to templatize (out of 21 total), 5 of which are currently undergoing review. With a couple notable exceptions (buglist.cgi and show_bug.cgi) most of the remaining ones aren't so difficult.

Bugs relevant to the templating process that are still outstanding are:

*   [Bug 86168](https://bugzilla.mozilla.org/show_bug.cgi?id=86168 "Bugzilla should use template pages instead of hard-coded HTML") - The main "umbrella" bug.

*   [Bug 103778](https://bugzilla.mozilla.org/show_bug.cgi?id=103778 "templatize buglist.cgi") - `buglist.cgi`
*   [Bug 110012](https://bugzilla.mozilla.org/show_bug.cgi?id=110012 "Spank show_bug.cgi hard - templatize and combine") - `show_bug.cgi`
*   [Bug 117760](https://bugzilla.mozilla.org/show_bug.cgi?id=117760 "Templatise showvotes.cgi and roll in doeditvotes.cgi") - `showvotes.cgi`
*   [Bug 119635](https://bugzilla.mozilla.org/show_bug.cgi?id=119635 "Templatise duplicates.cgi") - `duplicates.cgi`
*   [Bug 124920](https://bugzilla.mozilla.org/show_bug.cgi?id=124920 "Templatise post_bug.cgi") - `post_bug.cgi`
*   [Bug 124937](https://bugzilla.mozilla.org/show_bug.cgi?id=124937 "Templatise show_activity.cgi") - `show_activity.cgi`
*   [Bug 125660](https://bugzilla.mozilla.org/show_bug.cgi?id=125660 "Templatise process_bug.cgi") - `process_bug.cgi`
*   [Bug 126789](https://bugzilla.mozilla.org/show_bug.cgi?id=126789 "Templatise token.cgi") - `token.cgi`
*   [Bug 126792](https://bugzilla.mozilla.org/show_bug.cgi?id=126792 "Templatise showdependencygraph.cgi") - `showdependencygraph.cgi`
*   [Bug 126793](https://bugzilla.mozilla.org/show_bug.cgi?id=126793 "Templatise showdependencytree.cgi") - `showdependencytree.cgi`

Other bugs about templates in Bugzilla: (targetted for 2.16)

*   [Bug 98658](https://bugzilla.mozilla.org/show_bug.cgi?id=98658) - Let administrator know which customised templates have been updated by Bugzilla team
*   [Bug 97832](https://bugzilla.mozilla.org/show_bug.cgi?id=97832) - turn on template pre-compilation
*   [Bug 126908](https://bugzilla.mozilla.org/show_bug.cgi?id=126908) - no templates should be in the admin directory
*   [Bug 126955](https://bugzilla.mozilla.org/show_bug.cgi?id=126955) - Bugzilla should support translated/localized templates

## 2.16 Goals

The current goals for our 2.16 release are still:

*   HTML 4.01 Transitional compliance. (this is being handled in tandem with the templatization)
*   Templatization of all customer-visible CGI pages, to allow easy customization by the administrator **(10 bugs remain)**
*   Allow users to change their own email addresses, instead of having to bug the site admin (using verification emails sent to both the old and new addresses to validate the change) **(reviewed needs-work, waiting an updated patch)**
*   Remove old attachment code in favor of the new attachment tracker system. **(complete)**
*   Enable Perl's taint mode for all user accesable files, and taint-check anything being sent to the database.**(complete)**

For a more up to date list, see [the roadmap](/about/#milestones). Also, the current list of open bugs that are considered release blockers can be found [in this buglist](https://bugzilla.mozilla.org/buglist.cgi?product=Bugzilla&resolution=---&bug_severity=blocker&target_milestone=Bugzilla+2.16).

## New Resources for Reviewers and Developers

We've added a [Developers' Guide](/contributing/developer) and a [Reviewers' Guide](/contributing/reviewer) to our website to assist new developers and reviewers. These are recommended reading for anyone that wants to contribute to the project.

## Bugzilla Bug Reports May Have a New Home Soon

Traditionally, [bugzilla.mozilla.org](https://bugzilla.mozilla.org) (henceforth referred to as "b.m.o") has always run the cvs tip of Bugzilla, and as such has been the "proving ground" for Bugzilla releases before they get released. b.m.o has a lot of traffic, and due to that traffic level, there were **always** bugs found there any time b.m.o updated to the tip.

As Bugzilla has grown, so has Mozilla. Mozilla is getting huge (if we didn't all already know that ;) and mozilla.org, as a result, is starting to view b.m.o as a production-critical installation, and is no longer willing to experiment with it.

But Bugzilla itself has a rapidly growing community of users and supporters as well, and we now believe that the people reporting bugs and developing for Bugzilla produce enough traffic on their own to get a reasonable test of the software in production, if it were on its own. The Bugzilla product has almost 1000 open bugs (and over 1800 resolved bugs).

To this end, mozilla.org is investigating setting up a separate instance of Bugzilla (yet to be named) which will have all bugs from the Bugzilla and Webtools products moved to it. This new installation will become our "live production testbed" for Bugzilla, always running somewhere close to the tip of cvs, while b.m.o will begin running only the stable releases after they've been proven.

There are many things which will need to happen first to make way for this. For instance, better ability for Bugzilla installations to communicate with each other. For details and dependencies, see [Bug 127876](https://bugzilla.mozilla.org/show_bug.cgi?id=127876 "Bugzilla installation for Bugzilla bugs").

## Upcoming Major Features

Major new features are being working on. If you would like to know when we plan on adding one of these feature, you can get that information from the bug requesting its implementation. These include:

*   PostgreSQL support. (Bug [98304](https://bugzilla.mozilla.org/show_bug.cgi?id=98304 "Allow Bugzilla to work with Postgres SQL (PgSQL)"))
*   Ability to have more than 55 groups, which will also allow a finer grained rights system to be introduced. (Bug [68022](https://bugzilla.mozilla.org/show_bug.cgi?id=68022 "Need more than 55 groups"))
*   Ability to add generic customized fields to bugs (Bug [91037](https://bugzilla.mozilla.org/show_bug.cgi?id=91037 "a generic implementation for custom fields"))
*   Customised resolutions, that allow adding, removing, deactivating and renaming of resolutions. (Bug [94534](https://bugzilla.mozilla.org/show_bug.cgi?id=94534 "Customised resolutions."))
*   Expanding the e-mail preferences to allow watching components, keywords, etc. (Bug [73665](https://bugzilla.mozilla.org/show_bug.cgi?id=73665 "Need an "emailprefs" table"))
*   Request tracker, for managing requests to change things about bugs. (Bug [98801](https://bugzilla.mozilla.org/show_bug.cgi?id=98801 "request tracker"))
*   Use template pages instead of hard-coding the HTML into the perl. (Bug [86168](https://bugzilla.mozilla.org/show_bug.cgi?id=86168 "Bugzilla should use template pages instead of hard-coded HTML"))
*   `mod_perl` support. (Bug [87406](https://bugzilla.mozilla.org/show_bug.cgi?id=87406 "Make Bugzilla work with mod_perl (under Apache)"))
*   New makefile-based installation system ([Bug 104660](https://bugzilla.mozilla.org/show_bug.cgi?id=104660), [Bug 105854](https://bugzilla.mozilla.org/show_bug.cgi?id=105854), [Bug 105855](https://bugzilla.mozilla.org/show_bug.cgi?id=105855), and [Bug 105856](https://bugzilla.mozilla.org/show_bug.cgi?id=105856))

## Checkins Since the Last Status Update

[Get this list from Bonsai](http://bonsai.mozilla.org/cvsquery.cgi?treeid=default&module=Bugzilla&branch=HEAD&branchtype=match&dir=&file=&filetype=match&who=&whotype=match&sortby=Date&hours=2&date=explicit&mindate=02%2F14%2F2002&maxdate=3%2F04%2F2002&cvsroot=%2Fcvsroot)

*   [Bug 106377](https://bugzilla.mozilla.org/show_bug.cgi?id=106377) - processmail rescanall now uses lastdiffed time to locate bugs that have mail that didn't get sent, also adds a sanity check for the same
*   [Bug 127524](https://bugzilla.mozilla.org/show_bug.cgi?id=127524) - checksetup.pl claimed localconfig had compile errors if XML::Parser wasn't installed ($@ wasn't getting cleared before testing localconfig)
*   [Bug 99209](https://bugzilla.mozilla.org/show_bug.cgi?id=99209) - display links on dependency tree page for modifying multiple bugs listed in the dependency tree
*   [Bug 128437](https://bugzilla.mozilla.org/show_bug.cgi?id=128437) - regression from userprefs redesign, default email preferences weren't being displayed correctly
*   [Bug 128422](https://bugzilla.mozilla.org/show_bug.cgi?id=128422) - regression from userprefs redesign, everyone was getting email on all changes regardless of email preferences
*   [Bug 112537](https://bugzilla.mozilla.org/show_bug.cgi?id=112537) - some bug summaries were missing in a dependency tree with a depth limit set
*   [Bug 127318](https://bugzilla.mozilla.org/show_bug.cgi?id=127318) - push UserInGroup function to templates
*   [Bug 119657](https://bugzilla.mozilla.org/show_bug.cgi?id=119657) - cleaning up the way we check for template errors
*   [Bug 107743](https://bugzilla.mozilla.org/show_bug.cgi?id=107743) - post_bug.cgi wasn't properly validating some parameters
*   [**Bug 117060**](https://bugzilla.mozilla.org/show_bug.cgi?id=117060) - templatize userprefs.cgi, also got new tabs and a new layout for the email preferences
*   [Bug 127519](https://bugzilla.mozilla.org/show_bug.cgi?id=127519) - fixing an error after doing a change columns from the buglist
*   [**Bug 126788**](https://bugzilla.mozilla.org/show_bug.cgi?id=126788) - templatize xml.cgi
*   [_Bug 127841_](https://bugzilla.mozilla.org/show_bug.cgi?id=127841) - add processmail and syncshadowdb to the list of files that need the bonsaitools perl path changed in order to run from another perl location
*   [Bug 97729](https://bugzilla.mozilla.org/show_bug.cgi?id=97729) - uploaders need to be able to obsolete their own attachments
*   [Bug 127507](https://bugzilla.mozilla.org/show_bug.cgi?id=127507) - one too many blank lines in each comment
*   [**Bug 126791**](https://bugzilla.mozilla.org/show_bug.cgi?id=126791) - templatize relogin.cgi
*   [Bug 110711](https://bugzilla.mozilla.org/show_bug.cgi?id=110711) - resolves a number of issues with the original query.cgi templates
*   [Bug 97496](https://bugzilla.mozilla.org/show_bug.cgi?id=97496) - more cleanup to release notes
*   [**Bug 117515**](https://bugzilla.mozilla.org/show_bug.cgi?id=117515) - templatize describekeywords.cgi
*   [**Bug 115369**](https://bugzilla.mozilla.org/show_bug.cgi?id=115369) - templatize long_list.cgi
*   [Bug 126487](https://bugzilla.mozilla.org/show_bug.cgi?id=126487) - Edit attachment as comment was causing an immediate submit instead of letting you edit it in newer Mozilla builds
*   [Bug 118774](https://bugzilla.mozilla.org/show_bug.cgi?id=118774) - The keyword field wasn't showing up on the query page because have_keywords wasn't being properly set before passing it to the template
*   [Bug 125516](https://bugzilla.mozilla.org/show_bug.cgi?id=125516) - "-ti" doesn't work in exim, so changing sendmail calls to use "-t -i" instead.
*   [Bug 97496](https://bugzilla.mozilla.org/show_bug.cgi?id=97496) - Some cleanup to the release notes in preparation for the 2.16 release
*   [Bug 125835](https://bugzilla.mozilla.org/show_bug.cgi?id=125835) - Removed an old sarcastic comment from the code generated for localconfig so that it doesn't imply that using a database password might be bad.

