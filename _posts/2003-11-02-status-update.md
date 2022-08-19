---
title: "Bugzilla Status Update"
date: 2003-11-02
author: ["kiko"]
categories:
- Status
---

## Introduction

This status update covers the 6 months that have gone by since our [last update](/blog/2003/04/24/status-update). It's been an interesting period in Bugzilla's time, with a quite a few feature enhancements hitting the trunk and a significant number of external contributions being submitted.

To start off, we'd like to congratulate (and nudge ahead) Vlad Dascalu, Chuck Duvall and Mike Morgan who have been doing excellent work both on triage and on providing bugfixes. Independent contribution has always been the mainstay of Bugzilla development, so it's really nice to see people volunteer the time and expertise that make this a great product. The lowest bug number fixed was [bug 13540](https://bugzilla.mozilla.org/show_bug.cgi?id=13540) -- generalizing previously fixed terms such as "bug" -- which was coaxed in by Jon Wilmoth. A number of others had first-time patches integrated, too, and we'd definitely like to see more good work from you all.

We've got a few security updates that have been covered in the security advisory simultaneously released. The bugs found and fixed are not critical -- they are mainly leaks and minor privilege issues -- but it's always a good idea to update to the latest stable release. The bug fixes have also been applied to the development branch where relevant.

A number of interesting features have also been included (in the trunk); in particular, Gerv integrated a patch that provides [partial email spam-proofing](https://bugzilla.mozilla.org/show_bug.cgi?id=120030), which has always been one of the top requests on public installations. Gerv also landed an extension to Bugzilla which allows [generating charts](https://bugzilla.mozilla.org/show_bug.cgi?id=16009) from Bugzilla-collected data. Another notable feature by the great John Keiser has been included: [Patch Viewer](https://bugzilla.mozilla.org/show_bug.cgi?id=174942), which is an complete (and integrated) diff-viewing tool. I'm not going to spoil the rest of the surprises, so read the sections below to find out what other goodies are in this month's grab bag.

Note that (in tradition with previous updates, which have included a bit on this subject) Windows support (which implies being able to run a Bugzilla instance on a Windows web server) is _still_ to be completed and integrated! We would really appreciate community assistance in fixing the [remaining issues for Windows support](https://bugzilla.mozilla.org/buglist.cgi?product=Bugzilla&resolution=---&status_whiteboard_type=allwordssubstr&status_whiteboard=Win32).

We'd also like to remind all Bugzilla administrators that to assist them in keeping up-to-date with release announcements and security advisories, we provide an ultra-low-volume administrator mailing list (announce@bugzilla.org). We advise all Bugzilla administrators to [subscribe](https://lists.bugzilla.org/cgi-bin/mj_wwwusr?func=lists-full-long&extra=announce) so they can keep up with important Bugzilla news.

## New Releases

The Bugzilla Team is pleased to announce the 2.16.4 and 2.17.5 releases of Bugzilla.

*   The stable (2.16.4) release provides a number of bug fixes, including fixes for 4 security issues discovered since the 2.16.3 release. It is recommended that all production installations upgrade to 2.16.4 to make sure they get the fixes for these [security bugs](/security/2.16.3/).
*   The development (2.17.5) release provides a large number of feature enhancements and bug fixes, including fixes for 3 security issues discovered since the 2.17.4 release. This release is a developers' release and is not intended for production use.

We would like to remind all administrators running Bugzilla instances from the old 2.14 branch that this branch has been retired, and is no longer being supported actively by the team. We strongly recommend upgrading to the latest stable version to ensure security and proper operation.<a name="newfeatures"></a>

## New Features (on the Trunk)

A number of interesting new features are available for testing on our latest development release. The following items describe the most important of them, and the manifests towards the end of this document describe the full list of changes committed.

*   **Patch Viewer:** Viewing and reviewing patches in Bugzilla is often difficult due to lack of context, improper format and the inherent readability issues that raw patches present. Patch Viewer is an enhancement to Bugzilla designed to fix that by offering increased context, linking to sections, and integrating with Bonsai, LXR and CVS. ([174942](https://bugzilla.mozilla.org/show_bug.cgi?id=174942), [215268](https://bugzilla.mozilla.org/show_bug.cgi?id=215268))
*   **Term Customization:** Formerly, the terms "bug" and "Bugzilla" were hard-coded into many places in the templates, which made localizing a Bugzilla instance to an organization's terminology quite difficult. This change allows this localization to be done in a single template file; the localized terms are used in all subsequent templates. ([13540](https://bugzilla.mozilla.org/show_bug.cgi?id=13540))
*   **Comment Reply Links:** In Edit Bug, each bug comment now includes a convenient (reply) link that quotes the comment text into the textarea. This feature is only enabled in Javascript-capable browsers, but causes no inconvenience to other user agents. ([207754](https://bugzilla.mozilla.org/show_bug.cgi?id=207754))
*   **Full-Text Search:** It is now possible to query the Bugzilla database using full-text searching, which spans comments and summaries, and which searches for substrings and stem variations of the search term. ([145588](https://bugzilla.mozilla.org/show_bug.cgi?id=145588))
*   **Email Address Munging:** The fact that raw email addresses are displayed in Bugzilla makes it trivial for bots that spamharvest to spider through Bugzilla, in particular, through Bugzilla's buglists. This change allows obscuring email addresses as they appear in the Bugzilla web pages. ([120030](https://bugzilla.mozilla.org/show_bug.cgi?id=120030), [219216](https://bugzilla.mozilla.org/show_bug.cgi?id=219216))
*   **Generic Charting:** Bugzilla's new charting feature allows you to display flexible summary charts, based on configurable data sets. ([16009](https://bugzilla.mozilla.org/show_bug.cgi?id=16009))

A couple of other features were checked into the trunk, notably prefilling of the default component owner when entering a new bug, a bug alias column in the buglist page, and a "view as buglist" link for the sanity check page.

**A note to users upgrading to version 2.17.5:** Bug [201816](https://bugzilla.mozilla.org/show_bug.cgi?id=201816) changed header output to use CGI.pm, in a step towards enabling mod_perl compatibility. This change will affect users that had customized charsets in their CGI files: previously the charset had to be added everyplace that printed the Content-Type header; now it only needs changing in one spot, in Bugzilla/CGI.pm. Alternatively, Apache's [AddDefaultCharset](https://httpd.apache.org/docs-2.0/mod/core.html#adddefaultcharset) directive can be used.

## The Road to 2.18

**An update from Dave Miller, Bugzilla project leader**

Bugzilla 2.16 was released on July 29, 2002\. It's been just over 15 months since then, and we still don't have a Bugzilla 2.18\. What's the deal? This is what I get asked quite frequently these days. I'm hoping to answer that question here.

The usual way stable Bugzilla releases get planned is that we decide on a feature set that we want to have available in the next version, and then development plugs away until those features are completed. Shortly after version 2.16 came out, several of us sat down and hashed out a list of things that we thought would fit in that list for version 2.18\. In hindsight, the list that we came up with turned out to be a bit much to handle. It didn't look so bad at the time, and in fact I don't think we "overbooked" ourselves, not if everyone's lives had continued as they had been at that time.

What ended up happening is that a large percentage of the core contributors wound up having job changes that eliminated much of the time they used to spend on Bugzilla. We went several months with very little development actually happening. With the lack of available developers in mind, and a desire to get 2.18 out the door as soon as we could and still be able to call it "stable" in good conscience, the list of goals for version 2.18 was revisited, and significantly pared down.

We now have 2 remaining goals that have yet to be completed for version 2.18.

*   Full templatization of the Administrative interfaces (the edit*.cgi files)
*   Out-of-the-box Win32 compatibility

Many of the other items that had been on the list (such as support for PostgreSQL and Sybase, and admin-definable customized fields) will still be taken if they get completed by then, but will no longer hold up the release if they aren't completed.

Things are getting better! The "dire situation" I painted above seems to be abating. As Christian pointed out in his introduction above, we have several new folks contributing on a regular basis. Also, my second-in-command, Myk Melez, is now employed by the Mozilla Foundation as of last month, with continued development of the entire Mozilla Webtools Suite (which includes Bugzilla) now being his primary job responsibility. In short, the future of Bugzilla once again looks very bright!

## Upcoming Features

This section lists major new features that are planned for the next releases. If you would like to help out -- many of these features need either planning, coding, or testing -- or just figure what the current status is on one of these items, check out the parenthesized bug links.

*   Ability to send email via SMTP instead of relying on a local installation of sendmail. (Bug [84876](https://bugzilla.mozilla.org/show_bug.cgi?id=84876))
*   PostgreSQL support. (Bug [98304](https://bugzilla.mozilla.org/show_bug.cgi?id=98304 "Allow Bugzilla to work with Postgres SQL
    (PgSQL)"))
*   Sybase support. (Bug [173130](https://bugzilla.mozilla.org/show_bug.cgi?id=173130 "support Sybase"))
*   Ability to add generic customized fields to bugs. (Bug [91037](https://bugzilla.mozilla.org/show_bug.cgi?id=91037 "a generic implementation for custom fields"))
*   Customised resolutions, that allow adding, removing, deactivating and renaming of resolutions. (Bug [94534](https://bugzilla.mozilla.org/show_bug.cgi?id=94534 "Customised resolutions."))
*   Expanding e-mail preferences to allow watching components, keywords, etc. (Bug [73665](https://bugzilla.mozilla.org/show_bug.cgi?id=73665 "Need an "emailprefs" table"))
*   `mod_perl` support. (Bug [87406](https://bugzilla.mozilla.org/show_bug.cgi?id=87406 "Make Bugzilla work with mod_perl (under
    Apache)"))
*   New makefile-based installation system. ([Bug 104660](https://bugzilla.mozilla.org/show_bug.cgi?id=104660), [Bug 105854](https://bugzilla.mozilla.org/show_bug.cgi?id=105854), [Bug 105855](https://bugzilla.mozilla.org/show_bug.cgi?id=105855), and [Bug 105856](https://bugzilla.mozilla.org/show_bug.cgi?id=105856))
*   Wiki integration. (Bug [102685](https://bugzilla.mozilla.org/show_bug.cgi?id=102685))

Apart from work on Bugzilla itself, Mike Morgan has started work on redesigning the Bugzilla website to a standards-compliant version that matches mozilla.org's new look-and-feel. This is already underway, and we should be seeing a beta site up shortly.

## Trunk Checkins Since the Last Status Update

The following is a list of specific bugs fixed (and their checkin messages) since the last Bugzilla status report. It is ordered by the checkin date as rendered by [Bonsai](http://bonsai.mozilla.org/). It includes checkins on the trunk from 2003/04/25 to 2003/11/02\. This list was generated by filtering Bonsai's output on [that query](http://bonsai.mozilla.org/cvsquery.cgi?module=Bugzilla&branch=HEAD&branch_type=match&sortby=Date&date=explicit&mindate=2003-04-25+00:00&maxdate=2003-11-02+11:59&cvsroot=%2Fcvsroot).

Checkins that don't refer to a specific bug number have been omitted, and were a significant minority. Bold italic bugs are security-sensitive bugs.

Checkin manifest:

*   _**Bug [209742](https://bugzilla.mozilla.org/show_bug.cgi?id=209742 "NEW -
    describecomponents.cgi displays products for which the user can't enter
    bugs") - describecomponents.cgi displays products for which the user can't enter bugs**_
*   _**Bug [219044](https://bugzilla.mozilla.org/show_bug.cgi?id=219044 "NEW - MySQL injection vulnerability in editkeywords.cgi") - MySQL injection vulnerability in editkeywords.cgi**_
*   _**Bug [209376](https://bugzilla.mozilla.org/show_bug.cgi?id=209376 "NEW - Can access summary for secure bug if its been voted on.") - Can access summary for secure bug if its been voted on.**_
*   Bug [210735](https://bugzilla.mozilla.org/show_bug.cgi?id=210735 "NEW - collectstats.pl broken") - collectstats.pl broken. Removes "uninitialised value" warning.
*   Bug [224397](https://bugzilla.mozilla.org/show_bug.cgi?id=224397 "RESOLVED FIXED - Mismatch of user error: insufficient_privs vs insufficient_perms") - Mismatch of user error: insufficient_privs vs insufficient_perms;
*   Bug [123565](https://bugzilla.mozilla.org/show_bug.cgi?id=123565 "RESOLVED FIXED - Add to FAQ: Why can't I close bugs from "Change Several Bugs at Once"
    ?") - Add to FAQ: Why can't I close bugs from "Change Several Bugs at Once" ?
*   Bug [190611](https://bugzilla.mozilla.org/show_bug.cgi?id=190611 "RESOLVED FIXED - Query page crashes if any product has no versions defined") - Query page crashes if any product has no versions defined
*   Bug [220724](https://bugzilla.mozilla.org/show_bug.cgi?id=220724 "RESOLVED FIXED - Provide standalone bug submission program") - Provide standalone bug submission program. Includes a python script that submits bugs to a specified Bugzilla instance.
*   Bug [216707](https://bugzilla.mozilla.org/show_bug.cgi?id=216707 "RESOLVED FIXED - Patch Viewer needs user documentation") - Add user documentation for Patch Viewer
*   Bug [224218](https://bugzilla.mozilla.org/show_bug.cgi?id=224218 "RESOLVED FIXED - Fix wrong version in administration.xml") - Fix wrong version in administration.xml
*   Bug [216703](https://bugzilla.mozilla.org/show_bug.cgi?id=216703 "RESOLVED FIXED - Need PatchReader note in install docs") - Need PatchReader note in install docs
*   Bug [217219](https://bugzilla.mozilla.org/show_bug.cgi?id=217219 "RESOLVED FIXED - Messages in votes errors are incorrectly CHOMP'd") - Messages in votes errors are incorrectly CHOMP'd
*   Bug [223937](https://bugzilla.mozilla.org/show_bug.cgi?id=223937 "RESOLVED FIXED - web site error while updating email address") - web site error while updating email address
*   Bug [47925](https://bugzilla.mozilla.org/show_bug.cgi?id=47925 "RESOLVED FIXED - describe MOVED resolution in bug_status.html") - describe MOVED resolution in bug_status.html
*   Bug [67663](https://bugzilla.mozilla.org/show_bug.cgi?id=67663 "RESOLVED FIXED - globals.pl and CGI.pl emit "subroutine redefined" messages") - globals.pl and CGI.pl emit "subroutine redefined" messages.
*   Bug [221039](https://bugzilla.mozilla.org/show_bug.cgi?id=221039 "RESOLVED FIXED - Separating knob in edit.html.tmpl") - Separating knob in edit.html.tmpl.
*   Bug [111522](https://bugzilla.mozilla.org/show_bug.cgi?id=111522 "RESOLVED FIXED - Provide ability to specify MIME type of attachment when downloading") - Provide ability to specify MIME type of attachment when downloading.
*   Bug [223854](https://bugzilla.mozilla.org/show_bug.cgi?id=223854 "RESOLVED FIXED - masscc on change several bugs doesn't honor usermatchmode") - masscc on change several bugs doesn't honor usermatchmode
*   Bug [222204](https://bugzilla.mozilla.org/show_bug.cgi?id=222204 "RESOLVED FIXED - A mailto: link for the reporter would be very useful.") - A mailto: link for the reporter would be very useful
*   Bug [221900](https://bugzilla.mozilla.org/show_bug.cgi?id=221900 "RESOLVED FIXED - duplicates.cgi query fails if more than one product selected") - duplicates.cgi query fails if more than one product selected
*   Bug [223093](https://bugzilla.mozilla.org/show_bug.cgi?id=223093 "RESOLVED FIXED - perldoc Bugzilla::Auth::DB has wrong title") - correcting the title on "perldoc Bugzilla::Auth::DB"
*   Bug [201294](https://bugzilla.mozilla.org/show_bug.cgi?id=201294 "RESOLVED FIXED - showdependencygraph.cgi uses a hard-coded list of open states") - showdependencygraph.cgi now uses the global IsOpenedState() sub instead of its own list of which states are open.
*   Bug [218386](https://bugzilla.mozilla.org/show_bug.cgi?id=218386 "RESOLVED FIXED - RFE:
    Bugzilla highlight 'view-source:' as links") - add 'view-source:' to the link of URL protocols which automatically get hyperlinked in comments.
*   Bug [208647](https://bugzilla.mozilla.org/show_bug.cgi?id=208647 "RESOLVED FIXED - cygwin, IIS 5.0: Insecure dependency in parameter 1 of
    DBI::db=HASH(0x10611388)->prepare method call while running with -T
    switch at Bugzilla/DB.pm line 64.") - Fixes taint error in add new products code.
*   Bug [183788](https://bugzilla.mozilla.org/show_bug.cgi?id=183788 "RESOLVED FIXED - request
    mail auto-cc not working for original request") - make request mail go out when a request is created and there's no requestee but there is a cc: list
*   Bug [178624](https://bugzilla.mozilla.org/show_bug.cgi?id=178624 "RESOLVED FIXED - template customisation documentation does not tell to run
    checksetup.pl") - checksetup.pl needs to be run after copying templates to the custom directory.
*   Bug [215051](https://bugzilla.mozilla.org/show_bug.cgi?id=215051 "RESOLVED FIXED - Document the language choosing methode used by Bugzilla (Section
    5.7)") - Document the language auto-chooser.
*   Bug [218977](https://bugzilla.mozilla.org/show_bug.cgi?id=218977 ""Table 'namedqueries' was not locked with LOCK TABLES" on ThrowUserError('product_edit_denied')") - "Table 'namedqueries' was not locked with LOCK TABLES" on ThrowUserError('product_edit_denied').
*   Bug [221977](https://bugzilla.mozilla.org/show_bug.cgi?id=221977 "Insecure dependency in require while running with -T switch at Bugzilla/Auth.pm") - Insecure dependency in require while running with -T switch at Bugzilla/Auth.pm
*   Bug [108528](https://bugzilla.mozilla.org/show_bug.cgi?id=108528 "knob is not a defined error message and it does not help a user find the error") - knob is not a defined error message and it does not help a user find the error
*   Bug [222566](https://bugzilla.mozilla.org/show_bug.cgi?id=222566 "Wording on enter_bug.cgi when using the create-guided template") - Fixing wording on enter_bug.cgi when using the create-guided template
*   Bug [108528](https://bugzilla.mozilla.org/show_bug.cgi?id=108528 "knob is not a defined error message and it does not help a user
    find the error") - knob is not defined doesn't explain to 2001110503 users what to do
*   Bug [220034](https://bugzilla.mozilla.org/show_bug.cgi?id=220034 "empty form after changing bug details") - empty form after changing bug details
*   Bug [221391](https://bugzilla.mozilla.org/show_bug.cgi?id=221391 "Bugzilla Quickstart guide could exist.") - Bugzilla Quickstart guide could exist. Provide a QUICKSTART file, and alter README slightly to point to it.
*   Bug [219724](https://bugzilla.mozilla.org/show_bug.cgi?id=219724 "typo in URL in section 4.2.5 of the guide") - typo in URL in section 4.2.5 of the guide.
*   Bug [213384](https://bugzilla.mozilla.org/show_bug.cgi?id=213384 "shutdownhtml login bypass via editparams.cgi is broken under suexec") - shutdownhtml login bypass via editparams.cgi is broken under suexec.
*   Bug [220183](https://bugzilla.mozilla.org/show_bug.cgi?id=220183 "post_bug.cgi could allow setting the status_whiteboard attribute") - post_bug.cgi could allow setting the status_whiteboard attribute. Added "status_whiteboard" to parsed attribute list.
*   Bug [221264](https://bugzilla.mozilla.org/show_bug.cgi?id=221264 "Making no changes shouldn't affect Last modified") - Making no changes shouldn't affect Last modified
*   Bug [219086](https://bugzilla.mozilla.org/show_bug.cgi?id=219086 "use method="post" on the "My Votes" page to be more robust") - use method="post" on the "My Votes" page to submit changes to votes
*   Bug [65316](https://bugzilla.mozilla.org/show_bug.cgi?id=65316 "Typos on edit*.cgi.") - Typos on edit*.cgi. Change use of PutTrailer() (and the default output, in certain cases) in the edit pages.
*   Bug [76157](https://bugzilla.mozilla.org/show_bug.cgi?id=76157 "Give proper error message on non-numeric sortkey.") - Give proper error message on non-numeric sortkey when editing milestones.
*   Bug [219659](https://bugzilla.mozilla.org/show_bug.cgi?id=219659 "Misleading wording describing severity "blocker" on Bugzilla Helper form") - Misleading wording describing severity "blocker" on Bugzilla Helper form.
*   Bug [152748](https://bugzilla.mozilla.org/show_bug.cgi?id=152748 "index.cgi pimps for netscape.com") - Make lack of sidebar support suggest Mozilla instead of Netscape as an upgrade.
*   Bug [177449](https://bugzilla.mozilla.org/show_bug.cgi?id=177449 "When changing email address, old email address confirmation is case sensitive") - When changing email address, old email address confirmation was case sensitive
*   Bug [129315](https://bugzilla.mozilla.org/show_bug.cgi?id=129315 "incorrect column definition for bugs.delta_ts") - incorrect column definition for bugs.delta_ts; adds 'not null' constraint
*   Bug [219216](https://bugzilla.mozilla.org/show_bug.cgi?id=219216 "Problem with @->&#64; filter/munge and <input>") - Javascript improperly using FILTER html instead of FILTER js causing data with @ produced by javascript to show up as &#64.
*   Bug [218569](https://bugzilla.mozilla.org/show_bug.cgi?id=218569 "Clean up reporting UI") - Clean up reporting UI.
*   Bug [219170](https://bugzilla.mozilla.org/show_bug.cgi?id=219170 "A single letter s missing on https://bugzilla.mozilla.org/bug_status.html") - single letter s missing on [https://bugzilla.mozilla.org/bug_status.html](https://bugzilla.mozilla.org/bug_status.html)
*   Bug [180257](https://bugzilla.mozilla.org/show_bug.cgi?id=180257 "incorrect padding around words on "cancel email address change" page") - incorrect padding around words on "cancel email address change" page
*   Bug [208699](https://bugzilla.mozilla.org/show_bug.cgi?id=208699 "Move Throw{Code,Template}Error into Error.pm") - Move Throw{Code,Template}Error into Error.pm.
*   Bug [120030](https://bugzilla.mozilla.org/show_bug.cgi?id=120030 "Munge email addresses to make life difficult for the spammers' spiders") - Bugzilla bug lists are a spammer's paradise.
*   Bug [215918](https://bugzilla.mozilla.org/show_bug.cgi?id=215918 "ALL graphs that show numeric value on x-axis are useless and misleading") - All graphs that show numeric value on x-axis are useless and misleading. We now sort numerical fields numerically.
*   Bug [169354](https://bugzilla.mozilla.org/show_bug.cgi?id=169354 "add "Windows Server 2003" OS") - add "Windows Server 2003" - OS
*   Bug [217632](https://bugzilla.mozilla.org/show_bug.cgi?id=217632 "Remove @@@ comment from message.html.tmpl") - Remove @@@ comment from message.html.tmpl.
*   Bug [218523](https://bugzilla.mozilla.org/show_bug.cgi?id=218523 "Warning in query.cgi") - undefined warning in query.cgi.
*   Bug [218515](https://bugzilla.mozilla.org/show_bug.cgi?id=218515 "Filter tests are failing") - fix tree bustage from bug [207044](https://bugzilla.mozilla.org/show_bug.cgi?id=207044).
*   Bug [207044](https://bugzilla.mozilla.org/show_bug.cgi?id=207044 "Filter more template directives") - Filter more template directives. None of these are security bugs, but they need fixing anyway.
*   Bug [145588](https://bugzilla.mozilla.org/show_bug.cgi?id=145588 "Search query formation requires expert a priori knowledge of reported bugs - should support fulltext indexes") - adds full-text search option for more accurate finding of individual bugs via words that appear in their descriptions/comments/summaries.
*   Bug [215729](https://bugzilla.mozilla.org/show_bug.cgi?id=215729 ""Column 'value' cannot be null" trying to upgrade chart data") - "Column 'value' cannot be null" trying to upgrade chart data.
*   Bug [217422](https://bugzilla.mozilla.org/show_bug.cgi?id=217422 ""0" is missing in "votes: 0" (MySQL 4)") - "0" was missing in "votes: 0" (MySQL 4 compatibility)
*   Bug [165366](https://bugzilla.mozilla.org/show_bug.cgi?id=165366 "When editparams is used to shutdown Bugzilla, provide a link back to editparams") - When editparams is used to shutdown Bugzilla, provide a link back to editparams
*   Bug [65383](https://bugzilla.mozilla.org/show_bug.cgi?id=65383 "Clean up milestone prefs - currmilestone and nummilestones are obsolete.") - Clean up milestone prefs - currmilestone and nummilestones are obsolete
*   Bug [190040](https://bugzilla.mozilla.org/show_bug.cgi?id=190040 "sanitycheck should have "view as buglist" links after lists of bugs") - sanitycheck now has "view as buglist" links after lists of bugs as well as all listed bugs linked
*   Bug [217242](https://bugzilla.mozilla.org/show_bug.cgi?id=217242 "CheckIfVotedConfirmed tripped Table 'fielddefs' was not locked with LOCK TABLES [for statement ``SELECT fieldid  FROM fielddefs WHERE name = 'bug_status''']") - CheckIfVotedConfirmed tripped Table 'fielddefs' was not locked with LOCK TABLES [for statement ``SELECT fieldid FROM fielddefs WHERE name = 'bug_status''']
*   Bug [207754](https://bugzilla.mozilla.org/show_bug.cgi?id=207754 "It should be possible to produce a quoted reply to a comment") - It should be possible to produce a quoted reply to a comment. Adds a reply link that uses JS to paste in a quoted comment into the comment textarea.
*   Bug [199502](https://bugzilla.mozilla.org/show_bug.cgi?id=199502 "It's possible to take down Bugzilla by changing the languages param") - It's possible to take down Bugzilla by changing the languages param
*   Bug [213577](https://bugzilla.mozilla.org/show_bug.cgi?id=213577 "New reporting imports old series with wrong status query") - New reporting imports old series with wrong status query.
*   Bug [217485](https://bugzilla.mozilla.org/show_bug.cgi?id=217485 "debug query doesn't display in "please wait" serverpush page") - displays query in the "please wait" server push page if the "debug" parameter is set in the URL.
*   Bug [217256](https://bugzilla.mozilla.org/show_bug.cgi?id=217256 "No Interdiff Notification message has two run on words") - "No Interdiff Notification message has two run on words." Patch adds newlines where they are needed.
*   Bug [217029](https://bugzilla.mozilla.org/show_bug.cgi?id=217029 "error message on mecha for "View Bugs Already Reported Today"") - creates appropriate date string if string is empty now that Date::Parse 2.27 doesn't do it for us auto-magically.
*   Bug [217103](https://bugzilla.mozilla.org/show_bug.cgi?id=217103 "page.cgi doesn't work.") - page.cgi passes the correct pathname prefix in the correct place, so it actually works now.
*   Bug [160422](https://bugzilla.mozilla.org/show_bug.cgi?id=160422 "Can't locate data/versioncache in @INC") - If data/versioncache is not readable, pretend it's expired and rebuild it.
*   Bug [192385](https://bugzilla.mozilla.org/show_bug.cgi?id=192385 "Bug ID wordwraps in change-several-bugs page if window is narrow") - Bug ID wordwraped in change-several-bugs page if window was narrow
*   Bugs [171127](https://bugzilla.mozilla.org/show_bug.cgi?id=171127 "bug_email.pl is broken") and [192512](https://bugzilla.mozilla.org/show_bug.cgi?id=192512) - bug_email.pl was still using the old groups system and also the old outgoing mail system. This patch brings it up to date.
*   Bug [139011](https://bugzilla.mozilla.org/show_bug.cgi?id=139011 "Improve buglist colors further") - Improve buglist colors further.
*   bug [215268](https://bugzilla.mozilla.org/show_bug.cgi?id=215268 ""Diff" link comes up even if PatchReader is not installed") - Check for PatchReader as a part of the installation and disable the "Diff" links if it is not there.
*   Bug [216019](https://bugzilla.mozilla.org/show_bug.cgi?id=216019 "Change various sentences in BugMail.pm") - Change various sentences in BugMail.pm
*   Bug [215962](https://bugzilla.mozilla.org/show_bug.cgi?id=215962 "Time Tracking: field => "field" not wrapped in {},
    causing bad params to ThrowUserError in process_bug.cgi") - Missing {} around implied hash reference in params to ThrowUserError.
*   Bug [204560](https://bugzilla.mozilla.org/show_bug.cgi?id=204560 "Add alias to long format bug list if enabled") - display alias in long listing.
*   Bug [212095](https://bugzilla.mozilla.org/show_bug.cgi?id=212095 "checksetup.pl requires downgrade of DBD::mysql to 2.1026 (reports 'fielddefs' already exists)") - checksetup.pl gets confused by newer DBD::mysql quoting of table values.
*   Bug [120030](https://bugzilla.mozilla.org/show_bug.cgi?id=120030 "Munge email addresses to make life difficult for the spammers' spiders") - adds template filter for obscuring email addresses.
*   Bug [214558](https://bugzilla.mozilla.org/show_bug.cgi?id=214558 "unnecessary output from checksetup.pl "which: no interdiff in (/usr/bin:/bin)"") - Don't spew "which: program not found" errors all the time
*   Bug [174942](https://bugzilla.mozilla.org/show_bug.cgi?id=174942 "Patch Viewer") - Patch Viewer, a pretty way of viewing and manipulating patches. Requires PatchIterator to be installed, classes uploaded to that bug and will be soon in CPAN.
*   Bug [153583](https://bugzilla.mozilla.org/show_bug.cgi?id=153583 "Links to obsoleted attachment should use line-through style") - Links to obsoleted attachment should use line-through style
*   Bug [211435](https://bugzilla.mozilla.org/show_bug.cgi?id=211435 ""Table 'namedqueries' was not locked with LOCK TABLES" when updating hours worked") - Fix "Table 'namedqueries' was not locked with LOCK TABLES" error.
*   Bug [206558](https://bugzilla.mozilla.org/show_bug.cgi?id=206558 "semantics of multiple selections from pulldown list are unclear") - What happened when multiple items were selected on a multi-select box wasn't clear.
*   Bug [183898](https://bugzilla.mozilla.org/show_bug.cgi?id=183898 "checksetup.pl doesn't accepts admin passwords with dots") - checksetup.pl doesn't accepts admin passwords with dots.
*   Bug [213079](https://bugzilla.mozilla.org/show_bug.cgi?id=213079 "When severity or priority are hidden, CSS class names are incomplete in buglist") - When severity or priority are hidden, CSS class names are incomplete in buglist.
*   Bug [98147](https://bugzilla.mozilla.org/show_bug.cgi?id=98147 "The 'ViewAll attachments' link should be greyed out if there are none") - disables "View All Attachments" link if there are no attachments to view.
*   Bug [178935](https://bugzilla.mozilla.org/show_bug.cgi?id=178935 "edit users/add users shouldn't include a link to https://bugzilla.mozilla.org/editusers.cgi?action=add if the permission flag isn't set") - Eliminating the "Add another user" link on the confirmation screen after editing a user if the user doing the editing doesn't have permission to add users.
*   Bug [213085](https://bugzilla.mozilla.org/show_bug.cgi?id=213085 "DBname_to_id($qa_contact) in importxml.pl") - importxml.pl tries to convert qa_contact from a name to an ID when it's already an ID
*   Bug [147480](https://bugzilla.mozilla.org/show_bug.cgi?id=147480 "Lack of newlines when asking for password in checksetup.pl.") - Lack of newlines when asking for password in checksetup.pl.
*   Bug [82172](https://bugzilla.mozilla.org/show_bug.cgi?id=82172 "Don't allow empty bug summaries") - Don't allow empty bug summaries.
*   Bug [95759](https://bugzilla.mozilla.org/show_bug.cgi?id=95759 "localconfig.js contains strings of equals signs (===)") - localconfig.js contains strings of equals signs (===).
*   Bug [207206](https://bugzilla.mozilla.org/show_bug.cgi?id=207206 "doeditparams.cgi XHTML compatibility") - doeditparams.cgi XHTML compatibility.
*   Bug [122365](https://bugzilla.mozilla.org/show_bug.cgi?id=122365 "Allow installation definable LDAP filters as a Parameter") - Allow installation definable LDAP filters.
*   Bug [204798](https://bugzilla.mozilla.org/show_bug.cgi?id=204798 "Total in graph report is incorrect") - Total in graph report is incorrect.
*   Bug [203444](https://bugzilla.mozilla.org/show_bug.cgi?id=203444 "Add request for about:buildconfig to Bugzilla Helper") - Add request for about:buildconfig to Bugzilla Helper.
*   Bug [212361](https://bugzilla.mozilla.org/show_bug.cgi?id=212361 "month and day are backwards in ISO date in "GetLongDescriptionAsText"") - Additional Comments date had month and day swapped in bug change emails
*   Bug [185066](https://bugzilla.mozilla.org/show_bug.cgi?id=185066 "The OS "BSDI" should be "BSD/OS"...") - The OS "BSDI" should be "BSD/OS"... Patch changes the default in localconfig; admins will have to change existing installations manually.
*   Bug [107580](https://bugzilla.mozilla.org/show_bug.cgi?id=107580 ""New" announcements should be tweaked to sort before regular email") - Add space to front of "New:" designator on bugmail so it will always sort before changed mails in an alphabetical subject listing in user mailboxes.
*   Bug [211758](https://bugzilla.mozilla.org/show_bug.cgi?id=211758 "default parameter handling broken during upgrade") - checksetup.pl was trying to use params that didn't exist yet because it was loading Bugzilla::Series at compile time (use). Now pulls in Bugzilla::Series at runtime (require) after initializing the params.
*   Bug [13540](https://bugzilla.mozilla.org/show_bug.cgi?id=13540 "Bugzilla should be more generic, adaptable, and customizable") - allow key terms, like "Bugzilla" and "bug", to be altered without changing all the templates.
*   Bug [194347](https://bugzilla.mozilla.org/show_bug.cgi?id=194347 "OS-specific instructions for OS X no longer needs patch for GD perl module") - Updating MacOS X hints to specify that the GD patch is no longer required (when using the gd2 package) and also recommend using fink to install expat.
*   Bug [211126](https://bugzilla.mozilla.org/show_bug.cgi?id=211126 "Bugzilla::Auth::LDAP needs documenting (to replace section 4.2.4)") - As a part of fixing bug [180642](https://bugzilla.mozilla.org/show_bug.cgi?id=180642) the directions for using LDAP authentication has changed.
*   Bug [211127](https://bugzilla.mozilla.org/show_bug.cgi?id=211127 "chart.cgi uses /usr/bonsaitools/bin/perl instead of /usr/bin/perl") - use proper path to Perl.
*   Bug [201955](https://bugzilla.mozilla.org/show_bug.cgi?id=201955 "Change instructions for using a Charset in Bugzilla") - The method for specifing a charset has changed now that we use CGI.pm for header output (bug [201816](https://bugzilla.mozilla.org/show_bug.cgi?id=201816)).
*   Bug [206498](https://bugzilla.mozilla.org/show_bug.cgi?id=206498 "There should be a warning that there is no way back once the database is changed") - Add a warning that Bugzilla upgrades are irreversable and that backups should be made.
*   Bug [210248](https://bugzilla.mozilla.org/show_bug.cgi?id=210248 "os-specific.html 4.3.1.3.2: maybe missing a "my" before the line "$smtp_server = 'smtp.mycompany.com';  # change this" (The Bugzilla Guide - 2.17.4 Development Release)") - Missing "my" in SMTP code for win32 instructions.
*   Bug [193575](https://bugzilla.mozilla.org/show_bug.cgi?id=193575 "'Internal Server Error ' from votes.cgi assuming a user is logged in") - Internal server error from votes.cgi.
*   Bug [16009](https://bugzilla.mozilla.org/show_bug.cgi?id=16009 "General summary charts") - generic charting.
*   Bug [204631](https://bugzilla.mozilla.org/show_bug.cgi?id=204631 "config.cgi should generate list of queryable fields") - enhances config.cgi to generate a list of queryable fields so third-party clients can populate search forms with the list.
*   Bug [210324](https://bugzilla.mozilla.org/show_bug.cgi?id=210324 "s/->err/->error/ in Bugzilla::Auth::LDAP") - s/->err/->error/.
*   Bug [77192](https://bugzilla.mozilla.org/show_bug.cgi?id=77192 "MOVED is not handled properly on queryhelp.cgi.") - MOVED is not handled properly on queryhelp.cgi.
*   Bug [207096](https://bugzilla.mozilla.org/show_bug.cgi?id=207096 "minor spelling fixes for Bugzilla/Search.pm") - minor spelling fixes for Bugzilla/Search.pm
*   Bug [208620](https://bugzilla.mozilla.org/show_bug.cgi?id=208620 "Fix return value of Bugzilla->login when user already
    exists") - Fix return value of Bugzilla->login when user already exists.
*   Bug [208583](https://bugzilla.mozilla.org/show_bug.cgi?id=208583 "Remove PerformSubsts from templates") - Remove PerformSubsts from templates.
*   Bug [205463](https://bugzilla.mozilla.org/show_bug.cgi?id=205463 "Tokens aren't canceled after a successful login") - Tokens aren't canceled after a successful login.
*   Bug [180635](https://bugzilla.mozilla.org/show_bug.cgi?id=180635 "Enhance Bugzilla::User to store additional information") - Enhance Bugzilla::User to store additional information
*   Bug [207085](https://bugzilla.mozilla.org/show_bug.cgi?id=207085 "Updating a stored query shouldn't return the same message as creating one") - Updating a stored query shouldn't return the same message as creating one
*   Bug [37749](https://bugzilla.mozilla.org/show_bug.cgi?id=37749 "query for changes to specific field in last n days not working") - query for changes to specific field in last n days not working. Rearrange time-based query UI to be more sane.
*   Bug [84876](https://bugzilla.mozilla.org/show_bug.cgi?id=84876 "MTA (sendmail/exim/postfix) do-it-all config patch") - Mentioned the wrong bug number, also making it a link.
*   Bug [145965](https://bugzilla.mozilla.org/show_bug.cgi?id=145965 "Amendment to the Windows installation guide") - Mention the sendmail -> SMTP change for Bugzilla on win32
*   Bug [199129](https://bugzilla.mozilla.org/show_bug.cgi?id=199129 "Link to new "Hall of Fame" page (A.1.4)") - Replace installation list w/a link to the installation list on the web page
*   Bug [191034](https://bugzilla.mozilla.org/show_bug.cgi?id=191034 "Refactor Installation chapter") - Making the installation chapter a little more generic. Replaced a lot of OS Specific hints with links to the OS Specific section.
*   Bug [204724](https://bugzilla.mozilla.org/show_bug.cgi?id=204724 "ExcludeSelf doesn't work if having registered with an email containing capital letters") - ExcludeSelf doesn't work with an email containing capital letters.
*   Bug [195977](https://bugzilla.mozilla.org/show_bug.cgi?id=195977 "ability to show alias column in buglist") - Add ability to show alias column in buglist
*   Bug [203314](https://bugzilla.mozilla.org/show_bug.cgi?id=203314 "Clean up of <ulink>s.") - Clean up <ulink>'s, links to bugs and extra spaces in sentences.
*   Bug [204592](https://bugzilla.mozilla.org/show_bug.cgi?id=204592 "invalid column name error (2.17.3 > 2.17.4)") - invalid column name error.
*   Bug [204964](https://bugzilla.mozilla.org/show_bug.cgi?id=204964 "attachment view broken on cvs tip") - Make attachment view work again.
*   Bug [190864](https://bugzilla.mozilla.org/show_bug.cgi?id=190864 "typo in MySQL setup instructions") - Fix ordering of ' and > that I thought I had done earlier.
*   Bug [203867](https://bugzilla.mozilla.org/show_bug.cgi?id=203867 "Add regular expression references to glossary") - Add regular expression references to glossary.
*   Bug [201816](https://bugzilla.mozilla.org/show_bug.cgi?id=201816 "use CGI.pm for header output") - use CGI.pm for header output
*   Bug [204104](https://bugzilla.mozilla.org/show_bug.cgi?id=204104 "internal error in Search.pm when searching for invalid keyword or an email with no email type specified") - internal error in Search.pm when searching for invalid keywords/email.
*   Bug [204008](https://bugzilla.mozilla.org/show_bug.cgi?id=204008 "checksetup.pl doesn't set correct permissions on js/ directory") - checksetup.pl didn't set permissions on the js directory
*   Bug [72837](https://bugzilla.mozilla.org/show_bug.cgi?id=72837 "Bugzilla should produce JS version of Components/Products etc.") - a script that generates configuration information for a Bugzilla installation.
*   Bug [200198](https://bugzilla.mozilla.org/show_bug.cgi?id=200198 "user-error.html.tmpl's use [% changedsince %] instead of $changedsince") - user-error.html.tmpl's use [% changedsince %] instead of $changedsince
*   Bug [195607](https://bugzilla.mozilla.org/show_bug.cgi?id=195607 "Minimum width code gets it wrong") - Minimum width code gets it wrong.
*   Bug [197171](https://bugzilla.mozilla.org/show_bug.cgi?id=197171 "report.cgi: Use of uninitialized value in numeric lt") - report.cgi: Use of uninitialized value in numeric lt.
*   Bug [180086](https://bugzilla.mozilla.org/show_bug.cgi?id=180086 "Rename 'count' column in votes tables") - Rename 'count' column in votes tables.
*   Bug [203540](https://bugzilla.mozilla.org/show_bug.cgi?id=203540 "RenameField doesn't get NULL/NOT NULL correct") - RenameField doesn't get NULL/NOT NULL correct.
*   Bug [202463](https://bugzilla.mozilla.org/show_bug.cgi?id=202463 "Prefill "Assign To:" with default component owner") - prefill 'assign to' with default component owner.
*   Bug [203080](https://bugzilla.mozilla.org/show_bug.cgi?id=203080 "new version of contrib/bugzilla_ldapsync.rb (ldap to bugzilla account sync script)") - New version of LDAP to Bugzilla account sync script.
*   Bug [203318](https://bugzilla.mozilla.org/show_bug.cgi?id=203318 "008filter.t fails to do chdir $topdir - if @Support::Templates::include_paths returns more than one path") - 008filter.t fails to do chdir $topdir - if @Support::Templates::include_paths returns more than one path
*   Bug [203160](https://bugzilla.mozilla.org/show_bug.cgi?id=203160 "Link to mod_throttle has changed") - mod_throttle has a new URL.

## Stable (2.16) Branch Checkins Since the Last Status Update

The following is a list of specific bugs fixed (and their checkin messages) since the last Bugzilla status report. It is ordered by the checkin date as rendered by [Bonsai](http://bonsai.mozilla.org/). It includes checkins on the branch from 2003/04/25 to 2003/10/30\. This list was generated by filtering Bonsai's output on [that query](http://bonsai.mozilla.org/cvsquery.cgi?treeid=default&module=Bugzilla&branch=BUGZILLA-2_16-BRANCH&branchtype=match&dir=&file=&filetype=match&who=&whotype=match&sortby=Date&hours=2&date=explicit&mindate=04%2F25%2F2003+19%3A58&maxdate=10%2F30%2F2003+09%3A45&cvsroot=%2Fcvsroot) (with some manual adjustments).

Very few checkins were made without reference to any specific bugs, mainly test bustage fixes and documentation updates. Bold italic bugs are security-sensitive bugs.

Checkin manifest:

*   _**Bug [219690](https://bugzilla.mozilla.org/show_bug.cgi?id=219690 "ASSIGNED - When deleting products and usebuggroups is set, blessgroupset is not updated") - When deleting products and usebuggroups is set, blessgroupset is not updated**_
*   _**Bug [219044](https://bugzilla.mozilla.org/show_bug.cgi?id=219044 "NEW - MySQL injection vulnerability in editkeywords.cgi") - MySQL injection vulnerability in editkeywords.cgi**_
*   _**Bug [209376](https://bugzilla.mozilla.org/show_bug.cgi?id=209376 "NEW - Can access summary for secure bug if its been voted on.") - Can access summary for secure bug if its been voted on.**_
*   _**Bug [214290](https://bugzilla.mozilla.org/show_bug.cgi?id=214290 "NEW - collectstats.pl does not add \'s to SQL queries for
    quotes") - collectstats.pl does not add \'s to SQL queries for quotes".**_
*   Bug [123565](https://bugzilla.mozilla.org/show_bug.cgi?id=123565 "RESOLVED FIXED - Add to
    FAQ: Why can't I close bugs from "Change Several Bugs at Once"
    ?") - Add to FAQ: Why can't I close bugs from "Change Several Bugs at Once" ?
*   Bug [223937](https://bugzilla.mozilla.org/show_bug.cgi?id=223937) - web site error while updating email address
*   Bug [178624](https://bugzilla.mozilla.org/show_bug.cgi?id=178624) - checksetup.pl needs to be run after copying a template to the custom directory.
*   Bug [220332](https://bugzilla.mozilla.org/show_bug.cgi?id=220332 "Insecure dependency in exec while running with -T switch at process_bug.cgi line 1267.") - Insecure dependency in exec while running with -T switch at process_bug.cgi line 1267
*   Bug [221626](https://bugzilla.mozilla.org/show_bug.cgi?id=221626 "Mozilla-specific report template") - Fix for Mozilla-specific report template.
*   Bug [219724](https://bugzilla.mozilla.org/show_bug.cgi?id=219724 "typo in URL in section 4.2.5 of the guide") - typo in URL in section 4.2.5 of the guide.
*   Bug [213384](https://bugzilla.mozilla.org/show_bug.cgi?id=213384 "shutdownhtml login bypass via editparams.cgi is broken under suexec") - shutdownhtml login bypass via editparams.cgi is broken under suexec.
*   Bug [219508](https://bugzilla.mozilla.org/show_bug.cgi?id=219508 "processmail rescanall will not send multiple e-mails to the same address") - processmail rescanall would not send e-mails about more than one bug to the same address
*   Bug [217422](https://bugzilla.mozilla.org/show_bug.cgi?id=217422 ""0" is missing in "votes: 0" (MySQL 4)") - "0" is missing in "votes: 0" (MySQL 4 Compatibility)
*   Bug [160422](https://bugzilla.mozilla.org/show_bug.cgi?id=160422 "Can't locate data/versioncache in @INC") - If versioncache isn't readable, pretend it doesn't exist and recreate it. This tends to happen after cron jobs run as a user other than the webserver.
*   Bug [177828](https://bugzilla.mozilla.org/show_bug.cgi?id=177828 "Taint warning from post_bug with perl 5.8") - Fixes taint warning from post_bug with perl 5.8
*   Bug [212095](https://bugzilla.mozilla.org/show_bug.cgi?id=212095 "checksetup.pl requires downgrade of DBD::mysql to 2.1026 (reports 'fielddefs' already exists)") - DBD::mysql versions after 2.1026 return the table list quoted, which broke the existing "table exists" check.
*   Bug [146087](https://bugzilla.mozilla.org/show_bug.cgi?id=146087 "'sendmailnow' should be on by default.") - 'sendmailnow' should be on by default.
*   Bug [190864](https://bugzilla.mozilla.org/show_bug.cgi?id=190864 "typo in MySQL setup instructions") - Fix the ordering of the ' and >.
*   Bug [203318](https://bugzilla.mozilla.org/show_bug.cgi?id=203318 "008filter.t fails to do chdir $topdir - if @Support::Templates::include_paths returns more than one path") - 008filter.t fails to do chdir $topdir - if @Support::Templates::include_paths returns more than one path
*   Bug [203160](https://bugzilla.mozilla.org/show_bug.cgi?id=203160 "Link to mod_throttle has changed") - mod_throttle has a new URL

## Conclusion and Credits

Well, that's it for this status update. We'd like to thank everybody who submitted a patch, helpful comment or bug to Bugzilla -- it's very much appreciated, even when everybody's too busy to stop and say "great work"; we always mean it! Let's work together to make 2.18 the killer release we all want it to be.

[Christian: I should also really mention Paul Reed, who (apart from preparing many of our previous status updates) provided the bug manifests for this one -- no, actually, I stole them!]
