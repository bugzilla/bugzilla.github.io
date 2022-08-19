---
title: "Bugzilla Status Update"
date: 2002-02-13
author: ["zach"]
categories:
- Status
---

## Introduction

It is clear at this point that we will not make our goal of Febuary 15th for the 2.16 release. However, the Bugzilla tree is now frozen and is only accepting bugs that have been targeted as 2.16 blockers, and things are moving quickly now, so it looks reasonable that we won't have to delay again beyond March 1st, and will probably release sooner if the right things fall into place before then.

## Highly Misleading & Meaningless Statistics

|Date|2.16 Bugs With Patches Waiting For Review|2.16 Bugs Waiting For Patches|2.16 Release Blockers|2.18 Bugs|Other Bugs|
|--- |--- |--- |--- |--- |--- |
|2001-10-19|112 bugs|329 bugs||36 bugs|299 bugs|
|2002-01-18|49 bugs|61 bugs|34 bugs|459 bugs|337 bugs|
|2002-02-11|34 bugs|35 bugs|27 bugs|477 bugs|396 bugs|
|2002-02-13|24 bugs|21 bugs|23 bugs|481 bugs|405 bugs|

## New Commiter

Bugzilla welcomes Christian Reis (kiko has he is known on #mozwebtools, irc.mozilla.org) as Bugzilla's latest cvs committer. Kiko is looking forward to squashing even more new bugs and making the 2.16 release great.

## Templatisation Update

Bugzilla Templatisation is well underway. There are currently 8 user-visible cgi's or html pages left to templatize, all, but one of which are undergoing review.

Bugs relevant to the templating process that are still outstanding are:

*   [Bug 86168](https://bugzilla.mozilla.org/show_bug.cgi?id=86168 "Bugzilla should use template pages instead of hard-coded HTML") - The main "umbrella" bug.
*   [Bug 103778](https://bugzilla.mozilla.org/show_bug.cgi?id=103778 "templatize buglist.cgi") - `buglist.cgi`
*   [Bug 115369](https://bugzilla.mozilla.org/show_bug.cgi?id=115369 "Templatise long_list.cgi") - `long_list.cgi`
*   [Bug 110012](https://bugzilla.mozilla.org/show_bug.cgi?id=110012 "Spank show_bug.cgi hard - templatize and combine") - `show_bug.cgi`
*   [Bug 110013](https://bugzilla.mozilla.org/show_bug.cgi?id=110013 "templatize describecomponents.cgi") - `describecomponents.cgi`
*   [Bug 117515](https://bugzilla.mozilla.org/show_bug.cgi?id=117515 "templatize describecomponents.cgi") - `describekeywords.cgi`
*   [Bug 117060](https://bugzilla.mozilla.org/show_bug.cgi?id=117060 "Templatise user_prefs.cgi") - `user_prefs.cgi`
*   [Bug 117760](https://bugzilla.mozilla.org/show_bug.cgi?id=117760 "Templatise quips.cgi and roll in new_comment.cgi") - `showvotes.cgi`
*   [Bug 119635](https://bugzilla.mozilla.org/show_bug.cgi?id=119635 "Templatise quips.cgi and roll in new_comment.cgi") - `duplicates.cgi`

Other bugs about templates in Bugzilla:

*   [Bug 98658](https://bugzilla.mozilla.org/show_bug.cgi?id=98658) - Let administrator know which customised templates have been updated by Bugzilla team
*   [Bug 97832](https://bugzilla.mozilla.org/show_bug.cgi?id=97832) - turn on template pre-compilation
*   [Bug 106612](https://bugzilla.mozilla.org/show_bug.cgi?id=106612 "Convert HTML files to HTML templates.") - All the files `*.html` files currently in the main directory

## 2.16 Goals

The current goals for our 2.16 release are still:

*   HTML 4.01 Transitional compliance.
*   Templatization of all customer-visible CGI pages, to allow easy customization by the administrator **(8 bugs remain)**
*   Allow users to change their own email addresses, instead of having to bug the site admin (using verification emails sent to both the old and new addresses to validate the change) **(awaiting review)**
*   Remove old attachment code in favor of the new attachment tracker system. **(complete)**
*   Enable Perl's taint mode for all user accesable files, and taint-check anything being sent to the database.**(complete)**

**Note that the "complete redesign of the schema related to security groups to eliminate the "funky groupset math" and allow more than 55 bug groups to be created" has been pushed to early 2.18.**

For a more up to date list, see [the roadmap](/about/#milestones). Also, the current list of open bugs that are considered release blockers can be found [in this buglist](https://bugzilla.mozilla.org/buglist.cgi?product=Bugzilla&resolution=---&bug_severity=blocker&target_milestone=Bugzilla+2.16).

## Upcoming Major Features

Major new features are being working on. Some of these will appear in 2.16. If you would like to know when we plan on adding one of these feature, you can get that information from the bug requesting its implementation. These include:

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

[Get this list from Bonsai](http://bonsai.mozilla.org/cvsquery.cgi?treeid=default&module=Bugzilla&branch=HEAD&branchtype=match&dir=&file=&filetype=match&who=&whotype=match&sortby=Date&hours=2&date=explicit&mindate=01%2F18%2F2002&maxdate=2%2F14%2F2002&cvsroot=%2Fcvsroot)

*   [Bug 124869](https://bugzilla.mozilla.org/show_bug.cgi?id=124869) - Conversion script to import bugs from Jitterbug into Bugzilla contributed by Tom Emerson placed in the contrib folder
*   [Bug 97471](https://bugzilla.mozilla.org/show_bug.cgi?id=97471) - The assignee and qa contact should always be able to see their bugs
*   [Bug 100094](https://bugzilla.mozilla.org/show_bug.cgi?id=100094) - use generic template handling code
*   [Bug 99024](https://bugzilla.mozilla.org/show_bug.cgi?id=99024) - checksetup was not giving proper permissions to the contents of the template directory. This patch also adds an .htaccess file that blocks access to the template folder by the web server.
*   [Bug 120756](https://bugzilla.mozilla.org/show_bug.cgi?id=120756) - Moving JS to beginning of file to avoid IE warnings.
*   [Bug 97966](https://bugzilla.mozilla.org/show_bug.cgi?id=97966 "versioncache should say it's not editable.") - Changing the product in the query page would remove your component, version, and milestone selections
*   [Bug 122897](https://bugzilla.mozilla.org/show_bug.cgi?id=122897) - Comments entered on the bug form are now added to the bug before it is closed and moved when moving a bug  
    to another Bugzilla install
*   [Bug 119005](https://bugzilla.mozilla.org/show_bug.cgi?id=119005) - The instructions in editgroups.cgi incorrectly state that you can't use spaces in a group name. You in  
    fact can.
*   [Bug 117055](https://bugzilla.mozilla.org/show_bug.cgi?id=117055) - Emails were being truncated if they contained a line with nothing but a period on them
*   [Bug 119755](https://bugzilla.mozilla.org/show_bug.cgi?id=119755) - strictvaluechecks should always be enabled
*   [Bug 122418](https://bugzilla.mozilla.org/show_bug.cgi?id=122418) - obsoleting a patch from the create attachment screen gave  
    a taint error
*   [Bug 122418](https://bugzilla.mozilla.org/show_bug.cgi?id=122418) - setting attachment status fails taint checks
*   [Bug 110012](https://bugzilla.mozilla.org/show_bug.cgi?id=110012) - show_bug.cgi templatisation
*   [Bug 87398](https://bugzilla.mozilla.org/show_bug.cgi?id=87398) - checksetup.pl should warn if not run as root
*   [Bug 95732](https://bugzilla.mozilla.org/show_bug.cgi?id=95732) and [Bug 58242](https://bugzilla.mozilla.org/show_bug.cgi?id=58242) - Remove logincookies.cryptpassword, and invalidate cookies from the db when required instead
*   [Bug 14461](https://bugzilla.mozilla.org/show_bug.cgi?id=14461) - QA contact is no longer required
*   [Bug 121747](https://bugzilla.mozilla.org/show_bug.cgi?id=121747) - Stops every script before it does anything else if Bugzilla is currently shut down
*   [Bug 98021](https://bugzilla.mozilla.org/show_bug.cgi?id=98021) - Cleans up "edit attachment" interface on NS4.x by removing text of buttons that do not work in that browser
*   [Bug 122154](https://bugzilla.mozilla.org/show_bug.cgi?id=122154) - Eliminiate the use of the "usetms" Javascript cache variable
*   [Bug 109138](https://bugzilla.mozilla.org/show_bug.cgi?id=109138) - platform detection not working on macintosh
*   [Bug 122744](https://bugzilla.mozilla.org/show_bug.cgi?id=122744) - Charting fails taint checks
*   [Bug 122636](https://bugzilla.mozilla.org/show_bug.cgi?id=122636) - Templatise colchange.cgi
*   [Bug 122589](https://bugzilla.mozilla.org/show_bug.cgi?id=122589) - Update gnats conversion script to newer schema of 2.14
*   [Bug 104521](https://bugzilla.mozilla.org/show_bug.cgi?id=104521) - Removes old attachment interface in favor of new attachment tracker
*   [Bug 122154](https://bugzilla.mozilla.org/show_bug.cgi?id=122154) - change arrays to numeric, and clean up query.atml js
*   [Bug 117509](https://bugzilla.mozilla.org/show_bug.cgi?id=117509) - createaccount.cgi templatisation.
*   [Bug 121735](https://bugzilla.mozilla.org/show_bug.cgi?id=121735) - Perl warning running checksetup.pl if a module has a  
    non-numeric version number
*   [Bug 117759](https://bugzilla.mozilla.org/show_bug.cgi?id=117759) - quips.cgi rewrite and templatisation
*   [Bug 93037](https://bugzilla.mozilla.org/show_bug.cgi?id=93037) - use YYYY-MM-DD HH:MM formatting for attachment dates
*   [Bug 120543](https://bugzilla.mozilla.org/show_bug.cgi?id=120543) - Software error when entering a bug when not logged in & only  
    one product
*   [Bug 121074](https://bugzilla.mozilla.org/show_bug.cgi?id=121074) - taint error after changing bug
*   [Bug 98368](https://bugzilla.mozilla.org/show_bug.cgi?id=98368) - dbi connect doesn't use db_port option
*   [Bug 121170](https://bugzilla.mozilla.org/show_bug.cgi?id=121170) - template outputs empty &lt;style> tag
*   [Bug 113438](https://bugzilla.mozilla.org/show_bug.cgi?id=113438) - The DTD from Bugzilla's XML output was not correct, so any attempts to validate the output were futile
*   [Bug 108982](https://bugzilla.mozilla.org/show_bug.cgi?id=108982) - enable taint mode for all user-facing CGI files
*   Update of documentation
*   [Bug 120817](https://bugzilla.mozilla.org/show_bug.cgi?id=120817) - Log Out and %commandmenu% in bannerhtml
*   [Bug 119060](https://bugzilla.mozilla.org/show_bug.cgi?id=119060) - Use of Template.pm filters for url and html encoding
