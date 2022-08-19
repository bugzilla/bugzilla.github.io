---
title: "Bugzilla Status Update"
date: 2002-07-28
author: ["gerv", "preed"]
categories:
- Status
---

## Introduction

[It's here](https://www.bugzilla.org/download.html)! That's right, after tracking down a number of small regressions, **2.16 is out of the door** (for Unix users at least; Win32 users, see [note below](#win32).)

We have also released 2.14.3, a tiny update for 2.14.2 for people who aren't yet ready to upgrade to 2.16, but would like column sorting in buglists to work.

## Administrators' Mailing List

We've started a mailing list for people who administer Bugzillas. It'll be very low traffic - basically, release announcements and security advisories only. We advise all Bugzilla administrators to [subscribe](https://lists.bugzilla.org/cgi-bin/mj_wwwusr?func=lists-full-long&extra=announce
), so we can easily contact them with important news.

## Localisation

Meanwhile, on the trunk, the last few pieces of infrastructure have been checked in to permit the localisation of all Bugzilla's error messages and system messages, which were previously embedded in the Perl code. The Bugzilla Team is now looking for those who wish to localise Bugzilla to contribute patches moving our (large number) of error messages out of the CGI files into the templates. This is a reasonably large but fairly simple job, and each one moved becomes localisable. If you are able to help with this, please contact [Gerv](#).

<a name="win32"></a>

## The Win32 Situation

Unfortunately, the templatization of process_bug.cgi broke the ability for Bugzilla to send bug update notifications via email on Windows due to the way ActiveState Perl handles fork(). There is a fix for this in the works, but it involves **major** code changes, and we didn't want to hold up the 2.16 release for another month to give it adequate testing. The bottom line is, if you're using Win32, you **do not want** Bugzilla 2.16.

A 2.16.1 was considered, but given our resource considerations, the plan is to make the trunk Win32-friendly (which involves the above change and many others) and then announce that fact, so Win32 Bugzilla administrators can pull from the trunk. The Bugzilla Team continue to recommend Linux as the best platform for a Bugzilla installation :-)

For up-to-date information on this topic, see bugs [124174](https://bugzilla.mozilla.org/show_bug.cgi?id=124174 "processmail should be a package") and [84876](https://bugzilla.mozilla.org/show_bug.cgi?id=84876 "MTA Config do-it-all patch").

## 2.16 Goals

So, how did we do?

*   HTML 4.01 Transitional compliance **(complete for templatised pages)**
*   Templatization of all customer-visible CGI pages, to allow easy customization by the administrator **(complete)**
*   Allow users to change their own email addresses **(complete)**
*   Remove old attachment code in favor of the new attachment tracker system **(complete)**
*   Enable Perl's taint mode for all user-accessible CGI files, and taint-check anything being sent to the database **(complete)**

Not so badly, then :-). To give you some idea of what can be done with templates, compare [this](https://bugzilla.mozilla.org/enter_bug.cgi?product=Bugzilla) to [this](https://bugzilla.mozilla.org/enter_bug.cgi?product=Bugzilla&format=guided).

## Upcoming Major Features

Major new features are being working on. If you would like to know when we plan on adding one of these feature, you can get that information from the bug requesting its implementation. These include:

*   Ability to send email via SMTP instead of relying on a local installation of sendmail. (Bug [84876](https://bugzilla.mozilla.org/show_bug.cgi?id=84876))
*   PostgreSQL support. (Bug [98304](https://bugzilla.mozilla.org/show_bug.cgi?id=98304 "Allow Bugzilla to work with Postgres SQL (PgSQL)"))
*   Ability to have more than 55 groups, which will also allow a finer grained rights system to be introduced. (Bug [68022](https://bugzilla.mozilla.org/show_bug.cgi?id=68022 "Need more than 55 groups"))
*   Ability to add generic customized fields to bugs (Bug [91037](https://bugzilla.mozilla.org/show_bug.cgi?id=91037 "a generic implementation for custom fields"))
*   Customised resolutions, that allow adding, removing, deactivating and renaming of resolutions. (Bug [94534](https://bugzilla.mozilla.org/show_bug.cgi?id=94534 "Customised resolutions."))
*   Expanding the e-mail preferences to allow watching components, keywords, etc. (Bug [73665](https://bugzilla.mozilla.org/show_bug.cgi?id=73665 "Need an "emailprefs" table"))
*   Request tracker, for managing requests to change things about bugs. (Bug [98801](https://bugzilla.mozilla.org/show_bug.cgi?id=98801 "request tracker")) - **Now being tested by the Bugzilla Team on bugzilla.mozilla.org**
*   `mod_perl` support. (Bug [87406](https://bugzilla.mozilla.org/show_bug.cgi?id=87406 "Make Bugzilla work with mod_perl (under Apache)"))
*   New makefile-based installation system ([Bug 104660](https://bugzilla.mozilla.org/show_bug.cgi?id=104660), [Bug 105854](https://bugzilla.mozilla.org/show_bug.cgi?id=105854), [Bug 105855](https://bugzilla.mozilla.org/show_bug.cgi?id=105855), and [Bug 105856](https://bugzilla.mozilla.org/show_bug.cgi?id=105856))

## Trunk Checkins Since the Last Status Update

The following is a list of specific bugs fixed (and their checkin messages) since the last Bugzilla status report. It is ordered by the checkin date, as ordered by Bonsai. It includes checkins on the **trunk** from **05/08/2002** to **07/30/2002**. This list was generated by filtering the output from Bonsai; if you're interested, you can run [the query for yourself](http://bonsai.mozilla.org/cvsquery.cgi?treeid=default&module=Bugzilla&branch=HEAD&branchtype=match&dir=&file=&filetype=match&who=&whotype=match&sortby=Date&hours=2&date=explicit&mindate=05%2F08%2F2002+17%3A00%3A00&maxdate=07%2F30%2F2002+00%3A00%3A00&cvsroot=%2Fcvsroot).

The following checkins were made without reference to any specific bugs:

*   5/9/2002 - Release Notes Updates (MattyT)
*   5/25/2002 - Release Notes Updates (MattyT)
*   6/03/2002 - Release Notes Updates (MattyT)
*   6/04/2002 - Release Notes Updates (MattyT)
*   6/07/2002 - Release Notes Updates (MattyT)
*   7/21/2002 - Trivial template "and QA Contact" fix (Gerv)

**Da big list:**

*   Fix for bug [154008](https://bugzilla.mozilla.org/show_bug.cgi?id=154008 "Basic script maintenance: contrib email scripts (bug_email.pl & bugzilla_email_append.pl)"): some basic (but incomplete) maintenance on bug_email.pl, also fixes a possible security hole with a misuseof a system() call.
*   Bug [67950](https://bugzilla.mozilla.org/show_bug.cgi?id=67950 "Move the quip list into the database")c - make quips.cgi compile without warnings, by use vars-ing $userid.
*   Bug [67950](https://bugzilla.mozilla.org/show_bug.cgi?id=67950 "Move the quip list into the database")b - quick fixes.
*   Bug [67950](https://bugzilla.mozilla.org/show_bug.cgi?id=67950 "Move the quip list into the database") - Move the quip list into the database.
*   Bug [158660](https://bugzilla.mozilla.org/show_bug.cgi?id=158660 "confirm_login in CGI.pl should use a template for the login dialog") - confirm_login in CGI.pl should use a template for the login dialog.
*   bug [159200](https://bugzilla.mozilla.org/show_bug.cgi?id=159200 "Implement accesskeys on search page") - support accesskey in search page.
*   Bug [102648](https://bugzilla.mozilla.org/show_bug.cgi?id=102648 "Show_bug should include ACCESSKEY") - a little more thought. We are changing Platform to Hardware (see the search page) for usability; if we do that, Product can be P and Hardware can be H.
*   Bug [102648](https://bugzilla.mozilla.org/show_bug.cgi?id=102648 "Show_bug should include ACCESSKEY") - Bugzilla should support accesskey.
*   bug [158498](https://bugzilla.mozilla.org/show_bug.cgi?id=158498 "defparams.pl prints an error message in a check function instead of returning it") - defparams.pl prints an error message in a check function instead of returning it.
*   Bug [96003](https://bugzilla.mozilla.org/show_bug.cgi?id=96003 "buglist.cgi shouldn't find all bugs if loaded without parameters") - buglist.cgi should not return all bugs if called without any parameters.
*   Bug [143650](https://bugzilla.mozilla.org/show_bug.cgi?id=143650 "General template display system") - general template display system.
*   Tree bustage fix of bug [157074](https://bugzilla.mozilla.org/show_bug.cgi?id=157074 "verify-new-product doubles comment linefeeds on Win32"): a filter had the wrong name in hidden-fields template.
*   Bug [95426](https://bugzilla.mozilla.org/show_bug.cgi?id=95426 "Remove $onebug cruft.") - remove $onebug cruft.
*   Bug [157074](https://bugzilla.mozilla.org/show_bug.cgi?id=157074 "verify-new-product doubles comment linefeeds on Win32") - verify-new-product doubles comment linefeeds on Win32
*   Bug [151648](https://bugzilla.mozilla.org/show_bug.cgi?id=151648 "'QA Contact' column presented with useqacontact = Off") - QA Contact stuff displayed even if you aren't using QA Contacts.
*   Bug [156426](https://bugzilla.mozilla.org/show_bug.cgi?id=156426 "Query interface uses ´ instead of ' in "doesn't""): Query interface had ´:s instead of ':s in "doesn't".
*   Bug [156680](https://bugzilla.mozilla.org/show_bug.cgi?id=156680 "Undefined variable warning from createaccount.cgi"): "Undefined variable warning" in createaccount.cgi
*   Bug [156844](https://bugzilla.mozilla.org/show_bug.cgi?id=156844 "'use of uninitialized value in string eq' warning") - 'use of uninitialized value in string eq' warning
*   Bug [117297](https://bugzilla.mozilla.org/show_bug.cgi?id=117297 "Email address added twice in ADD CCs due to case-insensitive query"): CC list mailing had case-sensitive dupe checking, making it possible to mail both "a@b.com" and"a@B.com".
*   Fix for bug [156559](https://bugzilla.mozilla.org/show_bug.cgi?id=156559 "mysqld-watcher.pl should kill multiple queries at once, quicker, and with better notification"): Changes to mysqld-watcher.pl to make it kill queries quicker, kill 'em all at once, give better notifications, and not include globals.pl, which is unnecessary.
*   Fix for bug [156563](https://bugzilla.mozilla.org/show_bug.cgi?id=156563 "RDF output should include URI of installation being queried"): Adds URI of installation to RDF output of buglist.cgi.
*   Bug [155031](https://bugzilla.mozilla.org/show_bug.cgi?id=155031 "Search by votes is shown even when votes are turned off") - search by votes is shown even when votes are turned off.
*   Bug [155793](https://bugzilla.mozilla.org/show_bug.cgi?id=155793 "$::FORM is not tainted under perl 5.6.1") - $::FORM is not tainted under perl 5.6.1
*   Fix for bug [156564](https://bugzilla.mozilla.org/show_bug.cgi?id=156564 "treat bug IDs as integers in RDF output"): flag bug IDs as integers in the RDF output of buglist.cgi.
*   Bug [156568](https://bugzilla.mozilla.org/show_bug.cgi?id=156568 "data dir is not correctly created") - data dir is not correctly created
*   Bug [150829](https://bugzilla.mozilla.org/show_bug.cgi?id=150829 "'My Votes' link missing from footer") - 'My Votes' link missing from footer
*   bug [155861](https://bugzilla.mozilla.org/show_bug.cgi?id=155861 "showdependancygraph.cgi fails taint check with local dot installation") - showdependancygraph.cgi fails taint check with local dotinstallation
*   Bug [149246](https://bugzilla.mozilla.org/show_bug.cgi?id=149246 "need to be able to specify relative dates in days"): Allow use of relative time units in query screen.
*   Fix for bug [150925](https://bugzilla.mozilla.org/show_bug.cgi?id=150925 "Cannot change e-mail address for bugzilla account."): make email address changes work.
*   Recheckin fix for bug [150798](https://bugzilla.mozilla.org/show_bug.cgi?id=150798 "Extra whitespace included in saved query links") which I accidentaly broke in the fix for bug[150770](https://bugzilla.mozilla.org/show_bug.cgi?id=150770)
*   Bug [151714](https://bugzilla.mozilla.org/show_bug.cgi?id=151714 "user with no canconfirm permission should not get option to mark bugs they reported as NEW") - user with no canconfirm permission should not get option tomark bugs they reported as NEW
*   Fix for bug [150804](https://bugzilla.mozilla.org/show_bug.cgi?id=150804 "keywords should default to all"): makes "allwords" the default when searching for keywords.
*   Bug [105472](https://bugzilla.mozilla.org/show_bug.cgi?id=105472 "no mention that expectbigqueries unnecessary with mysql >=3.23.2") - expectbigqueries unnecessary with mysql >=3.23.
*   Fix for bug [155700](https://bugzilla.mozilla.org/show_bug.cgi?id=155700 "taint error in SendSQL when called from ValidateBugID"): detaints bug ID in ValidateBugID so it doesn't fail taint checks.2rx=bbaetz
*   Bug [155388](https://bugzilla.mozilla.org/show_bug.cgi?id=155388 "Site navigation bar link broken in 2.16"): <link> elements for next/prev/first/last in buglists didn't appear post-templatization.
*   Bug [155343](https://bugzilla.mozilla.org/show_bug.cgi?id=155343 "header.html.tmpl has an unused "extra" parameter"): header template interface comment correction: extra parameter renamed to header_html.
*   Bug [145795](https://bugzilla.mozilla.org/show_bug.cgi?id=145795 "editcomponents use the term product where component should be used"): editcomponents had error messages referring to products where it should've been components.
*   Bug [155744](https://bugzilla.mozilla.org/show_bug.cgi?id=155744 "used only once warning in checksetup.pl"): fix a used only once warning in tinderbox caused by myk's checkin of bug [99203](https://bugzilla.mozilla.org/show_bug.cgi?id=99203).
*   Bug [62000](https://bugzilla.mozilla.org/show_bug.cgi?id=62000 "Bug file attachments broken under Windows"): File attachments don't work on Windows. Note: only the code from the patch was checked in, thedocumentation issue was split to bug [155743](https://bugzilla.mozilla.org/show_bug.cgi?id=155743).
*   Fix for bug [99203](https://bugzilla.mozilla.org/show_bug.cgi?id=99203 "alias for a bug"): Implements bug aliases feature.
*   Bug [151871](https://bugzilla.mozilla.org/show_bug.cgi?id=151871 "performance problems in quoteUrls") - rewrite quoteUrls to fix major performance problems, and afew other misc bugs too.
*   Fix for bug [122900](https://bugzilla.mozilla.org/show_bug.cgi?id=122900 "allow user to turn off email notification for Unconfirmed bugs"): implements email preference for unconfirmed bugs.
*   Fix for bug [149347](https://bugzilla.mozilla.org/show_bug.cgi?id=149347 "incorrect interface comment in header.html.tmpl"): Corrects interface comment to refer to "javascript" parameter instead of "jscript" parameter.
*   Bug [150770](https://bugzilla.mozilla.org/show_bug.cgi?id=150770 "Lost <nobr> arround query results") - Lost <nobr> arround query results
*   Bug [155033](https://bugzilla.mozilla.org/show_bug.cgi?id=155033 "standardizing on <a>NAME</a>: vs. <a>NAME:</a>") - standardizing on <a>NAME</a>: vs. <a>NAME:</a>patch by davef@tetsubo.com,
*   Bug [152693](https://bugzilla.mozilla.org/show_bug.cgi?id=152693 "duplicates-table.html.tmpl fails to mention "resolution" field in bug records") - added "resolution" to the INTERFACE comment.
*   Bug [151281](https://bugzilla.mozilla.org/show_bug.cgi?id=151281 "duplicates.cgi performance work") - change duplicates.cgi to make one query instead of several thousand.
*   Bug [148488](https://bugzilla.mozilla.org/show_bug.cgi?id=148488 "More HTML validation fixes") - more HTML validation fixes
*   Bug [154036](https://bugzilla.mozilla.org/show_bug.cgi?id=154036 "ccing an invalid user on a bug posts the bug anyway") - ccing an invalid user on a bug posts the bug anyway
*   Bug [157085](https://bugzilla.mozilla.org/show_bug.cgi?id=157085 "process_bug midair check happens too late") - verify-new-product doesn't set defaults
*   Bug [152632](https://bugzilla.mozilla.org/show_bug.cgi?id=152632 "'My Bugs' in footer doesn't reflect mybugstemplate param"): My bugs query doesn't use the mybugstemplate parameter. Also removes the My Bugs query from the index page.
*   Bug [152772](https://bugzilla.mozilla.org/show_bug.cgi?id=152772 "buglist.cgi truncates emails at 45 characters") - buglist.cgi truncates emails at 45 characters.
*   Bug [150153](https://bugzilla.mozilla.org/show_bug.cgi?id=150153 "ConnectToDatabase/quietly_check_login issues.") - ConnectToDatabase/quietly_check_login issues pt
*   Bug [153629](https://bugzilla.mozilla.org/show_bug.cgi?id=153629 "Remember query options contains invalid html"): Clean up the HTML in the remembered query option knob section of the query page.
*   Bug [150778](https://bugzilla.mozilla.org/show_bug.cgi?id=150778 "Extraneous blank line above initial comments."): Remove an extraneous linefeed above initial bug comments (not visible in all browsers).
*   Bug [152283](https://bugzilla.mozilla.org/show_bug.cgi?id=152283 "Show votes / by bug has a logged out footer"): Show votes by bug -list has a logged out footer.
*   Bug [151217](https://bugzilla.mozilla.org/show_bug.cgi?id=151217 "buglist references the wrong priority field") - buglist references the wrong priority field.
*   Bug [152541](https://bugzilla.mozilla.org/show_bug.cgi?id=152541 "After deleting remembered query it is still in page footer") - After deleting remembered query it is still in page footer
*   Bug [150955](https://bugzilla.mozilla.org/show_bug.cgi?id=150955 "confirmation doesn't propagate when reassigning to new product/component") - confirmation doesn't propagate when reassigning to new product/component.
*   Fix for bug [150792](https://bugzilla.mozilla.org/show_bug.cgi?id=150792 "CCs when creating bug gives an error"): Locks profiles table so adding a CC while creating a bug doesn't fail.
*   Bug [151529](https://bugzilla.mozilla.org/show_bug.cgi?id=151529 "No list of votes shown if there is a plus sign (+) in the address") - No list of votes shown if there is a + sign in the address
*   Bug [151053](https://bugzilla.mozilla.org/show_bug.cgi?id=151053 "Buttons fail to fire actions in java applet"), ConnectToDatabase/quietly_check_login sometimes not calledearly enough
*   Bug [151369](https://bugzilla.mozilla.org/show_bug.cgi?id=151369 "Rejected valid username when reassigning") - need to trim the entered assignee's email address
*   Bug [148712](https://bugzilla.mozilla.org/show_bug.cgi?id=148712 "Add component with empty/invalid initial owner results in double header output") - add component with error/invalid initial owner results indouble header outputpatch by stu@xanboo.com (Stu Tomlinson),
*   Bug [151695](https://bugzilla.mozilla.org/show_bug.cgi?id=151695 "Can't access bug assigned to me") - assignee/qa contact can't access secure bugs
*   Fix for bug [151658](https://bugzilla.mozilla.org/show_bug.cgi?id=151658 "moving doesn't work"): get UI for moving bugs showing again.
*   Bug [151122](https://bugzilla.mozilla.org/show_bug.cgi?id=151122 "Email prefs: Reporter / Owner messed up") - Email prefs: Reporter / Owner messed up.
*   Bug [151327](https://bugzilla.mozilla.org/show_bug.cgi?id=151327 "verify_new_product.html.tmpl prints wrong message") - verify_new_product.html.tmpl prints wrong message.
*   Bug [151023](https://bugzilla.mozilla.org/show_bug.cgi?id=151023 "duplicates.cgi sort by delta sorts wrong direction") - duplicates.cgi sort by delta sorts in wrong direction.
*   Bug [150882](https://bugzilla.mozilla.org/show_bug.cgi?id=150882 "SQL error when sorting by bugs.votes with explicit direction") - SQL error when sorting by bugs.votes with explicit direction
*   Bug [150802](https://bugzilla.mozilla.org/show_bug.cgi?id=150802 "Default version for bug entry not read from cookies") - default version for bug entry not read from cookies
*   Bug [150826](https://bugzilla.mozilla.org/show_bug.cgi?id=150826 "missing space between lists of attachments") - missing space between list of attachments
*   Bug [150798](https://bugzilla.mozilla.org/show_bug.cgi?id=150798 "Extra whitespace included in saved query links") - Extra whitespace included in saved query links
*   Backing out change I accidentally made while checking in fix for bug [137855](https://bugzilla.mozilla.org/show_bug.cgi?id=137855 "classic format for query form").
*   Fix for bug [150703](https://bugzilla.mozilla.org/show_bug.cgi?id=150703 "make query.cgi support formats"): Adds format support to query.cgi.2rx=gerv
*   Bug [149845](https://bugzilla.mozilla.org/show_bug.cgi?id=149845 "buglist.cgi checks for ORDER validity are wrong") - buglist.cgi checks for ORDER validity are wrong
*   Fix for bug [149964](https://bugzilla.mozilla.org/show_bug.cgi?id=149964 "quietly_check_login() needs to be called in colchange.cgi") - quietly_check_login() needs to be called in colchange.cgi.
*   Backing out incorrect change to background color that was accidentally checked in as part of the fix for bug [148179](https://bugzilla.mozilla.org/show_bug.cgi?id=148179 "parameterize body tag attribute values").
*   Bug [148919](https://bugzilla.mozilla.org/show_bug.cgi?id=148919 "Make entryheader a separate template."): Make entryheader a separate template. (again)
*   Fix for bug [148679](https://bugzilla.mozilla.org/show_bug.cgi?id=148679 "Permit multiple stylesheets in header template"): permit multiple stylesheets in the header template.
*   Fix for bug [148179](https://bugzilla.mozilla.org/show_bug.cgi?id=148179 "parameterize body tag attribute values"): Cleans up interface to header.html.tmpl.
*   Bug #[142890](https://bugzilla.mozilla.org/show_bug.cgi?id=142890 "make banner html a separate template"): Make the banner a separate template.
*   Bug [143574](https://bugzilla.mozilla.org/show_bug.cgi?id=143574 "file error - cache failed to write [foo].tmpl: Permission denied") - taint errors with alternate formats. Also make data/templatewritable for non webservergroup users.
*   Bug [144285](https://bugzilla.mozilla.org/show_bug.cgi?id=144285 "checksetup.pl fails to set data dir (and other dir) permissions properly") - checksetup.pl fails to set data dir (and other dir)permissions properly
*   Fix for bug [148767](https://bugzilla.mozilla.org/show_bug.cgi?id=148767 "buglist.cgi outputs a warning if first query doesn't have a sort order"): Eliminates warning in rare situations.
*   Fix for bug [145030](https://bugzilla.mozilla.org/show_bug.cgi?id=145030 "verify-new-product template uses cgi.pm?"): Removes use of CGI.pm from Template Toolkit until problems with it can be investigated and resolved.
*   Bug [93167](https://bugzilla.mozilla.org/show_bug.cgi?id=93167 "&GroupExists and &GroupIsActive should push and pop sql state") - &GroupExists and &GroupIsActive should push and pop sql state
*   Bug [148674](https://bugzilla.mozilla.org/show_bug.cgi?id=148674 "Boolean Charts don't work in Netpositive because '-' is sent as '%2D'") Boolean Charts don't work in Netpositive because '-' is sent as '%2DThis makes CGI.pl closer to CGI.pm by having it unescape the name field in addition to the value field.
*   Bug [145702](https://bugzilla.mozilla.org/show_bug.cgi?id=145702 "query.cgi doesn't always ConnectToDatabase() early enough") - query.cgi doesn't always ConnectToDatabase() early enough
*   Fix for bug [147476](https://bugzilla.mozilla.org/show_bug.cgi?id=147476 "dot .htaccess issues not documented."): the affect of changing your dot/webdot preferences on your web server's accessibility option (.htaccessfor Apache) is now mentioned in the parameter description.
*   Fix for bug [143108](https://bugzilla.mozilla.org/show_bug.cgi?id=143108 "localconfig says that $webservergroup = "" will prevent permission changes"): comment change in localconfig to eliminate incorrect statement that your permissions won't get touched if$webservergroup is empty.
*   Bug [147486](https://bugzilla.mozilla.org/show_bug.cgi?id=147486 "2.14.1/2.16 branches and trunk needs security audit against cross-site scripting bugs") - Fixes cross site scripting issues; first checked in on the 2.14.1 branch, but I forgot the 2.16 branch/trunk (thanks bbaetz); patch=preed,
*   Bug [148363](https://bugzilla.mozilla.org/show_bug.cgi?id=148363 "Minor html glitch on the enter_bug template") - minor html glitch on the enter_bug templatepatch by jouni@heikniemi.net (Jouni Heikniemi),
*   Fix for bug [148157](https://bugzilla.mozilla.org/show_bug.cgi?id=148157 "Bad sorting in describecomponents.cgi") - Bad sorting in describecomponents.cgi, patch by David Lawrence <dkl@redhat.com>
*   Fix for bug [148011](https://bugzilla.mozilla.org/show_bug.cgi?id=148011 "put TT pseudo-method additions together in globals.pl"): Move pseudo-method definitions together.
*   Bug [147272](https://bugzilla.mozilla.org/show_bug.cgi?id=147272 "No background for Bugzilla pages.") - no background for bugzilla pages
*   Bug [144728](https://bugzilla.mozilla.org/show_bug.cgi?id=144728 "Midair collision doubles line feeds") - Midair collision doubles line feeds.
*   Bug [145849](https://bugzilla.mozilla.org/show_bug.cgi?id=145849 "Non-maintainers with ability to bless others need "users" link in footer") - Non-maintainers with ability to bless others need "users" link in footer.
*   Bug [146091](https://bugzilla.mozilla.org/show_bug.cgi?id=146091 "Sort order for votes is ascending instead of descending.") - Sort order for votes is ascending instead of descending.
*   Bug [144768](https://bugzilla.mozilla.org/show_bug.cgi?id=144768 "Selecting multiple products on query page causes script error in IE") - Selecting multiple products on query page causes script error in IE.
*   Fix for bug [146261](https://bugzilla.mozilla.org/show_bug.cgi?id=146261 "Email not sent to users on CC list under some Status field transitions"): fixes bug preventing the sending of email to users when the status of bugs changes in some situations.
*   Bug [93667](https://bugzilla.mozilla.org/show_bug.cgi?id=93667 "Sanity check cleanup."): Add comments to uncommented sections of sanitycheck.cgi
*   Bug [144565](https://bugzilla.mozilla.org/show_bug.cgi?id=144565 "describecomponents.cgi shows wrong components when user has access to only one product") - describecomponents.cgi shows wrong components when user hasaccess to only one productBug [145113](https://bugzilla.mozilla.org/show_bug.cgi?id=145113) - describecomponents doesn't call quietly_check_login()
*   Fix for bug [47251](https://bugzilla.mozilla.org/show_bug.cgi?id=47251 "Make bugzilla use valid HTML 4.01 Transitional"): Make HTML output HTML 4.01 Transitional compliant.
*   Fix for bug [143743](https://bugzilla.mozilla.org/show_bug.cgi?id=143743 "Warning generated in dependency tree"): Eliminates warning by properly initializing array reference.Fix by Myk Melez <myk@mozilla.org>.
*   Bug [143586](https://bugzilla.mozilla.org/show_bug.cgi?id=143586 "required modules tests should be sorted") - required modules tests should be sorted.
*   Bug [144165](https://bugzilla.mozilla.org/show_bug.cgi?id=144165 "enter_bug product selection has a footer like without a login if no usebuggroupsentry") - enter_bug product selection has a footer like without a login if no usebuggroupsentry.
*   Fix for bug [144091](https://bugzilla.mozilla.org/show_bug.cgi?id=144091 "old-params.txt need to be in .cvsignore"): adding old-params.txt to .cvsignore
*   Bug [129466](https://bugzilla.mozilla.org/show_bug.cgi?id=129466 "logincookies IP check can be bypassed") - Adding a comment per a discussion w/ bbaetz on IRC about having backported this bug's patch to the 2_14_1-BRANCH, which was checked in today
*   Bug [143560](https://bugzilla.mozilla.org/show_bug.cgi?id=143560 "showdependencytree.cgi eats all available memory if there's a circular dependency") - showdependencytree.cgi eats all available memory if there's a circular dependency.
*   Bug [143486](https://bugzilla.mozilla.org/show_bug.cgi?id=143486 "enter_bug.cgi: Using ?format=simple doesn't work") - enter_bug.cgi: Using ?format=simple doesn't work.
*   Fix for bug [143547](https://bugzilla.mozilla.org/show_bug.cgi?id=143547 ""secure bugs" also grey in list (.bz_secure set) even if usebuggroups is on"): Don't show bugs as grey if usebuggroups parameter is set to true.
*   Fix for bug [78701](https://bugzilla.mozilla.org/show_bug.cgi?id=78701 "it's impossible to press OK button in the modal dialog"): missing . in INVALID description in queryhelp.cgi
*   Bug [143231](https://bugzilla.mozilla.org/show_bug.cgi?id=143231 "Changing a bug with an empty buglist gives a warning") - Changing a bug with an empty buglist gives a warning.
*   Fix for bug [135449](https://bugzilla.mozilla.org/show_bug.cgi?id=135449 "Allow preset queries to override the last sort order"): allows named queries to override the last sort order.
*   Bug [143251](https://bugzilla.mozilla.org/show_bug.cgi?id=143251 "RFE: checksetup.pl should report module version in error message") - RFE: checksetup.pl should report module version in error message.

## 2.16 Checkins Since the Last Status Update

The following is a list of specific bugs fixed (and their checkin messages) since the last Bugzilla status report. It is ordered by the checkin date, as ordered by Bonsai. It includes checkins on the **BUGZILLA-2_16-BRANCH** from **05/08/2002** to **07/30/2002**. This list was generated by filtering the output from Bonsai; if you're interested, you can run [run the query for yourself](http://bonsai.mozilla.org/cvsquery.cgi?treeid=default&module=Bugzilla&branch=BUGZILLA-2_16-BRANCH&branchtype=match&dir=&file=&filetype=match&who=&whotype=match&sortby=Date&hours=2&date=explicit&mindate=05%2F08%2F2002+17%3A00%3A00&maxdate=07%2F30%2F2002+00%3A00%3A00&cvsroot=%2Fcvsroot).

The following checkins were made without reference to any specific bugs:

*   05/09/2002 - Release Notes Updates (MattyT)
*   05/12/2002 - Various documentation updates (Gerv)
*   05/23/2002 - Release Notes Updates (MattyT)
*   05/25/2002 - Various documentation updates (Gerv)
*   05/25/2002 - Release Notes Updates (MattyT)
*   06/03-07/2002 - Release Notes Updates (MattyT)
*   07/13/2002 - Various documentation Updates (Gerv)
*   07/25/2002 - Removed various old documentation files and varioius updates (Gerv)

**Da big list:**

*   Fix for bug [154008](https://bugzilla.mozilla.org/show_bug.cgi?id=154008 "Basic script maintenance: contrib email scripts (bug_email.pl & bugzilla_email_append.pl)"): some basic (but incomplete) maintenance on bug_email.pl, also fixes a possible security hole with a misuseof a system() call.
*   Tree bustage fix of bug [157074](https://bugzilla.mozilla.org/show_bug.cgi?id=157074 "verify-new-product doubles comment linefeeds on Win32"): a filter had the wrong name in hidden-fields template.
*   Bug [157074](https://bugzilla.mozilla.org/show_bug.cgi?id=157074 "verify-new-product doubles comment linefeeds on Win32") - verify-new-product doubles comment linefeeds on Win32
*   Bug [151648](https://bugzilla.mozilla.org/show_bug.cgi?id=151648 "'QA Contact' column presented with useqacontact = Off") - QA Contact stuff displayed even if you aren't using QA Contacts.
*   Bug [156426](https://bugzilla.mozilla.org/show_bug.cgi?id=156426 "Query interface uses � instead of ' in "doesn't""): Query interface had �:s instead of ':s in "doesn't".
*   Bug [156680](https://bugzilla.mozilla.org/show_bug.cgi?id=156680 "Undefined variable warning from createaccount.cgi"): "Undefined variable warning" in createaccount.cgi
*   Bug [155031](https://bugzilla.mozilla.org/show_bug.cgi?id=155031 "Search by votes is shown even when votes are turned off") - search by votes is shown even when votes are turned off.
*   Bug [155793](https://bugzilla.mozilla.org/show_bug.cgi?id=155793 "$::FORM is not tainted under perl 5.6.1") - $::FORM is not tainted under perl 5.6.1
*   Bug [156568](https://bugzilla.mozilla.org/show_bug.cgi?id=156568 "data dir is not correctly created") - data dir is not correctly created
*   Bug [150829](https://bugzilla.mozilla.org/show_bug.cgi?id=150829 "'My Votes' link missing from footer") - 'My Votes' link missing from footer
*   bug [155861](https://bugzilla.mozilla.org/show_bug.cgi?id=155861 "showdependancygraph.cgi fails taint check with local dot installation") - showdependancygraph.cgi fails taint check with local dotinstallation
*   Fix for bug [150925](https://bugzilla.mozilla.org/show_bug.cgi?id=150925 "Cannot change e-mail address for bugzilla account."): Make email changes work.
*   Recheckin fix for bug [150798](https://bugzilla.mozilla.org/show_bug.cgi?id=150798 "Extra whitespace included in saved query links") which I accidentaly broke in the fix for bug[150770](https://bugzilla.mozilla.org/show_bug.cgi?id=150770)
*   Bug [151714](https://bugzilla.mozilla.org/show_bug.cgi?id=151714 "user with no canconfirm permission should not get option to mark bugs they reported as NEW") - user with no canconfirm permission should not get option tomark bugs they reported as NEW
*   Fix for bug [150804](https://bugzilla.mozilla.org/show_bug.cgi?id=150804 "keywords should default to all"): Makes "allwords" the default when searching by keyword.
*   Bug [155388](https://bugzilla.mozilla.org/show_bug.cgi?id=155388 "Site navigation bar link broken in 2.16"): next/prev/first/last <link> (Mozilla's Site navigation bar) didn't work after 2.16 templatization.
*   Bug [155343](https://bugzilla.mozilla.org/show_bug.cgi?id=155343 "header.html.tmpl has an unused "extra" parameter"): header template interface comment correction: extra parameter renamed to header_html.Note: the patch on the bug didn't apply cleanly to branch anymore; fixed manually.
*   Fix for bug [149347](https://bugzilla.mozilla.org/show_bug.cgi?id=149347 "incorrect interface comment in header.html.tmpl"): Corrects interface comment to refer to "javascript" parameter instead of "jscript".
*   Bug [150770](https://bugzilla.mozilla.org/show_bug.cgi?id=150770 "Lost <nobr> arround query results") - Lost <nobr> arround query results
*   Bug [155033](https://bugzilla.mozilla.org/show_bug.cgi?id=155033 "standardizing on <a>NAME</a>: vs. <a>NAME:</a>") - standardizing on <a>NAME</a>: vs. <a>NAME:</a>patch by davef@tetsubo.com,
*   Bug [154036](https://bugzilla.mozilla.org/show_bug.cgi?id=154036 "ccing an invalid user on a bug posts the bug anyway") - ccing an invalid user on a bug posts the bug anyway
*   Bug [157085](https://bugzilla.mozilla.org/show_bug.cgi?id=157085 "process_bug midair check happens too late") - verify-new-product doesn't set defaults
*   Bug [152632](https://bugzilla.mozilla.org/show_bug.cgi?id=152632 "'My Bugs' in footer doesn't reflect mybugstemplate param"): My bugs query in the footer doesn't use the mybugstemplate parameter. Also removes the My Bugs link from the index page.
*   Bug [152772](https://bugzilla.mozilla.org/show_bug.cgi?id=152772 "buglist.cgi truncates emails at 45 characters") - buglist.cgi truncates emails at 45 characters.
*   Bug [153629](https://bugzilla.mozilla.org/show_bug.cgi?id=153629 "Remember query options contains invalid html"): Clean up the HTML in the remembered query option knob section of the query page.
*   Bug [150778](https://bugzilla.mozilla.org/show_bug.cgi?id=150778 "Extraneous blank line above initial comments."): Remove an extraneous linefeed above initial bug comments (not visible in all browsers).
*   Bug [152283](https://bugzilla.mozilla.org/show_bug.cgi?id=152283 "Show votes / by bug has a logged out footer"): Show votes by bug -list has a logged out footer.
*   Bug [151217](https://bugzilla.mozilla.org/show_bug.cgi?id=151217 "buglist references the wrong priority field") - buglist references the wrong priority field.
*   Bug [152541](https://bugzilla.mozilla.org/show_bug.cgi?id=152541 "After deleting remembered query it is still in page footer") - After deleting remembered query it is still in page footer
*   Bug [150955](https://bugzilla.mozilla.org/show_bug.cgi?id=150955 "confirmation doesn't propagate when reassigning to new product/component") - confirmation doesn't propagate when reassigning to new product/component.
*   Fix for bug [150792](https://bugzilla.mozilla.org/show_bug.cgi?id=150792 "CCs when creating bug gives an error"): Locks profiles table so adding a CC while creating a bug doesn't fail.
*   Bug [151529](https://bugzilla.mozilla.org/show_bug.cgi?id=151529 "No list of votes shown if there is a plus sign (+) in the address") - No list of votes shown if there is a + sign in the address
*   Bug [151053](https://bugzilla.mozilla.org/show_bug.cgi?id=151053 "Buttons fail to fire actions in java applet"), ConnectToDatabase/quietly_check_login sometimes not calledearly enough
*   Bug [151369](https://bugzilla.mozilla.org/show_bug.cgi?id=151369 "Rejected valid username when reassigning") - need to trim the entered assignee's email address
*   Bug [148712](https://bugzilla.mozilla.org/show_bug.cgi?id=148712 "Add component with empty/invalid initial owner results in double header output") - add component with error/invalid initial owner results indouble header outputpatch by stu@xanboo.com (Stu Tomlinson),
*   Bug [151695](https://bugzilla.mozilla.org/show_bug.cgi?id=151695 "Can't access bug assigned to me") - assignee/qa contact can't access secure bugs
*   Bug [151122](https://bugzilla.mozilla.org/show_bug.cgi?id=151122 "Email prefs: Reporter / Owner messed up") - Email prefs: Reporter / Owner messed up.
*   Bug [151327](https://bugzilla.mozilla.org/show_bug.cgi?id=151327 "verify_new_product.html.tmpl prints wrong message") - verify_new_product.html.tmpl prints wrong message.
*   Bug [151023](https://bugzilla.mozilla.org/show_bug.cgi?id=151023 "duplicates.cgi sort by delta sorts wrong direction") - duplicates.cgi sort by delta sorts in wrong direction.
*   Bug [150882](https://bugzilla.mozilla.org/show_bug.cgi?id=150882 "SQL error when sorting by bugs.votes with explicit direction") - SQL error when sorting by bugs.votes with explicit direction
*   Bug [150802](https://bugzilla.mozilla.org/show_bug.cgi?id=150802 "Default version for bug entry not read from cookies") - default version for bug entry not read from cookies
*   Bug [150826](https://bugzilla.mozilla.org/show_bug.cgi?id=150826 "missing space between lists of attachments") - missing space between list of attachments
*   Bug [150798](https://bugzilla.mozilla.org/show_bug.cgi?id=150798 "Extra whitespace included in saved query links") - Extra whitespace included in saved query links
*   Bug [149845](https://bugzilla.mozilla.org/show_bug.cgi?id=149845 "buglist.cgi checks for ORDER validity are wrong") - buglist.cgi checks for ORDER validity are wrong
*   Fix for bug [148993](https://bugzilla.mozilla.org/show_bug.cgi?id=148993 "debug flag in buglist not working. (2.16 hack)"): Makes debug work in the query part of buglist.cgi.
*   Fix for bug [149964](https://bugzilla.mozilla.org/show_bug.cgi?id=149964 "quietly_check_login() needs to be called in colchange.cgi") - quietly_check_login() needs to be called in colchange.cgi.
*   Bug [148919](https://bugzilla.mozilla.org/show_bug.cgi?id=148919 "Make entryheader a separate template."): Make entryheader a separate template (again).
*   Fix for bug [148679](https://bugzilla.mozilla.org/show_bug.cgi?id=148679 "Permit multiple stylesheets in header template"): permit multiple stylesheets in the header template.
*   Fix for bug [148179](https://bugzilla.mozilla.org/show_bug.cgi?id=148179 "parameterize body tag attribute values"): Cleans up interface to header.html.tmpl.
*   Bug #[142890](https://bugzilla.mozilla.org/show_bug.cgi?id=142890 "make banner html a separate template"): Make the banner a separate template.
*   Bug [143574](https://bugzilla.mozilla.org/show_bug.cgi?id=143574 "file error - cache failed to write [foo].tmpl: Permission denied") - taint errors with alternate formats. Also make data/templatewritable for non webservergroup users.
*   Bug [144285](https://bugzilla.mozilla.org/show_bug.cgi?id=144285 "checksetup.pl fails to set data dir (and other dir) permissions properly") - checksetup.pl fails to set data dir (and other dir)permissions properly
*   Fix for bug [148767](https://bugzilla.mozilla.org/show_bug.cgi?id=148767 "buglist.cgi outputs a warning if first query doesn't have a sort order"): Eliminates warning in rare situations.
*   Fix for bug [145030](https://bugzilla.mozilla.org/show_bug.cgi?id=145030 "verify-new-product template uses cgi.pm?"): Removes use of CGI.pm from Template Toolkit until problems with it can be resolved.
*   Bug [93167](https://bugzilla.mozilla.org/show_bug.cgi?id=93167 "&GroupExists and &GroupIsActive should push and pop sql state") - &GroupExists and &GroupIsActive should push and pop sql state
*   Bug [148674](https://bugzilla.mozilla.org/show_bug.cgi?id=148674 "Boolean Charts don't work in Netpositive because '-' is sent as '%2D'") Boolean Charts don't work in Netpositive because '-' is sent as '%2DThis makes CGI.pl closer to CGI.pm by having it unescape the name field in addition to the value field.
*   Bug [145702](https://bugzilla.mozilla.org/show_bug.cgi?id=145702 "query.cgi doesn't always ConnectToDatabase() early enough") - query.cgi doesn't always ConnectToDatabase() early enough
*   Fix for bug [147476](https://bugzilla.mozilla.org/show_bug.cgi?id=147476 "dot .htaccess issues not documented."): the affect of changing your dot/webdot preferences on your web server's accessibility option (.htaccessfor Apache) is now mentioned in the parameter description.
*   Fix for bug [143108](https://bugzilla.mozilla.org/show_bug.cgi?id=143108 "localconfig says that $webservergroup = "" will prevent permission changes"): comment change in localconfig to eliminate incorrect statement that your permissions won't get touched if$webservergroup is empty.
*   Bug [147486](https://bugzilla.mozilla.org/show_bug.cgi?id=147486 "2.14.1/2.16 branches and trunk needs security audit against cross-site scripting bugs") - Fixes cross site scripting issues; first checked in on the 2.14.1 branch, but I forgot the 2.16 branch/trunk (thanks bbaetz)
*   Bug [148363](https://bugzilla.mozilla.org/show_bug.cgi?id=148363 "Minor html glitch on the enter_bug template") - minor html glitch on the enter_bug templatepatch by jouni@heikniemi.net (Jouni Heikniemi),
*   Fix for bug [148157](https://bugzilla.mozilla.org/show_bug.cgi?id=148157 "Bad sorting in describecomponents.cgi") - Bad sorting in describecomponents.cgi, patch by David Lawrence <dkl@redhat.com>
*   Fix for bug [148011](https://bugzilla.mozilla.org/show_bug.cgi?id=148011 "put TT pseudo-method additions together in globals.pl"): move TT pseudo-method declarations together.
*   Bug [147272](https://bugzilla.mozilla.org/show_bug.cgi?id=147272 "No background for Bugzilla pages.") - no background for bugzilla pages
*   Bug [144728](https://bugzilla.mozilla.org/show_bug.cgi?id=144728 "Midair collision doubles line feeds") - Midair collision doubles line feeds.
*   Bug [145849](https://bugzilla.mozilla.org/show_bug.cgi?id=145849 "Non-maintainers with ability to bless others need "users" link in footer") - Non-maintainers with ability to bless others need "users" link in footer.
*   Bug [146091](https://bugzilla.mozilla.org/show_bug.cgi?id=146091 "Sort order for votes is ascending instead of descending.") - Sort order for votes is ascending instead of descending.
*   Bug [144768](https://bugzilla.mozilla.org/show_bug.cgi?id=144768 "Selecting multiple products on query page causes script error in IE") - Selecting multiple products on query page causes script error in IE.
*   Fix for bug [47251](https://bugzilla.mozilla.org/show_bug.cgi?id=47251 "Make bugzilla use valid HTML 4.01 Transitional"): Make Bugzilla HTML 4.01 Transitional compliant.
*   Bug [144565](https://bugzilla.mozilla.org/show_bug.cgi?id=144565 "describecomponents.cgi shows wrong components when user has access to only one product") - describecomponents.cgi shows wrong components when user hasaccess to only one product
*   Bug [145113](https://bugzilla.mozilla.org/show_bug.cgi?id=145113) - describecomponents doesn't call quietly_check_login()
*   Fix for bug [143743](https://bugzilla.mozilla.org/show_bug.cgi?id=143743 "Warning generated in dependency tree"): Eliminates warning by properly initializing array reference.Fix by Myk Melez <myk@mozilla.org>.
*   Bug [143586](https://bugzilla.mozilla.org/show_bug.cgi?id=143586 "required modules tests should be sorted") - required modules tests should be sorted.
*   Fix for bug [144091](https://bugzilla.mozilla.org/show_bug.cgi?id=144091 "old-params.txt need to be in .cvsignore"): adding old-params.txt to .cvsignore
*   Bug [144165](https://bugzilla.mozilla.org/show_bug.cgi?id=144165 "enter_bug product selection has a footer like without a login if no usebuggroupsentry") - enter_bug product selection has a footer like without a login if no usebuggroupsentry.
*   Bug [129466](https://bugzilla.mozilla.org/show_bug.cgi?id=129466 "logincookies IP check can be bypassed") - Adding a comment per a discussion w/ bbaetz on IRC about having backported this bug's patch to the 2_14_1-BRANCH, which was checked in today
*   Bug [143560](https://bugzilla.mozilla.org/show_bug.cgi?id=143560 "showdependencytree.cgi eats all available memory if there's a circular dependency") - showdependencytree.cgi eats all available memory if there's a circular dependency.
*   Bug [143486](https://bugzilla.mozilla.org/show_bug.cgi?id=143486 "enter_bug.cgi: Using ?format=simple doesn't work") - enter_bug.cgi: Using ?format=simple doesn't work.
*   Fix for bug [143547](https://bugzilla.mozilla.org/show_bug.cgi?id=143547 ""secure bugs" also grey in list (.bz_secure set) even if usebuggroups is on"): Don't show bugs as grey if usebuggroups parameter is set to true.
*   Fix for bug [78701](https://bugzilla.mozilla.org/show_bug.cgi?id=78701 "it's impossible to press OK button in the modal dialog"): missing . in INVALID description in queryhelp.cgi
*   Bug [143231](https://bugzilla.mozilla.org/show_bug.cgi?id=143231 "Changing a bug with an empty buglist gives a warning") - Changing a bug with an empty buglist gives a warning.
*   Fix for bug [135449](https://bugzilla.mozilla.org/show_bug.cgi?id=135449 "Allow preset queries to override the last sort order"): allows named queries to override the last sort order.
*   Bug [143251](https://bugzilla.mozilla.org/show_bug.cgi?id=143251 "RFE: checksetup.pl should report module version in error message") - RFE: checksetup.pl should report module version in error message.

## 2.14 Checkins Since the Last Status Update

The following is a list of specific bugs fixed (and their checkin messages) since the last Bugzilla status report. It is ordered by the checkin date, as ordered by Bonsai. It includes checkins on the **BUGZILLA-2_14_1-BRANCH** from **05/08/2002** to **07/30/2002**. This list was generated by filtering the output from Bonsai; if you're interested, you can run [run the query for yourself](http://bonsai.mozilla.org/cvsquery.cgi?treeid=default&module=Bugzilla&branch=BUGZILLA-2_14_1-BRANCH&branchtype=match&dir=&file=&filetype=match&who=&whotype=match&sortby=Date&hours=2&date=explicit&mindate=05%2F08%2F2002+17%3A00%3A00&maxdate=07%2F30%2F2002+00%3A00%3A00&cvsroot=%2Fcvsroot).

The following checkins were made without reference to any specific bugs:

*   05/25/2002 - HTML Quote reporter's name (Gerv)
*   05/25/2002 - Release Notes Updates (MattyT)
*   06/03/2002 - Release Notes Updates (MattyT)

**Da big list:**

*   Fix for bug [154008](https://bugzilla.mozilla.org/show_bug.cgi?id=154008 "Basic script maintenance: contrib email scripts (bug_email.pl & bugzilla_email_append.pl)"): some basic (but incomplete) maintenance on bug_email.pl, also fixes a possible security hole with a misuseof a system() call.
*   Bug [152138](https://bugzilla.mozilla.org/show_bug.cgi?id=152138 "2.14.2 breaks sorting on more than one field") - 2.14.2 breaks sorting on more than one field
*   Bug [130821](https://bugzilla.mozilla.org/show_bug.cgi?id=130821 "buglist: "order" parameter sends unchecked SQL"): Backported patch to further validate the order sql parameter.
*   Bug [148674](https://bugzilla.mozilla.org/show_bug.cgi?id=148674 "Boolean Charts don't work in Netpositive because '-' is sent as '%2D'") Boolean Charts don't work in Netpositive because '-' is sent as '%2DThis makes CGI.pl closer to CGI.pm by having it unescape the name field in addition to the value field.
*   Bug [93167](https://bugzilla.mozilla.org/show_bug.cgi?id=93167 "&GroupExists and &GroupIsActive should push and pop sql state") - &GroupExists and &GroupIsActive and &UserInGroup need to pushand pop sql state
*   Bug [147486](https://bugzilla.mozilla.org/show_bug.cgi?id=147486 "2.14.1/2.16 branches and trunk needs security audit against cross-site scripting bugs") - First (of many?) fixes of cross site scripting issues; checked in on the 2.14.1 branch; this patch is slightly different (semantically) from the one in [147486](https://bugzilla.mozilla.org/show_bug.cgi?id=147486); it moves the ) placement, per myk's suggestion in the bug.
*   Bug [107718](https://bugzilla.mozilla.org/show_bug.cgi?id=107718 "masschange gives all changed bugs the groupset of the first bug in the list"): backported patch for 2_14_1-BRANCH
*   Fix bug [146447](https://bugzilla.mozilla.org/show_bug.cgi?id=146447 "cross-site scripting bug with bugzilla user's name"), part
*   Backported patch for bug [92263](https://bugzilla.mozilla.org/show_bug.cgi?id=92263 "Don't output SQL commands before the footer."); patch applies cleanly to the 2_14_1-BRANCH
*   Bug [134575](https://bugzilla.mozilla.org/show_bug.cgi?id=134575 "defparams.pl::WriteParams makes data directory world writable"): Backported patch for the 2_14_1 BRANCH
*   Bugs [126801](https://bugzilla.mozilla.org/show_bug.cgi?id=126801 "queryhelp.cgi ignores group-permissions - showing ALL products"), [141557](https://bugzilla.mozilla.org/show_bug.cgi?id=141557): backported security patches for the 2.14.1

