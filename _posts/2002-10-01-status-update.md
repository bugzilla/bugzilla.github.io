---
title: "Bugzilla Status Update"
date: 2002-10-01
author: ["preed"]
categories:
- Status
---

## Introduction

The Bugzilla Team is pleased to announce both the 2.16.1 and 2.14.4 releases.

Both releases provide enhanced security and fix critical bugs on their respective branches, so both are recommended upgrades for 2.14.x and 2.16 users.

## Administrators' Mailing List Reminder

We'd like to remind all Bugzilla administrators that to assist them in keeping up-to-date with release announcements and security advisories, we've started a mailing list for people who administer Bugzillas. It is very low traffic - release announcements and security advisories only. We advise all Bugzilla administrators to [subscribe](https://lists.bugzilla.org/cgi-bin/mj_wwwusr?func=lists-full-long&extra=announce
), so they can keep up with important Bugzilla news.

<a name="win32"></a>

## The Win32 Situation

Bugzilla on Win32 is still unchanged: administrators using Win32 as their platform for Bugzilla do not want the 2.16 branch, including 2.16.1. The plan is to make the trunk Win32-friendly (which involves a number of quite large changes) and then announce that fact, allowing Win32 Bugzilla administrators to pull from the trunk. Interested admins can search bugzilla on the [[needed for Win32bz]](https://bugzilla.mozilla.org/buglist.cgi?short_desc_type=allwordssubstr&short_desc=&product=Bugzilla&long_desc_type=allwordssubstr&long_desc=&bug_file_loc_type=allwordssubstr&bug_file_loc=&status_whiteboard_type=allwordssubstr&status_whiteboard=%5Bneeded+for+Win32bz%5D&keywords_type=allwords&keywords=&bug_status=NEW&bug_status=ASSIGNED&bug_status=REOPENED&bug_status=RESOLVED&emailassigned_to1=1&emailtype1=substring&email1=&emailassigned_to2=1&emailreporter2=1&emailqa_contact2=1&emailtype2=substring&email2=&bugidtype=include&bug_id=&votes=&changedin=&chfieldfrom=&chfieldto=Now&chfieldvalue=&cmdtype=doit&newqueryname=&order=Reuse+same+sort+as+last+time&field0-0-0=noop&type0-0-0=noop&value0-0-0=) status whiteboard entry to track bugs that are part of this process.

Having said that, the Bugzilla Team continues to recommend Unix-based operating systems, including Linux, as the best platform for a Bugzilla installation; please consider it if you are starting a new Bugzilla installation and have some say in the platform decision.

## Upcoming Major Features

Major new features are being working on. If you would like to know when we plan on adding one of these features, you can get that information from the bug requesting its implementation. These include:

*   Ability to send email via SMTP instead of relying on a local installation of sendmail. (Bug [84876](https://bugzilla.mozilla.org/show_bug.cgi?id=84876))
*   PostgreSQL support. (Bug [98304](https://bugzilla.mozilla.org/show_bug.cgi?id=98304 "Allow Bugzilla to work with Postgres SQL (PgSQL)"))
*   Ability to add generic customized fields to bugs (Bug [91037](https://bugzilla.mozilla.org/show_bug.cgi?id=91037 "a generic implementation for custom fields"))
*   Customised resolutions, that allow adding, removing, deactivating and renaming of resolutions. (Bug [94534](https://bugzilla.mozilla.org/show_bug.cgi?id=94534 "Customised resolutions."))
*   Expanding the e-mail preferences to allow watching components, keywords, etc. (Bug [73665](https://bugzilla.mozilla.org/show_bug.cgi?id=73665 "Need an "emailprefs" table"))
*   `mod_perl` support. (Bug [87406](https://bugzilla.mozilla.org/show_bug.cgi?id=87406 "Make Bugzilla work with mod_perl (under Apache)"))
*   New makefile-based installation system ([Bug 104660](https://bugzilla.mozilla.org/show_bug.cgi?id=104660), [Bug 105854](https://bugzilla.mozilla.org/show_bug.cgi?id=105854), [Bug 105855](https://bugzilla.mozilla.org/show_bug.cgi?id=105855), and [Bug 105856](https://bugzilla.mozilla.org/show_bug.cgi?id=105856))
*   Generic Reporting, allowing users to generate arbitrary tabular reports of Bugzilla data. ([Bug 12282](https://bugzilla.mozilla.org/show_bug.cgi?id=12282))

## Enterprise Group support

Commercial software developments using Bugzilla for support of multiple customers in confidential reliationships require additional features to prevent accidental cross-contamination of confidential information between customers. A series of Bugzilla features making such strict controls available is being worked on, spearheaded by [Joel Peshkin](mailto:bugreport@peshkin.net).

*   Ability to mark individual comments and attachments as confidential to a specific group, typically the internal development team, even if the bug to which they are attached is more public. (<strike>[bug 143826](https://bugzilla.mozilla.org/show_bug.cgi?id=143826)</strike>)
*   Ability to have an arbitrarily large number of groups defined, to define groups in terms of other groups, and to make changes to user regular expressions immediately effect all users instead of only future new users. (<strike>[bug 157756](https://bugzilla.mozilla.org/show_bug.cgi?id=157756)</strike>)
*   A more flexible set of controls on the relationships of products and bugs to groups replacing the usebuggroupsentry and usebuggroups features ([bug 147275](https://bugzilla.mozilla.org/show_bug.cgi?id=147275))

Taken together, these changes enable sites to manage large lists of users in a large number of groups and to define appropriate default group restrictions and enforce group access policies on products, thus providing a solid foundation for enterprise group support in Bugzilla.

The largest of these changes ([bug 157756](https://bugzilla.mozilla.org/show_bug.cgi?id=157756)) landed last weekend; any new bugs or regressions should be filed as new bugs.

## Request Tracker

Request tracker is a series of enhancements to make attachment statuses more powerful and easier to administer. It includes the following changes and additions:

*   Two additional states for attachment statuses: Currently statuses can be in one of two states: off or on. RT adds two more states for a total of four: off, granted, denied, and requested, where "granted" is equivalent to "on" and "denied" and "requested" are new. These additions mean it is no longer necessary to define a second status to negate a previous one (f.e. "needs-work" to negate "has-review"): negation is built into each status.
*   Bug statuses: Currently only attachments have these kinds of statuses. RT allows them to be defined for bugs as well. Since "status" already has a meaning for bugs, attachment statuses have been renamed "status flags" (or "flags" for short) to avoid confusion.
*   Requests: Flags can be requested by setting the flag to the "requested" state and entering the name of the user you want to fulfill the request. Bugzilla emails the requestee about the request and adds the request to a queue that users can browse to keep track of their pending requests.  

    When the requestee fulfills the request by setting the flag to a different state, Bugzilla emails the requester and removes the request from the queue. This feature supports development and management processes where some users have to ask others to grant or deny review to a patch, approve a patch for check-in to a restricted branch, etc.
*   Flag types are no longer product-specific. They can be enabled and disabled for any number of product/component combinations via inclusions and exclusions lists. This feature makes it much easier to administer flag types.  

    As before, you can search for bugs using flag criteria via the boolean chart on the search form, and flag changes are recorded in the bugs activity table.

An older version of RT is currently being tested by the Bugzilla team on bugzilla.mozilla.org, so if you find a bug or have an enhancement, please check with #mozwebtools before filing new bugs. The status of RT can be monitored in [bug 98801](https://bugzilla.mozilla.org/show_bug.cgi?id=98801).

## Trunk Checkins Since the Last Status Update

The following is a list of specific bugs fixed (and their checkin messages) since the last Bugzilla status report. It is ordered by the checkin date, as ordered by [Bonsai](http://bonsai.mozilla.org/). It includes checkins on the **trunk** from **07/29/2002** to **09/22/2002**. This list was generated by filtering Bonsai's output on [that query](http://bonsai.mozilla.org/cvsquery.cgi?treeid=default&module=Bugzilla&branch=HEAD&branchtype=match&dir=&file=&filetype=match&who=&whotype=match&sortby=Date&hours=2&date=explicit&mindate=7%2F29%2F2002+00%3A00%3A00&maxdate=9%2F22%2F2002+12%3A00%3A00&cvsroot=%2Fcvsroot).

Bold italic bugs are security-sensitive bugs.

Checkins made without reference to any specific bugs:

*   (9/5/2002) Inline doc (POD) spelling fixes (MattyT)
*   (9/5/2002) Add Mac OS X 10.x to the OS lists (justdave)
*   (8/26/2002) Updated maintainer email address throughout the tree (Jake)

Checkin manifest:

*   Bug [157756](https://bugzilla.mozilla.org/show_bug.cgi?id=157756 "Groups_20020716_Branch tracking bug") - >55 groups now supported
*   Bug [63601](https://bugzilla.mozilla.org/show_bug.cgi?id=63601 "Recommend filename when downloading attachment"): Recommend filename when downloading attachments (except in IE4, which chokes on the Content-Disposition header)
*   Bug [108987](https://bugzilla.mozilla.org/show_bug.cgi?id=108987 "Linkify script to use quoteUrls on texts provided by user") - Linkify script to use quoteUrls on texts provided by user.
*   Bug [163114](https://bugzilla.mozilla.org/show_bug.cgi?id=163114 "Templatise all calls to DisplayError") - Templatise all calls to DisplayError.
*   Bug [167476](https://bugzilla.mozilla.org/show_bug.cgi?id=167476 "unix_timestamp conversion error using MySQL") - unix_timestamp conversion error using MySQL.
*   Bug [152935](https://bugzilla.mozilla.org/show_bug.cgi?id=152935 "Pref for no notification on Target Milestone change not respected") - Pref for no notification on Target Milestone change not respected.
*   Bug [160476](https://bugzilla.mozilla.org/show_bug.cgi?id=160476 "boolean chart addition doesn't keep query template format") - boolean chart addition doesn't keep query template format.
*   Bug [146945](https://bugzilla.mozilla.org/show_bug.cgi?id=146945 "clean up format ambiguities"): Hack to support format=rdf for legacy applications that don't know to do ctype=rdf instead.
*   Bug [169561](https://bugzilla.mozilla.org/show_bug.cgi?id=169561 "Speed up UserInGroup by using cached information") - Speed up UserInGroup by using cached information.
*   Bug [168804](https://bugzilla.mozilla.org/show_bug.cgi?id=168804 "Document CheckCanChangeField so sites can modify it for local needs") - Document CheckCanChangeField so sites can modify it for local needs.
*   Bug [163790](https://bugzilla.mozilla.org/show_bug.cgi?id=163790 "colchange.cgi is not localisable") - colchange.cgi is not localisable.
*   Bug [162151](https://bugzilla.mozilla.org/show_bug.cgi?id=162151 "Fix page.cgi's method of finding templates") - Fix page.cgi's method of finding templates. It now looks in a "pages" subdirectory of the template directory.
*   Bug [25521](https://bugzilla.mozilla.org/show_bug.cgi?id=25521 "Keyword field in new bug entry") - Keyword field in new bug entry.
*   Bug [168075](https://bugzilla.mozilla.org/show_bug.cgi?id=168075 "Undefined subroutine &main::Error called at /opt/webtools/bugzilla/buglist.cgi line 1005.") - Undefined subroutine &main::Error called at /opt/webtools/bugzilla/buglist.cgi line 1005\.
*   Bug [167978](https://bugzilla.mozilla.org/show_bug.cgi?id=167978 "Fix Throw*Error l10n regressions and add a test to catch more") - Fix Throw*Error l10n regressions and add a test to catch more.
*   Bug [166698](https://bugzilla.mozilla.org/show_bug.cgi?id=166698 "The error system's in a bit of a mess") - The error system's in a bit of a mess. This file was missed on the original checkin.
*   Bug [166821](https://bugzilla.mozilla.org/show_bug.cgi?id=166821 "reports.cgi broken by recent schema changes") - reports.cgi broken by recent schema changes.
*   Bug [167595](https://bugzilla.mozilla.org/show_bug.cgi?id=167595 "in Java applets text labels on controls are rendered incorrectly") - Query - multiple-select product (and probably component) broken
*   Bug [167643](https://bugzilla.mozilla.org/show_bug.cgi?id=167643 "Schema Changes from bug 143826 are out of order") - Schema Changes from bug [143826](https://bugzilla.mozilla.org/show_bug.cgi?id=143826) are out of order
*   Bug [166023](https://bugzilla.mozilla.org/show_bug.cgi?id=166023 "On failure in template->new, a template is used to display error") - On failure in template->new, a template is used to display error
*   Bug [166698](https://bugzilla.mozilla.org/show_bug.cgi?id=166698 "The error system's in a bit of a mess") - clean up the error system, which was confused and broken.
*   Bug [146134](https://bugzilla.mozilla.org/show_bug.cgi?id=146134 "checksetup.pl gives weird error message.") - checksetup.pl gives weird error message
*   Bug [123957](https://bugzilla.mozilla.org/show_bug.cgi?id=123957 "run checksetup.pl non-interactively (for use with cron jobs on test installs)") run checksetup.pl non-interactively (for use with cron jobs on test installs)
*   Bug [165756](https://bugzilla.mozilla.org/show_bug.cgi?id=165756 "Running tests without checksetup causes failure") - Running tests without checksetup causes failure
*   Bug [166318](https://bugzilla.mozilla.org/show_bug.cgi?id=166318 "Bugzilla::Config should check for defparams.pl failure") - Bugzilla::Config should check for defparams.pl failure
*   _**bug [163024](https://bugzilla.mozilla.org/show_bug.cgi?id=163024 "bugzilla_email_append.pl calls processmail incorrectly") - bugzilla_email_append calls processmail incorrectly**_
*   Bug [166016](https://bugzilla.mozilla.org/show_bug.cgi?id=166016 "checksetup gives torrent of cryptic errors if my_webservergroup is not found") checksetup gives torrent of cryptic errors if my_webservergroup is not found
*   Recheckin due to misapplied patch for bug [123957](https://bugzilla.mozilla.org/show_bug.cgi?id=123957 "run checksetup.pl non-interactively (for use with cron jobs on test installs)")
*   Bug [123957](https://bugzilla.mozilla.org/show_bug.cgi?id=123957 "run checksetup.pl non-interactively (for use with cron jobs on test installs)") run checksetup.pl non-interactively (for use with cron jobs on test installs)
*   Bug [121419](https://bugzilla.mozilla.org/show_bug.cgi?id=121419 "If multiple cookies exist, the least significant is assigned.") - If multiple cookies exist, the least significant is assigned. Also fixes Duplicate Bug [165685](https://bugzilla.mozilla.org/show_bug.cgi?id=165685) When switching from no cookiepath to using cookiepath, old cookie gets in the way
*   _**Bug [165221](https://bugzilla.mozilla.org/show_bug.cgi?id=165221 "Apostrophes are not properly handled in e-mail addresses"): Apostrophes not properly handled during account creation.**_
*   Bug [163829](https://bugzilla.mozilla.org/show_bug.cgi?id=163829 "Move pref code into a separate package") - move pref code into a separate package
*   Correct checkin date for bug [153578](https://bugzilla.mozilla.org/show_bug.cgi?id=153578 "Attachment modified date is meant to be attachment creation date") schema modification
*   Bug [165080](https://bugzilla.mozilla.org/show_bug.cgi?id=165080 "Delete product fails with missing column error") - Delete product fails with missing column error
*   Bug [161203](https://bugzilla.mozilla.org/show_bug.cgi?id=161203 "Bug changes with intermediate pages munges fields with multiple values (e.g., CC)") - Bug changes with intermediate pages munges fields withmultiple values (e.g., CC)patch by "Randall M! Gee",
*   Bug [86651](https://bugzilla.mozilla.org/show_bug.cgi?id=86651 "contrib/cvs-update.sh sets sticky dates") - cvs-update was setting sticky dates which made commiting changes and getting updates more difficult
*   Bug [164623](https://bugzilla.mozilla.org/show_bug.cgi?id=164623 "xml.cgi - attachments is broken and insiders not enforced") - xml.cgi - attachments is broken and insiders not enforced
*   Bug [164623](https://bugzilla.mozilla.org/show_bug.cgi?id=164623 "xml.cgi - attachments is broken and insiders not enforced") - add .htaccess to .cvsignore
*   Bug [76923](https://bugzilla.mozilla.org/show_bug.cgi?id=76923 "Don't \|use diagnostics;\|") - Don't \|use diagnostics\| (its really expensive at startup time)
*   Bug [164470](https://bugzilla.mozilla.org/show_bug.cgi?id=164470 "Mass reassign changes UNCONFIRMED->NEW") - mass reassign changes UNCONFIRMED->NEW
*   Bug [164566](https://bugzilla.mozilla.org/show_bug.cgi?id=164566 "Param and UserInGroup are not defined in Bugzilla::Search") - Param and UserInGroup are not defined in Bugzilla::Search
*   Bug [163494](https://bugzilla.mozilla.org/show_bug.cgi?id=163494 "runtests.sh needs a switch to include optional modules") - runtests.sh needs a switch to include optional modulesTests now detect optional modules and only exclude optional filesif optional module dependencies are not met.Also major indent cleanup
*   Bug [164464](https://bugzilla.mozilla.org/show_bug.cgi?id=164464 "Importxml will fail if versioncache needs update") - Importxml will fail if versioncache needs update
*   Bug [164465](https://bugzilla.mozilla.org/show_bug.cgi?id=164465 "importxml.pl fails") - importxml.pl fails
*   Fixed merge problem from checkin of [143826](https://bugzilla.mozilla.org/show_bug.cgi?id=143826 "Add support for Insiders, Private comments, Private Attachments") - No bug
*   Bug [143826](https://bugzilla.mozilla.org/show_bug.cgi?id=143826 "Add support for Insiders, Private comments, Private Attachments") - Adding 2 new files missing from repository
*   Bug [163570](https://bugzilla.mozilla.org/show_bug.cgi?id=163570 "Search.pm calls time2str which is not found in the file") - Bugzilla::Search missing Date::Format includepatch by jussi@comlink.fi (Jussi Sirpoma),
*   Fix for bug [163541](https://bugzilla.mozilla.org/show_bug.cgi?id=163541 "header.html.tmpl should set h1 be the empty string"): Corrects problem with previous patch that causes primary headers not to appear on some installations.
*   Fix for bug [163541](https://bugzilla.mozilla.org/show_bug.cgi?id=163541 "header.html.tmpl should set h1 be the empty string"): let there be a page title but no primary page header.
*   Bug [163457](https://bugzilla.mozilla.org/show_bug.cgi?id=163457 "bugs not registered as "new"") - bugs not registered as "new".
*   Bug [163331](https://bugzilla.mozilla.org/show_bug.cgi?id=163331 "shutdownhtml is broken") - shutdownhtml is broken.
*   Bug [163299](https://bugzilla.mozilla.org/show_bug.cgi?id=163299 "Can't change cc accessible checkbox") - Can't change cc accessible checkbo
*   Bug [143286](https://bugzilla.mozilla.org/show_bug.cgi?id=143286 "Crash when Tab w/ Quicktime Switches") - Add support for Insiders, Private comments, Private Attachments.
*   Big [163291](https://bugzilla.mozilla.org/show_bug.cgi?id=163291 "Move utility funcs into a module") - Move utility funcs into a module
*   Fix typo from [43600](https://bugzilla.mozilla.org/show_bug.cgi?id=43600 "Duplicate field names in bugzilla tables (component IDs etc.)")
*   Bug [162854](https://bugzilla.mozilla.org/show_bug.cgi?id=162854 "buglist.cgi: reporter is actually owner") - buglist.cgi reporter is actually owner
*   bug [160631](https://bugzilla.mozilla.org/show_bug.cgi?id=160631 "bug_email.pl is broken") - bug_email.pl is broken
*   Bug [160112](https://bugzilla.mozilla.org/show_bug.cgi?id=160112 "Clean up quip table conversion code") - clean up quip table conversion code
*   Bug [10037](https://bugzilla.mozilla.org/show_bug.cgi?id=10037 "Install.exe does not run if COMCTL32.DLL version is 4.0 in Win95") - param to disable adding new quips
*   Bug [162066](https://bugzilla.mozilla.org/show_bug.cgi?id=162066 "Fix callers of ThrowCodeError to use messages in code-error.html.tmpl") - Fix callers of ThrowCodeError to use messages in code-error.html.tmpl.
*   Bug [162068](https://bugzilla.mozilla.org/show_bug.cgi?id=162068 "Fix callers of ThrowUserError to use messages.html.tmpl") - Fix callers of ThrowUserError to use messages.html.tmpl.
*   Bug [162216](https://bugzilla.mozilla.org/show_bug.cgi?id=162216 "colchange.cgi, buglist.cgi and page.cgi messages should be l10nable") - colchange.cgi, buglist.cgi and page.cgi messages should be l10nable.
*   Bug [162066](https://bugzilla.mozilla.org/show_bug.cgi?id=162066 "Fix callers of ThrowCodeError to use messages in code-error.html.tmpl") - Fix callers of ThrowCodeError to use messages in code-error.html.tmpl.
*   Bug [151619](https://bugzilla.mozilla.org/show_bug.cgi?id=151619 "Problem with the regex in checksetup.pl to find duplicates.") - Problem with the regex in checksetup.pl to find duplicates
*   Bug [153578](https://bugzilla.mozilla.org/show_bug.cgi?id=153578 "Attachment modified date is meant to be attachment creation date") - Attachment modified date is meant to be attachment creationdate
*   Bug [162642](https://bugzilla.mozilla.org/show_bug.cgi?id=162642 "Cannot accept bugs if requiremilestone is on") - Cannot accept bugs if requiremilestone is on; regression frombug [43600](https://bugzilla.mozilla.org/show_bug.cgi?id=43600)
*   Bug [162438](https://bugzilla.mozilla.org/show_bug.cgi?id=162438 "Fix permissions and tests for Bugzilla/ directory") - fix permissions/tests for Bugzilla/ directory
*   Bug [24823](https://bugzilla.mozilla.org/show_bug.cgi?id=24823 "The top of a bug description should have last modified date") - show the last modified date at the top of show_bug
*   Bug [160710](https://bugzilla.mozilla.org/show_bug.cgi?id=160710 "Taint checking causes problem with rename function") - Taint checking causes problem with rename function
*   Fixing up the changedate from my bug [43600](https://bugzilla.mozilla.org/show_bug.cgi?id=43600 "Duplicate field names in bugzilla tables (component IDs etc.)") patch. Knew I must haveforgotten something....
*   Bug [43600](https://bugzilla.mozilla.org/show_bug.cgi?id=43600 "Duplicate field names in bugzilla tables (component IDs etc.)") - Convert products/components to use ids instead of names.Initial attempt by jake@bugzilla.org, updated by me
*   Bug [162217](https://bugzilla.mozilla.org/show_bug.cgi?id=162217 "./checksetup.pl: Warning after pulldown menu support in defparams.pl"): fixed bustage introduced in bug [160410](https://bugzilla.mozilla.org/show_bug.cgi?id=160410)
*   Bug [160410](https://bugzilla.mozilla.org/show_bug.cgi?id=160410 "defparams.pl should support pulldown menus for options"): defparams.pl support for single/multi pulldown menus; p=preed,
*   Bug [160557](https://bugzilla.mozilla.org/show_bug.cgi?id=160557 "products that start with _ do not show up properly in query.cgi") - products that start with _ do not show up properly in query.cgi.
*   Bug [155584](https://bugzilla.mozilla.org/show_bug.cgi?id=155584 "Opening duplicates.cgi with no frequent bugs causes SQL syntax error") - Opening duplicates.cgi with no frequent bugs causes SQL syntax error.
*   Bug [109008](https://bugzilla.mozilla.org/show_bug.cgi?id=109008 "Footer on create attachment page looks wrong.") - Footer on create attachment page looks wrong.
*   Bug [159901](https://bugzilla.mozilla.org/show_bug.cgi?id=159901 "token.cgi: localize strings send to message.html.tmpl (Part one)") - token.cgi: localize strings send to message.html.tmpl.
*   Miseed &:: for call to SqlQuote, no bug # (cleanup from bug [158474](https://bugzilla.mozilla.org/show_bug.cgi?id=158474 "Abstract out GenerateSQL into perl module"))
*   Bug [161402](https://bugzilla.mozilla.org/show_bug.cgi?id=161402 "Disable DBI taint mode in processmail") - Disable DBI taint mode in processmail
*   Bug [158474](https://bugzilla.mozilla.org/show_bug.cgi?id=158474 "Abstract out GenerateSQL into perl module") - Abstract out GenerateSQL into perl module.
*   Add a test to check for speling errors. It only currently checks for two simple errors that used to be in checksetup.pl, more errors can and will be added in the future.Bug [147151](https://bugzilla.mozilla.org/show_bug.cgi?id=147151 "Develop list of words for 006spellcheck.t to look for"), no review needed for tests
*   Bug [161450](https://bugzilla.mozilla.org/show_bug.cgi?id=161450 "New search knob causes warnings") - New search knob causes warnings.
*   Bug [160224](https://bugzilla.mozilla.org/show_bug.cgi?id=160224 "remember query radio buttons don't have default") - remember query radio buttons don't have default
*   Bug [55753](https://bugzilla.mozilla.org/show_bug.cgi?id=55753 "if order is the first param to buglist.cgi, can't resort") - if order is the first param to buglist.cgi, can't resort.
*   Bug [118442](https://bugzilla.mozilla.org/show_bug.cgi?id=118442 "Bugzilla fails to notice if nothing has changed when editing multiple bugs if no keywords have been defined") - Bugzilla fails to notice if nothing has changed when editingmultiple bugs if no keywords have been definedpatch by jake@bugzilla.org,
*   Bug [160227](https://bugzilla.mozilla.org/show_bug.cgi?id=160227 "VERSION cookie not set correctly") - VERSION cookie not set correctly
*   Bug [113459](https://bugzilla.mozilla.org/show_bug.cgi?id=113459 "Bad regexp in emailregexp causes system lockout") Bad regexp in emailregexp causes system lockout
*   Bug [160204](https://bugzilla.mozilla.org/show_bug.cgi?id=160204 "search/knob.html.tmpl: script type missing, space missing") - search/knob.html.tmpl: script type missing, space missing
*   Bug [158236](https://bugzilla.mozilla.org/show_bug.cgi?id=158236 "Remove 'watchfordiffs' column from namedqueries table") - Remove 'watchfordiffs' column from namedqueries table

## 2.16-Branch Checkins Since the Last Status Update

The following is a list of specific bugs fixed (and their checkin messages) since the last Bugzilla status report. It is ordered by the checkin date, as ordered by [Bonsai](http://bonsai.mozilla.org/). It includes checkins on the **BUGZILLA-2_16-BRANCH** from **07/29/2002** to **09/28/2002**. This list was generated by filtering Bonsai's output on [that query](http://bonsai.mozilla.org/cvsquery.cgi?treeid=default&module=Bugzilla&branch=BUGZILLA-2_16-BRANCH&branchtype=match&dir=&file=&filetype=match&who=&whotype=match&sortby=Date&hours=2&date=explicit&mindate=7%2F29%2F2002+00%3A00%3A00&maxdate=9%2F28%2F2002+12%3A00%3A00&cvsroot=%2Fcvsroot).

Bold italic bugs are security-sensitive bugs.

Checkins made without reference to any specific bugs: **None**.

*   Bug [166023](https://bugzilla.mozilla.org/show_bug.cgi?id=166023 "On failure in template->new, a template is used to display error") - On failure in template->new, a template is used to display error
*   _**Bug [167485](https://bugzilla.mozilla.org/show_bug.cgi?id=167485 "When "); group_id is wrong when usebuggroups is on**_
*   Bug [161203](https://bugzilla.mozilla.org/show_bug.cgi?id=161203 "Bug changes with intermediate pages munges fields with multiple values (e.g., CC)") - Bug changes with intermediate pages munges fields withmultiple values (e.g., CC)
*   _**bug [163024](https://bugzilla.mozilla.org/show_bug.cgi?id=163024 "bugzilla_email_append.pl calls processmail incorrectly") - bugzilla_email_append calls processmail incorrectly**_
*   _**Bug [165221](https://bugzilla.mozilla.org/show_bug.cgi?id=165221 "Apostrophes are not properly handled in e-mail addresses"): Apostrophes not properly handled during account creation.**_
*   Bug [164464](https://bugzilla.mozilla.org/show_bug.cgi?id=164464 "Importxml will fail if versioncache needs update") - Importxml will fail if versioncache needs update
*   bug [160631](https://bugzilla.mozilla.org/show_bug.cgi?id=160631 "bug_email.pl is broken") - bug_email.pl is broken
*   Bug [151619](https://bugzilla.mozilla.org/show_bug.cgi?id=151619 "Problem with the regex in checksetup.pl to find duplicates.") - Problem with the regex in checksetup.pl to find duplicates
*   Bug [160710](https://bugzilla.mozilla.org/show_bug.cgi?id=160710 "Taint checking causes problem with rename function") - Taint checking causes problem with rename function
*   Bug [161305](https://bugzilla.mozilla.org/show_bug.cgi?id=161305 "SQL-error in userprefs.cgi with allowemailchange") - SQL error with allowemailchange with mysql 3.22
*   Bug [160227](https://bugzilla.mozilla.org/show_bug.cgi?id=160227 "VERSION cookie not set correctly") - VERSION cookie not set correctly

## 2.14-Branch Checkins Since the Last Status Update

The following is a list of specific bugs fixed (and their checkin messages) since the last Bugzilla status report. It is ordered by the checkin date, as ordered by [Bonsai](http://bonsai.mozilla.org/). It includes checkins on the **BUGZILLA-2_14_1-BRANCH** from **07/29/2002** to **09/22/2002**. This list was generated by filtering Bonsai's output on [that query](http://bonsai.mozilla.org/cvsquery.cgi?treeid=default&module=Bugzilla&branch=BUGZILLA-2_14_1-BRANCH&branchtype=match&dir=&file=&filetype=match&who=&whotype=match&sortby=Date&hours=2&date=explicit&mindate=7%2F29%2F2002+00%3A00%3A00&maxdate=9%2F22%2F2002+12%3A00%3A00&cvsroot=%2Fcvsroot).

Bold italic bugs are security-sensitive bugs.

Checkins made without reference to any specific bugs: **None**.

*   _**Bug [167485](https://bugzilla.mozilla.org/show_bug.cgi?id=167485 "When "); group_id is wrong when usebuggroups is on**_
*   _**Bug [163024](https://bugzilla.mozilla.org/show_bug.cgi?id=163024 "bugzilla_email_append.pl calls processmail incorrectly") - bugzilla_email_append calls processmail incorrectly**_
*   Bug [160631](https://bugzilla.mozilla.org/show_bug.cgi?id=160631 "bug_email.pl is broken") - bug_email.pl is broken

