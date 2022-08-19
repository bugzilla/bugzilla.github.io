---
title: "Status Update"
date: 2004-10-24
author: ["zach"]
categories:
- Status
---

## Introduction and Updates

Welcome to the October 2004 Bugzilla status update, covering the status of the Bugzilla project since the [July 10th status update](/blog/2004/07/10/status-update) and the release of Bugzilla 2.18rc1 and Bugzilla 2.16.6\.

In this update, we are pleased to announce the third release candidate of Bugzilla 2.18 (2.18rc3), the latest (and hopefully last) in the series of candidate releases before the final Bugzilla 2.18 stable release. This release fixes a variety of issues and security vulnerabilities. We are also pleased to announce the release of Bugzilla 2.19.1, a development snapshot release from the cvs trunk. Lastly, we are announcing Bugzilla 2.16.7, a security update for the 2.16 stable branch.

Also of note is the recent release of version 0.6 of the [bugzilla-submit](/download/#utils) utility, a command-line tool to submit new bugs to a Bugzilla installation.

Since the previous status update, we have also released Bugzilla 2.18rc2, an update to 2.18rc1 which fixed several major issues. These issues are detailed below. We also updated our website style to be more consistent with the new redesign of the [mozilla.org](https://www.mozilla.org) website.

As usual, we'd like to remind all Bugzilla administrators that to assist them in keeping up-to-date with release announcements and security advisories, we provide an ultra-low-volume administrator mailing list (announce@bugzilla.org), covering just new releases and security advisories. We advise all Bugzilla administrators to [subscribe](https://lists.bugzilla.org/cgi-bin/mj_wwwusr?func=lists-full-long&extra=announce) so they can keep up to date with important Bugzilla announcements.

Those looking to get involved with Bugzilla development or more closely follow the development process may want to consider joining the developers list (developers@bugzilla.org). This list offers discussion on new features and issues. Developers are invited to [subscribe](https://lists.bugzilla.org/cgi-bin/mj_wwwusr?user=&passw=&func=lists-long-full&extra=developers) to the list.

## New Releases

### 2.18rc3

This release is a developers' release and is not recommended for production use, but all existing users of the 2.17 development branch or previous 2.18 release candidates are strongly encouraged to upgrade to 2.18rc3.

We've done a third release candidate for 2.18 because there were some major changes to the group security code in the new "Charts over time" section of the reporting features, intended to give you better control over who can see charts of what data.

We also recommend that Bugzilla administrators test their installations with 2.18rc3 using a backup copy of their database, in order to help us make the 2.18 final release the best it can be. Since 2.16 was originally released, Bugzilla has come a long way. [This list](#majorfeaturessince216) shows many of the major new features that have been added to the 2.17 development branch since 2.16\. Those using 2.16 should take a look at this list for an indication of what will be new in 2.18 and make plans to migrate their installations from the 2.16 stable branch (which will be retired with the release of Bugzilla 2.22, scheduled for approximately April 2005).

### 2.16.7

The Bugzilla 2.16.7 release is a security update to the previous 2.16.6 stable release. This release allows administrators to patch their stable installations without needing to upgrade to a development release. Please see the [security section](#security) of this status update for more information on the issues that were fixed.<a name="newfeatures"></a>

### 2.19.1

Bugzilla 2.19.1 is a bleeding-edge development release for those who would like the latest features available on the Bugzilla CVS trunk. Major new features on the trunk since the last status update include:

*   A higher level of categorization (departments, locations, etc...) is now available for bug reports. (Bug [224208](https://bugzilla.mozilla.org/show_bug.cgi?id=224208).)
*   The wining system has been revamped and rewritten. The new system allows periodic scheduled reports on anything you can search on to be sent to individual users or lists. (Bug [185090](https://bugzilla.mozilla.org/show_bug.cgi?id=185090).)
*   Comments in bug reports can be selectively highlighted (i.e. highlight comments 5, 9, and 12-16). (Bug [259452](https://bugzilla.mozilla.org/show_bug.cgi?id=259452).)
*   Environment Variable Authentication can be used for Apache HTTP Auth support. (Bug [241903](https://bugzilla.mozilla.org/show_bug.cgi?id=241903).)
*   Users can be shown in a drop-down menu in bug reports instead of being entered in a text entry field. (Bug [251669](https://bugzilla.mozilla.org/show_bug.cgi?id=251669).)
*   An installation test suite allows administrators to ensure that their Bugzilla installation is functioning correctly. (Bug [245877](https://bugzilla.mozilla.org/show_bug.cgi?id=245877).)
*   Per-chart negation to boolean searches is now supported. (Bug [245272](https://bugzilla.mozilla.org/show_bug.cgi?id=245272).)
*   Boolean charts now support %reporter%, %user%, and %assignee% pronouns. (Bug [226434](https://bugzilla.mozilla.org/show_bug.cgi?id=226434).)

<a name="security"></a>

## Security Bugs Fixed

Several security bugs have been fixed in the new Bugzilla releases. Please see the [Bugzilla Security Advisory](/security/2.16.6/) for more detailed information on these issues.<a name="majorfeaturessince216"></a>

## Major New Features Since 2.16

Users upgrading from 2.16 may be interested in a [list of major new features since the 2.16 release.](/releases/2.18/)

## Completing the Transition to Time-Based Releases

**An update from Dave Miller, Bugzilla project leader**

We committed back in December to start doing time-based releases of Bugzilla, rather than feature-based. It was felt by many that, with the largely volunteer workforce that we have, trying to get any kind of timely Bugzilla releases with feature-based release goals was almost a lost cause (evidence: it's been over 3 years since Bugzilla 2.16 was released and we still don't have a 2.18). The schedule we agreed to was to lock down the cvs tree for a "feature freeze" every 6 months, at which time only bugfixes, and not enhancements, can be checked in, until we feel the tree is stable and releasable. At that point, we would create a branch for the release candidates, and reopen the trunk for development. A release would happen as soon as the release candidates proved a stable release.

The first such freeze was on March 15th for 2.18\. Yes, that was over 7 months ago. Because it had been 2 1/2 years since the 2.16 release, there was a lot of cleanup to do in order to make 2.18 be release-quality. Our "feature freeze" lasted almost 4 months. We created the 2.18 release branch and released 2.18rc1 on July 10th, leaving us with only 2 months of open development prior to our scheduled September 15th feature freeze for 2.20, which is now in effect.

This has lead to a rather interesting situation. With this update comes our 3rd (and hopefully last) release candidate for Bugzilla 2.18\. We're also releasing version 2.19.1 off the trunk. It **should** be 2.20rc1, because it's definitely stable enough to be a release candidate. But I have a nagging suspicion in the back of my head that having a 2.20 release candidate available before we have a 2.18 final release would greatly confuse people. So my plan at this point is to release 2.20rc1 at the same time we release 2.18 final. This will hopefully happen in about 2 weeks, as long as no one finds any showstopper issues in 2.18rc3.

Once 2.18 is out of the way, 2.20 will likely follow within a few weeks. After no major version bump in 3 years, we'll have another major version bump in a couple weeks. :) How about that? Once 2.20 is out, we should be stablized at approximately every 6 months. 2.20 has been going very smoothly so far (nothing like 2.18).

## Trunk Checkins Since the Last Status Update

The following is a list of specific bugs fixed (and their checkin messages) since the last Bugzilla status report. It is ordered by the checkin date as rendered by [Bonsai](http://bonsai.mozilla.org/). It includes checkins on the trunk from 2004/07/08 to 2004/10/24\. This list was generated by filtering Bonsai's output on [that query](http://bonsai.mozilla.org/cvsquery.cgi?treeid=default&module=Bugzilla&branch=HEAD&branchtype=match&dir=&file=&filetype=match&who=&whotype=match&sortby=Date&hours=2&date=explicit&mindate=2004-07-08&maxdate=2004-10-25&cvsroot=/cvsroot).

Checkins that don't refer to a specific bug number have been omitted, and were a small minority.

**Checkin manifest:**

*   Bug [263250](https://bugzilla.mozilla.org/show_bug.cgi?id=263250) - adds base tag to simple bug list so it can be loaded in iframe on remote site and the CSS still work
*   Bug [265240](https://bugzilla.mozilla.org/show_bug.cgi?id=265240) - make collectstats generate valid RDF by not cutting off the opening RDF tag
*   Bug [232155](https://bugzilla.mozilla.org/show_bug.cgi?id=232155) - Remove uninitialized value warning from Pperl's Cookie.pm and unify code by removing redundancy
*   Bug [265303](https://bugzilla.mozilla.org/show_bug.cgi?id=265303) - updates RDF content type to new standard application/rdf+xml
*   Bug [264003](https://bugzilla.mozilla.org/show_bug.cgi?id=264003) - Include the DBI error in the error message if 'createdb' fails
*   Bug [189073](https://bugzilla.mozilla.org/show_bug.cgi?id=189073) - Allow accept as a resolution when changing multiple bugs only if all bugs are opened
*   Bug [261434](https://bugzilla.mozilla.org/show_bug.cgi?id=261434) - implement functionality to delete a user semi-properly (only works for users with no bugs/comments)
*   Bug [251338](https://bugzilla.mozilla.org/show_bug.cgi?id=251338) - Installation section should mention that you need an MTA installed
*   Bug [257765](https://bugzilla.mozilla.org/show_bug.cgi?id=257765) - Make replies to private comments private by default
*   Bug [263165](https://bugzilla.mozilla.org/show_bug.cgi?id=263165) - Make Bugzilla specify table type as MyISAM when creating tables
*   Bug [261210](https://bugzilla.mozilla.org/show_bug.cgi?id=261210) - adapt bz_secure CSS for text based browsers
*   Bug [262126](https://bugzilla.mozilla.org/show_bug.cgi?id=262126) - fix invalid date parsing
*   Bug [237769](https://bugzilla.mozilla.org/show_bug.cgi?id=237769) - use Administrator instead of root for super-user name in Windows, and change the ppm repository from Apache to the one maintained on landfill
*   Bug [103794](https://bugzilla.mozilla.org/show_bug.cgi?id=103794) - adds 'home' link to navigation bar
*   Bug [261446](https://bugzilla.mozilla.org/show_bug.cgi?id=261446) - Make checksetup.pl adjust permissions properly
*   Bug [153811](https://bugzilla.mozilla.org/show_bug.cgi?id=153811) - default severity should be parameterized.
*   Bug [261071](https://bugzilla.mozilla.org/show_bug.cgi?id=261071) - Error: Error in parsing value for property 'vertical-align'. Declaration dropped.
*   Bug [260411](https://bugzilla.mozilla.org/show_bug.cgi?id=260411) - MS IE breaks png alpha channel padlock. Adds a new PNG file with a 1-bit alpha layer.
*   Bug [259452](https://bugzilla.mozilla.org/show_bug.cgi?id=259452) - Add bonsai style &mark support to showbug for bug comments
*   Bug [256004](https://bugzilla.mozilla.org/show_bug.cgi?id=256004) - Fix regression that caused duplicate sortkeys in the fielddefs table or later when running on Windows with ActiveState Perl
*   Bug [252295](https://bugzilla.mozilla.org/show_bug.cgi?id=252295) - Ensure that the "Edit Search" link goes back to the same form the search was created on when running a saved search that was saved before we had multiple search forms.
*   Bug [253696](https://bugzilla.mozilla.org/show_bug.cgi?id=253696) - Work around NAME_lc bug in ActiveState Perl on Win32
*   Bug [255913](https://bugzilla.mozilla.org/show_bug.cgi?id=255913) - mailto link on show_bug.cgi wasn't honoring emailsuffix. Bugzilla->user->email now includes emailsuffix in the result.
*   Bug [190224](https://bugzilla.mozilla.org/show_bug.cgi?id=190224) - templatize editmilestones.cgi
*   Bug [255664](https://bugzilla.mozilla.org/show_bug.cgi?id=255664) - Wait until buglist is ready to be displayed before closing the "please wait" page when using server push, so any errors that occur can actually be seen by the user instead of getting a blank page.
*   Bug [255663](https://bugzilla.mozilla.org/show_bug.cgi?id=255663) - Query on [Bug creation] and anything to do with attachments no longer crashes
*   Bug [215319](https://bugzilla.mozilla.org/show_bug.cgi?id=215319) - changes "flag requester" field in boolean charts to "flag requestee" field, which is what it should have been ("flag requester" can be queried via the "flag setter" field)
*   Bug [232659](https://bugzilla.mozilla.org/show_bug.cgi?id=232659) - Fix inconsistent attachment links (and clean up diff feature)
*   Bug [257111](https://bugzilla.mozilla.org/show_bug.cgi?id=257111) - t/006spellcheck.t should check each file only once.
*   Bug [253480](https://bugzilla.mozilla.org/show_bug.cgi?id=253480) - pages should be classified rather than identified by domain name
*   Bug [254587](https://bugzilla.mozilla.org/show_bug.cgi?id=254587) - group description not displayed on delete group confirm page.
*   Bug [252810](https://bugzilla.mozilla.org/show_bug.cgi?id=252810) - p1, critical not displayed in red when groups are used for bug. Roundabout patch that adds a padlock icon next to the bug
*   Bug [224208](https://bugzilla.mozilla.org/show_bug.cgi?id=224208) - Add a higher level of categorization (ie departments, locations, etc.)
*   Bug [255772](https://bugzilla.mozilla.org/show_bug.cgi?id=255772) - Prevent whine.pl from running endless whining loop
*   Bug [244239](https://bugzilla.mozilla.org/show_bug.cgi?id=244239) - Add group-based pronouns to query
*   Bug [241903](https://bugzilla.mozilla.org/show_bug.cgi?id=241903) - Add Environment Variable Authentication for apache auth and SSO
*   Bug [251669](https://bugzilla.mozilla.org/show_bug.cgi?id=251669) - Added an option to show users in a drop down menu instead of a text edit field
*   Bug [254430](https://bugzilla.mozilla.org/show_bug.cgi?id=254430) - Fix User.pm so it returns a logged-out user if userid=0
*   Bug [253562](https://bugzilla.mozilla.org/show_bug.cgi?id=253562) - Fix timetracking so Hours Worked (actual_time) is no longer listed as 1.
*   Bug [185090](https://bugzilla.mozilla.org/show_bug.cgi?id=185090) - Add revamped whining system
*   Bug [186093](https://bugzilla.mozilla.org/show_bug.cgi?id=186093) - Move CanSeeBug to User.pm and make User.pm usable by templates
*   Bug [253968](https://bugzilla.mozilla.org/show_bug.cgi?id=253968) - Fix extra column in insert statement in checksetup
*   Bug [253583](https://bugzilla.mozilla.org/show_bug.cgi?id=253583) - Warning: assignment to undeclared variable assigned_to
*   Bug [253447](https://bugzilla.mozilla.org/show_bug.cgi?id=253447) - Fix unhelpful error if user enters text in "blocks" field
*   Bug [216008](https://bugzilla.mozilla.org/show_bug.cgi?id=216008) - Time Tracking: default values cause change bug
*   Bug [236678](https://bugzilla.mozilla.org/show_bug.cgi?id=236678) - Clean up access to COOKIE global. Remove the last remaining places in the tree where COOKIE is used
*   Bug [252789](https://bugzilla.mozilla.org/show_bug.cgi?id=252789) - Empty timetrackinggroup causes error "hours worked needs to be positive" when changing. Fixes regression introduced in bug [252159](https://bugzilla.mozilla.org/show_bug.cgi?id=252159).
*   Bug [252839](https://bugzilla.mozilla.org/show_bug.cgi?id=252839) - Remove action=view from links in attachment table; this was done to improve link target consistency and avoid difficulty when shell-pasting
*   Bug [204903](https://bugzilla.mozilla.org/show_bug.cgi?id=204903) - Enable searches to match NULL aliases, missing qa_contact, and search on CC even when cc-list is empty
*   Bug [251837](https://bugzilla.mozilla.org/show_bug.cgi?id=251837) - Extend group_group_map to control which groups can see each other
*   Bug [252943](https://bugzilla.mozilla.org/show_bug.cgi?id=252943) - broken title in interdiff. Adds reasonable title while doing an interdiff, and fixes some broken and confusing double-linking
*   Bug [252450](https://bugzilla.mozilla.org/show_bug.cgi?id=252450) - Unlock tables in edit*.cgi before sending trailer
*   Bug [251837](https://bugzilla.mozilla.org/show_bug.cgi?id=251837) - Add UI to add/remove 'My Bugs' link in footer
*   Bug [253088](https://bugzilla.mozilla.org/show_bug.cgi?id=253088) - Fix ability of users with bless privileges to bless users
*   Bug [251911](https://bugzilla.mozilla.org/show_bug.cgi?id=251911) - Silly ThrowUserError bits in attachment.cgi. Fixing variables missing in some errors raised, and doing bits of $::FORM
*   Bug [252370](https://bugzilla.mozilla.org/show_bug.cgi?id=252370) - Provide edit link for attachment in comment. Adds an [edit] link next to attachments in comment text
*   Bug [272721](https://bugzilla.mozilla.org/show_bug.cgi?id=272721) - Document testserver.pl
*   Bug [252329](https://bugzilla.mozilla.org/show_bug.cgi?id=252329) - Returning to buglist after an empty fulltext search causes code error
*   Bug [252159](https://bugzilla.mozilla.org/show_bug.cgi?id=252159) - centralize time validation. Adds a ValidateTime function to Bugzilla::Bug and uses it in relevant callsites.
*   Bug [252358](https://bugzilla.mozilla.org/show_bug.cgi?id=252358) - Unnecessary documentation about /usr/bonsaitools/bin/perl into UNIX (non-root) Installation Notes.
*   Bug [252388](https://bugzilla.mozilla.org/show_bug.cgi?id=252388) - Fix undef warning when Bugzilla->cgi->header() is called twice
*   Bug [245877](https://bugzilla.mozilla.org/show_bug.cgi?id=245877) - Add an installation test suite
*   Bug [238544](https://bugzilla.mozilla.org/show_bug.cgi?id=238544) - Emit appropriate error if content and matches are used in invalid search combinations.
*   Bug [98751](https://bugzilla.mozilla.org/show_bug.cgi?id=98751) - Made it easier to update a stored query.
*   Bug [252190](https://bugzilla.mozilla.org/show_bug.cgi?id=252190) - Fix unitialized value in editusers.cgi
*   Bug [252378](https://bugzilla.mozilla.org/show_bug.cgi?id=252378) - Remove $COOKIE from attachment.cgi.
*   Bug [251727](https://bugzilla.mozilla.org/show_bug.cgi?id=251727) - Added a /images directory to store Bugzilla's images
*   Bug [251841](https://bugzilla.mozilla.org/show_bug.cgi?id=251841) - body id from urlbase with tilde (~) fails validation. Swap [sequences of] tilde, hypens and some other common characters.
*   Bug [123030](https://bugzilla.mozilla.org/show_bug.cgi?id=123030) - Move query.cgi javascript to separate file. Create productform.js that contains functions to handle the various select boxes in the advanced search page
*   Bug [241900](https://bugzilla.mozilla.org/show_bug.cgi?id=241900) - Allow Bugzilla::Auth to have multiple login and validation styles.
*   Bug [245272](https://bugzilla.mozilla.org/show_bug.cgi?id=245272) - Add per-chart negation to boolean searches
*   Bug [165589](https://bugzilla.mozilla.org/show_bug.cgi?id=165589) - Add data/errorlog logging support to bugzilla
*   Bug [250547](https://bugzilla.mozilla.org/show_bug.cgi?id=250547) - Make FlagTypes use INNER JOIN instead of comma operator.
*   Bug [86051](https://bugzilla.mozilla.org/show_bug.cgi?id=86051) - Enable changing product name case.
*   Bug [252002](https://bugzilla.mozilla.org/show_bug.cgi?id=252002) - Fix typo in create-guided.html.tmpl.
*   Bug [251898](https://bugzilla.mozilla.org/show_bug.cgi?id=251898) - Add function information to PatchReader output.
*   Bug [251484](https://bugzilla.mozilla.org/show_bug.cgi?id=251484) - Fix taint error on series create when creating a new product
*   Bug [251567](https://bugzilla.mozilla.org/show_bug.cgi?id=251567) - Make sure "find a specific bug" doesn't miss exact matches in summary
*   Bug [250840](https://bugzilla.mozilla.org/show_bug.cgi?id=250840) - Changed the minimum version numbers to all agree with reality.
*   Bug [244324](https://bugzilla.mozilla.org/show_bug.cgi?id=244324) - bugzilla-submit crashed when incorrect base url provided.
*   Bug [244324](https://bugzilla.mozilla.org/show_bug.cgi?id=244324) - updated manpage for bugzilla-submit script
*   Bug [251469](https://bugzilla.mozilla.org/show_bug.cgi?id=251469) - Solveed filtering issues with javascript_url,
*   Bug [251469](https://bugzilla.mozilla.org/show_bug.cgi?id=251469) - Added an interface argument in the header template to import script files
*   Bug [250967](https://bugzilla.mozilla.org/show_bug.cgi?id=250967) - Fixed spurious updates to requesteeless flags
*   Bug [226434](https://bugzilla.mozilla.org/show_bug.cgi?id=226434) - Add %reporter%, %user%, and %assignee% pronouns to boolean charts
*   Bug [103274](https://bugzilla.mozilla.org/show_bug.cgi?id=103274) - Site Navigation Bar was incorrect if viewing a bug not in the list
*   Bug [250881](https://bugzilla.mozilla.org/show_bug.cgi?id=250881) - No longer not set DEFAULT-FORMAT unless standard search is being used
*   Bug [241900](https://bugzilla.mozilla.org/show_bug.cgi?id=241900) - Allow Bugzilla::Auth to have multiple login and validation styles
*   Bug [245158](https://bugzilla.mozilla.org/show_bug.cgi?id=245158) - Combine multiple redundant LEFT JOINs into a single LEFT JOIN in Search.pm
*   Bug [238797](https://bugzilla.mozilla.org/show_bug.cgi?id=238797) - made a minor adjustment to javascript filters to prevent tags inserted in product, component, and flag names from causing problems.
*   Bug [237627](https://bugzilla.mozilla.org/show_bug.cgi?id=237627) - Validate dataset name in reports.cgi
*   Bug [244272](https://bugzilla.mozilla.org/show_bug.cgi?id=244272) - Remove editusers 'query' parameter
*   Bug [234855](https://bugzilla.mozilla.org/show_bug.cgi?id=234855) - Show only products enterable by current user in edit-multiple
*   Bug [233486](https://bugzilla.mozilla.org/show_bug.cgi?id=233486) - Only process groups user is supposed to be able to bless in editgroups.cgi
*   Bug [227191](https://bugzilla.mozilla.org/show_bug.cgi?id=227191) - Change DBI->connect syntax so database password will not be revealed if connect fails
*   Bug [236650](https://bugzilla.mozilla.org/show_bug.cgi?id=236650) - html_quote and validate email addresses in editueser.cgi
*   Bug [234825](https://bugzilla.mozilla.org/show_bug.cgi?id=234825) - Keep duplicates.cgi from revealing products user doesn't have access to
*   Bug [235510](https://bugzilla.mozilla.org/show_bug.cgi?id=235510) - Do not expose user password in URL to chart image if login required to access a chart
*   Bug [242405](https://bugzilla.mozilla.org/show_bug.cgi?id=242405) - Turning on QA contact causes taint error in Bugzilla/Series.pm when adding a component
*   Bug [250265](https://bugzilla.mozilla.org/show_bug.cgi?id=250265) - fix taint issues with vote fields when editing products

## Release Candidate (2.18) Branch Checkins since the Last Status Update

The following is a list of specific bugs fixed on the 2.18 branch since the last status update. The list is ordered by check-in date as determined by [Bonsai](http://bonsai.mozilla.org) and was constructed from [this Bonsai query](bonsai.mozilla.org/cvsquery.cgi?treeid=default&module=Bugzilla&branch=BUGZILLA-2_18-BRANCH&branchtype=match&dir=&file=&filetype=match&who=&whotype=match&sortby=Date&hours=2&date=explicit&mindate=2004-07-08&maxdate=2004-10-24&cvsroot=%2Fcvsroot) of all checkins on the BUGZILLA_2_16_BRANCH from 2004/07/08 to 2004/10/24\.

**Checkin manifest:**

*   Bug [263250](https://bugzilla.mozilla.org/show_bug.cgi?id=263250) - adds base tag to simple bug list so it can be loaded in iframe on remote site and the CSS still work
*   Bug [265240](https://bugzilla.mozilla.org/show_bug.cgi?id=265240) - make collectstats generate valid RDF by not cutting off the opening RDF tag
*   Bug [232155](https://bugzilla.mozilla.org/show_bug.cgi?id=232155) - Remove uninitialized value warning from Perl's Cookie.pm and unify code by removing redundancy
*   Bug [265303](https://bugzilla.mozilla.org/show_bug.cgi?id=265303) - updates RDF content type to new standard application/rdf+xml
*   Bug [264003](https://bugzilla.mozilla.org/show_bug.cgi?id=264003) - Include the DBI error in the error message if 'createdb' fails
*   Bug [189073](https://bugzilla.mozilla.org/show_bug.cgi?id=189073) - Allow accept as a resolution when changing multiple bugs only if all bugs are opened
*   Bug [261434](https://bugzilla.mozilla.org/show_bug.cgi?id=261434) - implement functionality to delete a user semi-properly (only works for users with no bugs/comments)
*   Bug [257765](https://bugzilla.mozilla.org/show_bug.cgi?id=257765) - Make replies to private comments private by default
*   Bug [263165](https://bugzilla.mozilla.org/show_bug.cgi?id=263165) - Make Bugzilla specify table type as MyISAM when creating tables
*   Bug [261210](https://bugzilla.mozilla.org/show_bug.cgi?id=261210) - adapt bz_secure CSS for text based browsers
*   Bug [262126](https://bugzilla.mozilla.org/show_bug.cgi?id=262126) - fix invalid date parsing
*   Bug [237769](https://bugzilla.mozilla.org/show_bug.cgi?id=237769) - use Administrator instead of root for super-user name in Windows, and change the ppm repository from Apache to the one maintained on landfill
*   Bug [103794](https://bugzilla.mozilla.org/show_bug.cgi?id=103794) - adds 'home' link to navigation bar
*   Bug [252739](https://bugzilla.mozilla.org/show_bug.cgi?id=252739) - moves inclusion/exclusion action names to button name instead of button value so that button values (which are also used as labels) will be localizable
*   Bug [261273](https://bugzilla.mozilla.org/show_bug.cgi?id=261273) - make column changing work with Sun ONE web server
*   Bug [261071](https://bugzilla.mozilla.org/show_bug.cgi?id=261071) - Error: Error in parsing value for property 'vertical-align'. Declaration dropped.
*   Bug [260411](https://bugzilla.mozilla.org/show_bug.cgi?id=260411) - MS IE breaks png alpha channel padlock. Adds a new PNG file with a 1-bit alpha layer.
*   Bug [245075](https://bugzilla.mozilla.org/show_bug.cgi?id=245075) - command-line script that sends bug mail so installations can push bug mail out if it's been missed by the code that sends mail when changes are made
*   Bug [250979](https://bugzilla.mozilla.org/show_bug.cgi?id=250979) - fix broken anchors to severity.
*   Bug [257593](https://bugzilla.mozilla.org/show_bug.cgi?id=257593) - new charts were requiring you to log in every time a new dataset was added to the list.
*   Bug [256004](https://bugzilla.mozilla.org/show_bug.cgi?id=256004) - Fix regression that caused duplicate sortkeys in the fielddefs table
*   Bug [249868](https://bugzilla.mozilla.org/show_bug.cgi?id=249868) - makes series pages validate
*   Bug [240460](https://bugzilla.mozilla.org/show_bug.cgi?id=240460) - updates upgrading examples with new URLs and version numbers
*   Bug [257534](https://bugzilla.mozilla.org/show_bug.cgi?id=257534) - Require Perl 5.8.1 or later when running on Windows with ActiveState Perl (there is no official CGI ppm build with a new enough version for Bugzilla on any earlier version of ActiveState Perl)
*   Bug [255913](https://bugzilla.mozilla.org/show_bug.cgi?id=255913) - mailto link on show_bug.cgi wasn't honoring emailsuffix. Bugzilla->user->email now includes emailsuffix in the result.
*   Bug [252295](https://bugzilla.mozilla.org/show_bug.cgi?id=252295) - Ensure that the "Edit Search" link goes back to the same form the search was created on when running a saved search that was saved before we had multiple search forms.
*   Bug [253696](https://bugzilla.mozilla.org/show_bug.cgi?id=253696) - work around NAME_lc bug in ActiveState Perl on Win32
*   Bug [255663](https://bugzilla.mozilla.org/show_bug.cgi?id=255663) - Query on [Bug creation] and anything to do with attachments no longer crashes
*   Bug [255664](https://bugzilla.mozilla.org/show_bug.cgi?id=255664) - Wait until buglist is ready to be displayed before closing the "please wait" page when using server push, so any errors that occur can actually be seen by the user instead of getting a blank page.
*   Bug [215319](https://bugzilla.mozilla.org/show_bug.cgi?id=215319) - changes "flag requester" field in boolean charts to "flag requestee" field, which is what it should have been ("flag requester" can be queried via the "flag setter" field)
*   Bug [254360](https://bugzilla.mozilla.org/show_bug.cgi?id=254360) - lists the rules governing who can edit which fields in 2.16 and 2.18 and the differences in those rules between the two versions. Contributed by Nick Barnes.
*   Bug [232659](https://bugzilla.mozilla.org/show_bug.cgi?id=232659) - Fix inconsistent attachment links (and clean up diff viewer UI while we're at it). Includes minor change to list that makes the URLs actually as consistent as on trunk.
*   Bug [211188](https://bugzilla.mozilla.org/show_bug.cgi?id=211188) - Make testing suite check for any #! lines that are not /usr/bin/perl
*   Bug [253308](https://bugzilla.mozilla.org/show_bug.cgi?id=253308) - Mention the Scmbug integration system in documentation
*   Bug [257419](https://bugzilla.mozilla.org/show_bug.cgi?id=257419) - make checksetup.pl quote database name in 'show table status' command
*   Bug [257152](https://bugzilla.mozilla.org/show_bug.cgi?id=257152) - make flag type deletion not crash when JavaScript is switched off
*   Bug [257267](https://bugzilla.mozilla.org/show_bug.cgi?id=257267) - allow trimming leading zeros when typing the test number in the testing suite
*   Bug [256762](https://bugzilla.mozilla.org/show_bug.cgi?id=256762) - make flag request email use emailsuffix
*   Bug [225687](https://bugzilla.mozilla.org/show_bug.cgi?id=225687) - add group controls to charts, along with various other cleanups.
*   Bug [254146](https://bugzilla.mozilla.org/show_bug.cgi?id=254146) - make the error message clear if servertest.pl failed to find the GID for HTTPD
*   Bug [235061](https://bugzilla.mozilla.org/show_bug.cgi?id=235061) - move CSS stylings in global.css if they are used across multiple pages
*   Bug [216572](https://bugzilla.mozilla.org/show_bug.cgi?id=216572) - 002goodperl.t shouldn't add an extra test for every additional Throw*Error violation in the same file
*   Bug [253480](https://bugzilla.mozilla.org/show_bug.cgi?id=253480) - pages should be classified rather than identified by domain name.
*   Bug [252810](https://bugzilla.mozilla.org/show_bug.cgi?id=252810) - p1, critical not displayed in red when groups are used for bug. Adding padlock image and fixing reference to it
*   Bug [253562](https://bugzilla.mozilla.org/show_bug.cgi?id=253562) - Hours Worked (actual_time) is being listed as 1\.
*   Bug [253583](https://bugzilla.mozilla.org/show_bug.cgi?id=253583) - Warning: assignment to undeclared variable assigned_to
*   Bug [253447](https://bugzilla.mozilla.org/show_bug.cgi?id=253447) - Fix unhelpful error if user enters text in "blocks" field
*   Bug [216008](https://bugzilla.mozilla.org/show_bug.cgi?id=216008) - Time Tracking: default values cause change bug errors. Check if the time values haven't actually changed by using integer comparison (instead of string comparison).
*   Bug [252943](https://bugzilla.mozilla.org/show_bug.cgi?id=252943) - broken title in interdiff. Adds reasonable title while doing an interdiff, and fixes some broken and confusing double-linking in the text.
*   Bug [252450](https://bugzilla.mozilla.org/show_bug.cgi?id=252450) - Unlock tables in edit*.cgi before sending trailer
*   Bug [251837](https://bugzilla.mozilla.org/show_bug.cgi?id=251837) - Add UI to add/remove 'My Bugs' link in footer
*   Bug [253088](https://bugzilla.mozilla.org/show_bug.cgi?id=253088) - Fix ability of users with bless privileges only to bless users
*   Bug [239112](https://bugzilla.mozilla.org/show_bug.cgi?id=239112) - docs patch to warn about min. TT version for hooks system.
*   Bug [252721](https://bugzilla.mozilla.org/show_bug.cgi?id=252721) - Document testerver.pl
*   Bug [252370](https://bugzilla.mozilla.org/show_bug.cgi?id=252370) - Provide edit link for attachment in comment. Adds an [edit] link next to attachments in comment text, and removes the &action=view suffix which breaks things when pasting into a shell.
*   Bug [252329](https://bugzilla.mozilla.org/show_bug.cgi?id=252329) - Returning to buglist after an empty fulltext search causes code error
*   Bug [252358](https://bugzilla.mozilla.org/show_bug.cgi?id=252358) - Unnecessary documentation about /usr/bonsaitools/bin/perl into UNIX (non-root) Installation Notes.
*   Bug [252388](https://bugzilla.mozilla.org/show_bug.cgi?id=252388) - Fix undef warning when Bugzilla->cgi->header() is called twice
*   Bug [245877](https://bugzilla.mozilla.org/show_bug.cgi?id=245877) - Add an installation test suite
*   Bug [238544](https://bugzilla.mozilla.org/show_bug.cgi?id=238544) - Emit appropriate error if content and matches are used in invalid search combinations.
*   Bug [252190](https://bugzilla.mozilla.org/show_bug.cgi?id=252190) - Fix uninitialized value in editusers.cgi
*   Bug [252002](https://bugzilla.mozilla.org/show_bug.cgi?id=252002) - Fix typo in create-guided.html.tmpl.
*   Bug [240093](https://bugzilla.mozilla.org/show_bug.cgi?id=240093) - get canconfirm working again.
*   Bug [251484](https://bugzilla.mozilla.org/show_bug.cgi?id=251484) - Fix taint error on series create when creating a new product
*   Bug [251567](https://bugzilla.mozilla.org/show_bug.cgi?id=251567) - Make sure "find a specific bug" doesn't miss exact matches in summary
*   Bug [250840](https://bugzilla.mozilla.org/show_bug.cgi?id=250840) - Make the minimum version numbers all agree with reality.
*   Bug [250967](https://bugzilla.mozilla.org/show_bug.cgi?id=250967) - Fix spurious updates to requesteeless flags
*   Bug [250892](https://bugzilla.mozilla.org/show_bug.cgi?id=250892) - Fix w3c validation error on search-specific
*   Bug [250881](https://bugzilla.mozilla.org/show_bug.cgi?id=250881) - Do not change DEFAULT-FORMAT for queries unless one of the standard serach form is used

## Stable (2.16) Branch Checkins Since the Last Status Update

The following checkins have been made to the 2.16 stable branch in the Bugzilla CVS repository since the previous status update:

*   Bug [263165](https://bugzilla.mozilla.org/show_bug.cgi?id=263165) - Make Bugzilla specify table type as MyISAM when creating tables
*   Bug [250897](https://bugzilla.mozilla.org/show_bug.cgi?id=250897) - Limit password reset requests to once every ten minutes to limit mailbombing if someone submits the form multiple times

## Conclusion and Credits

Thank you to all our developers and users who have contributed to this release. We hope to deliver a great 2.18 release and we depend on your feedback and patches to make this happen. Please send us your comments.

Thank you also to all those who contributed to this status update.
