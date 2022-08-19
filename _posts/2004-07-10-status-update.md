---
title: "Status Update"
date: 2004-07-10
author: ["zach"]
categories:
- Status
---

## Introduction and Updates

Welcome to the new Bugzilla status update, covering the four months since our [last update](/blog/2004/03/03/status-update) and the release of Bugzilla 2.17.7\. In this update, the Bugzilla Team is pleased to announce the release of Bugzilla 2.18, Release Candidate 1 (rc1), and Bugzilla 2.16.6, the latest maintenance release in the current stable series.

We are also pleased to announce the new [Bugzilla Website](https://www.bugzilla.org/), thanks to the efforts of Mike Morgan and the Bugzilla Team. The new site is designed to more closely match the look and feel of the mozilla.org website and is standards-compliant.

As usual, we'd like to remind all Bugzilla administrators that to assist them in keeping up-to-date with release announcements and security advisories, we provide an ultra-low-volume administrator mailing list (announce@bugzilla.org). We advise all Bugzilla administrators to [subscribe](https://lists.bugzilla.org/cgi-bin/mj_wwwusr?func=lists-full-long&extra=announce) so they can keep up with important Bugzilla announcements.

Those looking to get involved with Bugzilla development may want to consider joining the developers list (developers@bugzilla.org). This list offers discussion on new features and issues. Developers are invited to [subscribe](https://lists.bugzilla.org/cgi-bin/mj_wwwusr?user=&passw=&func=lists-long-full&extra=developers) to the list.

## New Releases

### 2.18rc1

This release is a developers' release and is not recommended for production use, but all existing users of the 2.17 development branch are strongly encouraged to upgrade to 2.18rc1, both for the increased stability and new features, and for the security updates described below. 2.18rc1 is the first Bugzilla release to support operation on Microsoft Windows servers with no modifications to Bugzilla itself.

### 2.16.5

All users of the 2.16 stable branch are encouraged to update their production installations to 2.16.6 for security reasons. More details on the security vulnerabilities fixed in this update are available in the [2.16.5 Security Advisory](/security/2.16.5). See the check-in manifest at the bottom of this status update for a list of changes.

They are also requested to test their installations with 2.18rc1 using a backup copy of their database, in order to help us make the best 2.18 final release. Since 2.16 was originally released, Bugzilla has come a long way. [This list](#majorfeaturessince216) shows many of the major new features that have been added to the 2.17 development branch. Those using 2.16 should take a look at this list for an indication of what will be new in 2.18.

The 2.16 branch will be retired with the release of Bugzilla 2.22, scheduled for approximately April 2005\. Administrators using the 2.16 branch are encouraged to investigate migration to the 2.18 stable branch when 2.18 is released.

### 2.14

We would like to remind all administrators running Bugzilla instances from the old 2.14 branch that this branch has been retired, and is no longer being supported actively by the team. We strongly recommend upgrading to a stable version (either 2.16.5, or 2.18 when it is released) to ensure security and proper operation, and for the new features provided by this branch.

<a name="newfeatures"></a>

## New Features Since the Last Status Update

Several new features are available for testing in our release candidate, 2.18rc1\. The following items describe the most important of these changes since the previous status update, and the manifest at the end of this document describe the full list of changes.

*   All remaining static HTML pages (with the exception of QuickSearch) have been converted to template files processed by page.cgi. This feature allows all pages in Bugzilla to be localized (bug [170213](https://bugzilla.mozilla.org/show_bug.cgi?id=170213)).
*   A preference panel for the management of saved searches was added to the User Preferences page (bug [232176](https://bugzilla.mozilla.org/show_bug.cgi?id=232176)).
*   Buglists can now be exported as calendars in the icalendar format (bug [235459](https://bugzilla.mozilla.org/show_bug.cgi?id=235459)).
*   The "noresolveonopenblockers" parameter was added to allow administrators to prevent a bug being closed when it has open dependencies (bug [24496](https://bugzilla.mozilla.org/show_bug.cgi?id=24496)).

<a name="majorfeaturessince216"></a>

## Major New Features Since 2.16

Users upgrading from 2.16 may be interested in a [list of major new features since the 2.16 release.](/releases/2.18rc1/)

## Date-Based Releases and More

**An update from Dave Miller, Bugzilla project leader on the new date-based release scheme:**

Well, today we're finally releasing our first release candidate for Bugzilla 2.18.

It's been a **long** time coming. It's been just shy of 2 years since Bugzilla 2.16 was released. This is a contributing factor to why this release is just now coming, even after our feature freeze on March 15th has now passed us by almost 4 months.

There are a **lot** of new features in 2.18\. Large substantial humungous chunks (am I repeating myself?) of Bugzilla code have been reorganized and rewritten since 2.16\. Bugzilla's underpinning now features substantial amounts of well-organized object-oriented Perl code. We're not there, yet, though. There's still a pretty good chunk of it (post_bug, process_bug, and the administrative utilities) that are still the old code that's had extra stuff hacked into it for years. :) And therein lies our challenge for the next few releases.

There are quite a number of new features that are almost ready to land on the trunk. Several of them have been put off for the last 4 months because they would violate our feature freeze to check them in. Those will start landing over the next few weeks, now that what will become 2.18 is living on a branch in CVS.

We announced a while back that the 2.18 Release would start us on a 6-month release cycle. Following that schedule, our feature freeze for 2.20 will be on September 15th, 2004\. Yes, that's only 2 months from now. I don't expect the freeze to last 4 months again like it did for 2.18\. For 2.18 we had 2 years worth of cleaning up to do. :) Since we only have 2 months of development time between now and the 2.20 freeze, it can't get that bad. So we should be able to expect to see Bugzilla 2.20 in final release form by mid-October.

Even with all of that going on, we're not done with 2.18 yet. Today's release is just a candidate. It will evolve with your help, as you test it and point out any regressions we need to fix. There will be a second release candidate in a week or two, after we knock off any major regressions anyone reports. The second candidate will also get a week or two of testing before being declared the final release.

We have a few flags on the bugs for dealing with this. If a bug you report is something that you think is important to have fixed in 2.18, set the "blocking2.18" flag to the question mark ("?") setting. This will send a message to me asking me to evaluate it. If I (or Myk) set it to "+", that means we've agreed, and attempts will be made to get it fixed on the 2.18 branch so it can be included in the final 2.18 release. Similarly, once a patch is ready to go, it must get a "+" on the "approval2.18" flag (set by Myk or myself) before it can be checked in on the branch. Please do request that if you have something blocking 2.18 after you get it reviewed.

Before I sign off here, I want to take a moment to profusely thank Mike Morgan for the work he's done on our website over the last couple months. This is a really wonderful [new website](https://www.bugzilla.org) he cooked up for us! :) If you have any feedback on the new site design, or find any dead links that need to be fixed, please post on the mozilla-webtools mailing list. (See the [support page](/support/) to find out where to subscribe).

## Upcoming Features

This section lists major new features that are either in progress or have some amount of work toward them completed already, but have not yet landed in CVS. If you would like to help out -- many of these features need either planning, coding, or testing -- or just figure what the current status is on one of these items, check out the parenthesized bug links.

*   Ability to send email via SMTP instead of relying on a local installation of sendmail. (Bug [84876](https://bugzilla.mozilla.org/show_bug.cgi?id=84876))
*   PostgreSQL support. (Bug [98304](https://bugzilla.mozilla.org/show_bug.cgi?id=98304 "Allow Bugzilla to work with Postgres SQL
    (PgSQL)"))
*   Oracle support. (Bug [189947](https://bugzilla.mozilla.org/show_bug.cgi?id=189947))
*   Ability to add generic customized fields to bugs. (Bug [91037](https://bugzilla.mozilla.org/show_bug.cgi?id=91037 "a generic implementation for custom fields"))
*   Customized resolutions, that allow adding, removing, deactivating and renaming of resolutions. (Bug [94534](https://bugzilla.mozilla.org/show_bug.cgi?id=94534 "Customised resolutions."))
*   Expanding e-mail preferences to allow watching components, keywords, etc. (Bug [73665](https://bugzilla.mozilla.org/show_bug.cgi?id=73665 "Need an "emailprefs" table"))
*   `mod_perl` support. (Bug [87406](https://bugzilla.mozilla.org/show_bug.cgi?id=87406 "Make Bugzilla work with mod_perl (under
    Apache)"))
*   New makefile-based installation system. ([Bug 104660](https://bugzilla.mozilla.org/show_bug.cgi?id=104660), [Bug 105854](https://bugzilla.mozilla.org/show_bug.cgi?id=105854), [Bug 105855](https://bugzilla.mozilla.org/show_bug.cgi?id=105855), and [Bug 105856](https://bugzilla.mozilla.org/show_bug.cgi?id=105856))
*   Wiki integration. (Bug [102685](https://bugzilla.mozilla.org/show_bug.cgi?id=102685))

## Trunk Checkins Since the Last Status Update

The following is a list of specific bugs fixed (and their checkin messages) since the last Bugzilla status report. It is ordered by the checkin date as rendered by [Bonsai](http://bonsai.mozilla.org/). It includes checkins on the trunk from 2004/03/03 to 2004/07/8\. This list was generated by filtering Bonsai's output on [that query](http://bonsai.mozilla.org/cvsquery.cgi?treeid=default&module=Bugzilla&branch=HEAD&branchtype=match&dir=&file=&filetype=match&who=&whotype=match&sortby=Date&hours=2&date=explicit&mindate=2004-03-04&maxdate=2004-07-10&cvsroot=/cvsroot).

Checkins that don't refer to a specific bug number have been omitted, and were a small minority. Bold bugs are security bugs.

**Checkin manifest:**

*   Bug [236296](https://bugzilla.mozilla.org/show_bug.cgi?id=236296) - Fix Build Identifier on guided entry form
*   Bug [236567](https://bugzilla.mozilla.org/show_bug.cgi?id=236567) - Update the documentation describing the Perl modules installation on Windows using ppm
*   Bug [236019](https://bugzilla.mozilla.org/show_bug.cgi?id=236019) - Make request.cgi use $cgi->param instead of %::FORM
*   Bug [236443](https://bugzilla.mozilla.org/show_bug.cgi?id=236443) - Respect customization of customized words in create.html.tmpl
*   Bug [234879](https://bugzilla.mozilla.org/show_bug.cgi?id=234879) - Remove %FORM from editkeywords.cgi
*   Bug [234875](https://bugzilla.mozilla.org/show_bug.cgi?id=234875) - Use ->param in quips.cgi
*   Bug [220814](https://bugzilla.mozilla.org/show_bug.cgi?id=220814) - Add to FAQ: How to upgrade Bugzilla from CVS
*   Bug [236634](https://bugzilla.mozilla.org/show_bug.cgi?id=236634) - Move colon out of anchor text in "Target Milestone:" in show_bug
*   Bug [235278](https://bugzilla.mozilla.org/show_bug.cgi?id=235278) - Eliminate %::FORM from userprefs.cgi
*   Bug [236652](https://bugzilla.mozilla.org/show_bug.cgi?id=236652) - Fix libgdi typo in section 2.4.2 of the docs
*   Bug [232141](https://bugzilla.mozilla.org/show_bug.cgi?id=232141) - All all saved searches to footer until linkinfooter UI returns
*   Bug [170213](https://bugzilla.mozilla.org/show_bug.cgi?id=170213) - Make static HTML files into page.cgi pages. This does votehelp.html (-> id=voting.html), bug_status.html (-> id=fields.html) and bugwritinghelp.html (-> id=bug-writing.html)
*   Bug [232176](https://bugzilla.mozilla.org/show_bug.cgi?id=232176) - Add a preferences panel for saved searches, to allow management all in one place
*   Bug [143490](https://bugzilla.mozilla.org/show_bug.cgi?id=143490) - Eliminate unsupported calls from checksetup.pl when running in Windows
*   Bug [236322](https://bugzilla.mozilla.org/show_bug.cgi?id=236322) - Trivial inaccuracy in description of "find a specific bug" search corrected (the search doesn't really search summaries, so I've removed the text that says it does).
*   Bug [178162](https://bugzilla.mozilla.org/show_bug.cgi?id=178162) - Move the vote checkbox to the left
*   Bug [236664](https://bugzilla.mozilla.org/show_bug.cgi?id=236664) - Make checksetup.pl print good install instructions for Perl modules on win32
*   Bug [232491](https://bugzilla.mozilla.org/show_bug.cgi?id=232491) - Try harder to avoid parameterless searches (either saved or otherwise)
*   Bug [237540](https://bugzilla.mozilla.org/show_bug.cgi?id=237540) - Remove unused hidden field from edit-multiple
*   Bug [235459](https://bugzilla.mozilla.org/show_bug.cgi?id=235459) - Add icalendar output format in buglist
*   Bug [237646](https://bugzilla.mozilla.org/show_bug.cgi?id=237646) - Fix for regression in userprefs.cgi that disallowed users to change their password via this page
*   Bug [236424](https://bugzilla.mozilla.org/show_bug.cgi?id=236424) - Allow showdependencies trees to collapse. Adds [optional] Javascript-enabled +/- controls that allow branches in the dependency tree to collapse.
*   Bug [232397](https://bugzilla.mozilla.org/show_bug.cgi?id=232397) - .bz_obsolete shouldn't specify "underline". Define specific bz_obsolete/closed/inactive classes (that don't specify underline, but line-through instead) and additional Template filters for conveniently applying them
*   Bug [237757](https://bugzilla.mozilla.org/show_bug.cgi?id=237757) - Resolved bugs are no longer struck out on dependency trees. Includes a global CSS file that defines the relevant bz_* classes and adds a link to it from the global header template
*   Bug [192516](https://bugzilla.mozilla.org/show_bug.cgi?id=192516) - Moving the loose .pm files into the Bugzilla directory, where they belong. These files pre-date the Bugzilla directory, and would have gone there had it existed at the time. The four files in question were copied on the CVS server to preserve CVS history in the files.
*   Bug [24496](https://bugzilla.mozilla.org/show_bug.cgi?id=24496) - Adds a parameter "noresolveonopenblockers" which when enabled, prevents bugs from being closed if there are any bugs blocking it which are still open.
*   Bug [132066](https://bugzilla.mozilla.org/show_bug.cgi?id=132066) - Add a note to the login page about needing cookies for a good user experience
*   Bug [237864](https://bugzilla.mozilla.org/show_bug.cgi?id=237864) - Clean up leftover issues from the bug [192516](https://bugzilla.mozilla.org/show_bug.cgi?id=192516) checkin (some occurances of Token got missed)
*   Bug [203869](https://bugzilla.mozilla.org/show_bug.cgi?id=203869) - Update documentation to better describe group controls
*   Bug [237513](https://bugzilla.mozilla.org/show_bug.cgi?id=237513) - Change password uses semi empty field
*   Bug [237514](https://bugzilla.mozilla.org/show_bug.cgi?id=237514) - Confirmed email address is missing
*   Bug [237517](https://bugzilla.mozilla.org/show_bug.cgi?id=237517) - Inconsistent spelling of cancelled or canceled
*   Bug [237772](https://bugzilla.mozilla.org/show_bug.cgi?id=237772) - Instances of "a terms.bug" should be replaced with "terms.abug" also fix the spelling of decipher
*   Bug [234293](https://bugzilla.mozilla.org/show_bug.cgi?id=234293) - Complete the conversion from "query" terminology to "search" terminology
*   Bug [238025](https://bugzilla.mozilla.org/show_bug.cgi?id=238025) - Generate HTML table header in editkeywords.cgi even when there are no keywords defined
*   Bug [179351](https://bugzilla.mozilla.org/show_bug.cgi?id=179351) - Improve variable scoping issues in order to fix a bug causing oddly formatted dependency emails
*   Bug [228423](https://bugzilla.mozilla.org/show_bug.cgi?id=228423) - Document adjustment of MySQL 4GB default table size limit
*   Bug [232338](https://bugzilla.mozilla.org/show_bug.cgi?id=232338) - Make the footer wrap cleanly, so it doesn't over-widen the page
*   Bug [238033](https://bugzilla.mozilla.org/show_bug.cgi?id=238033) - Eliminate HTML closing tags that haven't been opened and fix an indentation issue
*   Bug [126252](https://bugzilla.mozilla.org/show_bug.cgi?id=126252) - Add the gnatsparse Python script to the contrib directory
*   Bug [207039](https://bugzilla.mozilla.org/show_bug.cgi?id=207039) - Add documentation explaining how to install bugzilla under regular user privileges
*   Bug [233246](https://bugzilla.mozilla.org/show_bug.cgi?id=233246) - Improve documentation on enter_bug comment formatting templates.
*   Bug [224420](https://bugzilla.mozilla.org/show_bug.cgi?id=224420) - Documentation for new reporting and charting systems.
*   Bug [237515](https://bugzilla.mozilla.org/show_bug.cgi?id=237515) - Change 'also' to 'too' in the watching help page
*   Bug [237840](https://bugzilla.mozilla.org/show_bug.cgi?id=237840) - Eliminate case sensitivity for "attachment N" linkification
*   Bug [238282](https://bugzilla.mozilla.org/show_bug.cgi?id=238282) - An incorrect bugword
*   Bug [236650](https://bugzilla.mozilla.org/show_bug.cgi?id=236650) - Clarify choice of install directory in docs
*   Bug [238396](https://bugzilla.mozilla.org/show_bug.cgi?id=238396) - Update the README file for the gnatsparse project
*   Bug [238506](https://bugzilla.mozilla.org/show_bug.cgi?id=238506) - Fix checksetup.pl so that it does not fail if an upgrading site never changed a groupset
*   Bug [218206](https://bugzilla.mozilla.org/show_bug.cgi?id=218206) - Document ft_min_word_len MySQL param for indexing small words in full-text indexes and fix several typos in documentation
*   Bug [127862](https://bugzilla.mozilla.org/show_bug.cgi?id=127862) - Have sanitycheck.cgi use perl to evaluate email regexp
*   Bug [238669](https://bugzilla.mozilla.org/show_bug.cgi?id=238669) - Add a space between 'entered' and '(' in illegal_email_address error
*   Bug [238656](https://bugzilla.mozilla.org/show_bug.cgi?id=238656) - Reword the "Account self-creation" error message
*   Bug [238673](https://bugzilla.mozilla.org/show_bug.cgi?id=238673) - Add missing article in change email address page
*   Bug [238677](https://bugzilla.mozilla.org/show_bug.cgi?id=238677) - Fix wording of the "require_new_password" message
*   Bug [238683](https://bugzilla.mozilla.org/show_bug.cgi?id=238683) - Fix for usage of uninitialized value in concatenation in Bugzilla/CGI.pm
*   Bug [238693](https://bugzilla.mozilla.org/show_bug.cgi?id=238693) - Replace depreciated v-strings with calls to the pack() function
*   Bug [177224](https://bugzilla.mozilla.org/show_bug.cgi?id=177224) - Update installation docs to note XUL and RDF MIME types
*   Bug [181589](https://bugzilla.mozilla.org/show_bug.cgi?id=181589) - Add mass-remove to editgroups
*   Bug [232097](https://bugzilla.mozilla.org/show_bug.cgi?id=232097) - Use an entity reference for the landfill base URL in the demos, to make it easy to change each release.
*   Bug [237369](https://bugzilla.mozilla.org/show_bug.cgi?id=237369) - Implement relatively simple changes from %FORM to $cgi->param variable
*   Bug [226764](https://bugzilla.mozilla.org/show_bug.cgi?id=226764) - Move InvalidateLogins into Bugzilla::Auth::CGI. Consolidates the logout code into Bugzilla::Auth::CGI, and provides simple front-end wrappers in Bugzilla.pm for use in the CGIs we have. Adds a set of constants to the logout() API which allow specifying "how much" we should log out -- all sessions, the current session, or all sessions but the current one. Fixes callsites to use this new API; cleans and documents things a bit while we're at it. Part I in the great COOKIE apocalypse.
*   Bug [226754](https://bugzilla.mozilla.org/show_bug.cgi?id=226754) - Move InvalidateLogins into Bugzilla::Auth::CGI. Consolidates the logout code into Bugzilla::Auth::CGI, and provides simple front-end wrappers in Bugzilla.pm for use in the CGIs we have. Adds a set of constants to the logout() API which allow specifying "how much" we should log out -- all sessions, the current session, or all sessions but the current one. Fixes callsites to use this new API; cleans and documents things a bit while we're at it. Part I in the great COOKIE apocalypse.
*   Bug [234175](https://bugzilla.mozilla.org/show_bug.cgi?id=234175) - Remove deprecated ConnectToDatabase() and quietly_check_login()/confirm_login() calls. Cleans up callsites (consisting of most of our CGIs), swapping (where appropriate) for calls to Bugzilla->login
*   Bug [235265](https://bugzilla.mozilla.org/show_bug.cgi?id=235265) - Getting rid of some unwanted form value dumps.
*   Bug [233962](https://bugzilla.mozilla.org/show_bug.cgi?id=233962) - UserInGroup() should not accept a second parameter any longer
*   Bug [238860](https://bugzilla.mozilla.org/show_bug.cgi?id=238860) - Remove %FORM from editversions.cgi
*   Bug [237778](https://bugzilla.mozilla.org/show_bug.cgi?id=237778) - Update filter list in t/004template
*   Bug [238867](https://bugzilla.mozilla.org/show_bug.cgi?id=238867) - Remove one last %FORM from quips.cgi
*   Bug [238650](https://bugzilla.mozilla.org/show_bug.cgi?id=238650) - Reword duplicate of self error message
*   Bug [237508](https://bugzilla.mozilla.org/show_bug.cgi?id=237508) - Have checksetup.pl specify which perl to use (the same one it's running under) when giving instructions how to use CPAN to install needed modules.
*   Bug [189156](https://bugzilla.mozilla.org/show_bug.cgi?id=189156) - Explain quip moderation in documentation.
*   Bug [146087](https://bugzilla.mozilla.org/show_bug.cgi?id=146087) - Set the default of the sendmailnow param to ON on the trunk as well
*   Bug [236926](https://bugzilla.mozilla.org/show_bug.cgi?id=236926) - Supply a missing a $cgi-header in buglist.cgi
*   Bug [232554](https://bugzilla.mozilla.org/show_bug.cgi?id=232554) - Fix SQL queries in Flag.pm in order to fix a bug that causes flags to remain set but inaccessible when product changes.
*   Bug [220817](https://bugzilla.mozilla.org/show_bug.cgi?id=220817) - Add to FAQ documentation for 'Why do I have to log in every time I access a page?'.
*   Bug [238874](https://bugzilla.mozilla.org/show_bug.cgi?id=238874) - Remove %FORM and %COOKIE from colchange.cgi. Does precisely that, swapping them for references to cgi->param/cookie.
*   Bug [233295](https://bugzilla.mozilla.org/show_bug.cgi?id=233295) - Document terminology customization feature
*   Bug [238352](https://bugzilla.mozilla.org/show_bug.cgi?id=238352) - Remove alphabetical sorting from some fields in reports (e.g. priority) and keep them in a sensible order instead
*   Bug [239346](https://bugzilla.mozilla.org/show_bug.cgi?id=239346) - Add hook at end of comments
*   Bug [239255](https://bugzilla.mozilla.org/show_bug.cgi?id=239255) - Update docs in order to specify that $webservergroup is the group of the webserver, not the user
*   Bug [14887](https://bugzilla.mozilla.org/show_bug.cgi?id=14887) - Put <label> tags in forms
*   Bug [239576](https://bugzilla.mozilla.org/show_bug.cgi?id=239576) - Make sure detaint_natural is always called with a defined value in editkeywords.cgi
*   Bug [230293](https://bugzilla.mozilla.org/show_bug.cgi?id=230293) - Send CSV buglists with "Content-Disposition: attachment"
*   Bug [237176](https://bugzilla.mozilla.org/show_bug.cgi?id=237176) - Allows power users to display relevance values as a column in the search results for a fulltext search
*   Bug [238862](https://bugzilla.mozilla.org/show_bug.cgi?id=238862) - Remove %FORM and %COOKIE from enter_bug.cgi
*   Bug [238864](https://bugzilla.mozilla.org/show_bug.cgi?id=238864) - Remove %FORM and %COOKIE from move.pl
*   Bug [192775](https://bugzilla.mozilla.org/show_bug.cgi?id=192775) - Rearrange parameter order in token URLs to make them always fully linked in some MUAs
*   Bug [233245](https://bugzilla.mozilla.org/show_bug.cgi?id=233245) - Update documentation of formats to include ctypes as well
*   Bug [239885](https://bugzilla.mozilla.org/show_bug.cgi?id=239885) - Don't display the sendmail message if the current platform is Windows
*   Bug [239912](https://bugzilla.mozilla.org/show_bug.cgi?id=239912) - Make bug_email.pl work with useqacontact
*   Bug [239826](https://bugzilla.mozilla.org/show_bug.cgi?id=239826) - Support closing resolved bugs when changing multiple bugs
*   Bug [224698](https://bugzilla.mozilla.org/show_bug.cgi?id=224698) - Remove localconfig variable mysqlpath
*   Bug [87770](https://bugzilla.mozilla.org/show_bug.cgi?id=87770) - Make attachment.cgi work with no parameters
*   Bug [240228](https://bugzilla.mozilla.org/show_bug.cgi?id=240228) - Improve the format of the error message displayed by checksetup.pl when the MySQL requirements are not satisfied
*   Bug [238865](https://bugzilla.mozilla.org/show_bug.cgi?id=238865) - Remove %FORM from page.cgi. Does so, fixing the linked page template and adding a code error for the "bad id provided" case
*   Bug [194332](https://bugzilla.mozilla.org/show_bug.cgi?id=194332) - Fix spelling that caused error message mismatch for the "invalid_maxrows" error message
*   Bug [233245](https://bugzilla.mozilla.org/show_bug.cgi?id=233245) - Replace "variable" with "constant" since there is no contenttypes variable in Constants.pm.
*   Bug [240219](https://bugzilla.mozilla.org/show_bug.cgi?id=240219) - Display valid PPM commands when using PPM version 2
*   Bug [240060](https://bugzilla.mozilla.org/show_bug.cgi?id=240060) - Stop yelling at people about the minimum sendmail version
*   Bug [224477](https://bugzilla.mozilla.org/show_bug.cgi?id=224477) - Make webservergroup default to apache on new installs
*   Bug [238869](https://bugzilla.mozilla.org/show_bug.cgi?id=238869) - Remove %FORM from votes.cgi.
*   Bug [240439](https://bugzilla.mozilla.org/show_bug.cgi?id=240439) - "Edit user again" link didn't work if the user had a + in their email address
*   Bug [240434](https://bugzilla.mozilla.org/show_bug.cgi?id=240434) - Replace increased with improved on the login page
*   Bug [237638](https://bugzilla.mozilla.org/show_bug.cgi?id=237638) - Make bugzilla_email_append.pl work with BugMail.pm instead of processmail
*   Bug [192571](https://bugzilla.mozilla.org/show_bug.cgi?id=192571) - Empty default owner (assignee or QA) causes "Reassign bug to owner and QA contact of selected component to NOOP
*   Bug [240004](https://bugzilla.mozilla.org/show_bug.cgi?id=240004) - Limit the password generation subroutine to nice characters only
*   Bug [241516](https://bugzilla.mozilla.org/show_bug.cgi?id=241516) - Remove possible namespace conflicts in the additional CSS classes for bugid, component, and status on show_bug
*   Bug [234540](https://bugzilla.mozilla.org/show_bug.cgi?id=234540) - "Take bug" on create attachment screen missed an API change to BugMail which caused it not to mail the previous bug owner about the change.
*   Bug [237838](https://bugzilla.mozilla.org/show_bug.cgi?id=237838) - Make sure CheckCanChangeField() always gets correct resolution
*   Bug [241259](https://bugzilla.mozilla.org/show_bug.cgi?id=241259) - Add a CSS tag for 'Additional Comments'
*   Bug [242740](https://bugzilla.mozilla.org/show_bug.cgi?id=242740) - URL to Bug Writing Help document changed
*   Bug [204042](https://bugzilla.mozilla.org/show_bug.cgi?id=204042) - Taint issues in perl 5.6.0 that were causing an Internal Error to ocurr after adding an attachment.
*   Bug [240486](https://bugzilla.mozilla.org/show_bug.cgi?id=240486) - Makes the banner template CSS friendly
*   Bug [231975](https://bugzilla.mozilla.org/show_bug.cgi?id=231975) - Avoid naming new product groups the same as existing groups and do not rename product groups on product rename.
*   Bug [240036](https://bugzilla.mozilla.org/show_bug.cgi?id=240036) - Unlock tables after address error before attempting to process footer
*   Bug [227785](https://bugzilla.mozilla.org/show_bug.cgi?id=227785) - Add navigation/summary/last-modified after modifying a bug
*   Bug [232861](https://bugzilla.mozilla.org/show_bug.cgi?id=232861) - Prevent references to bugs or comments from being expanded in attachment links
*   Bug [226477](https://bugzilla.mozilla.org/show_bug.cgi?id=226477) - Fix undefined method call in Bugzilla::User->in_group
*   Bug [226411](https://bugzilla.mozilla.org/show_bug.cgi?id=226411) - Make DiffStrings handle fields with duplicate values
*   Bug [238675](https://bugzilla.mozilla.org/show_bug.cgi?id=238675) - Improved wording for the reassign-to-entry error message
*   Bug [239263](https://bugzilla.mozilla.org/show_bug.cgi?id=239263) - User.pm should always use the main database to avoid a potential error
*   Bug [244053](https://bugzilla.mozilla.org/show_bug.cgi?id=244053) - Improve grammar in checksetup.pl
*   Bug [244045](https://bugzilla.mozilla.org/show_bug.cgi?id=244045) - --no-silent option for checksetup.pl
*   Bug [217627](https://bugzilla.mozilla.org/show_bug.cgi?id=217627) - Fixes error that occured with bug aliases starting with zero
*   Bug [208847](https://bugzilla.mozilla.org/show_bug.cgi?id=208847) - Fixes taint errors in editgroups.cgi
*   Bug [141006](https://bugzilla.mozilla.org/show_bug.cgi?id=141006) - Runs all edit* cgi scripts in taint mode
*   Bug [244650](https://bugzilla.mozilla.org/show_bug.cgi?id=244650) - Fix searches on commentatators when searching for other email addresses
*   Bug [227172](https://bugzilla.mozilla.org/show_bug.cgi?id=227172) - Fixes a potential race codition when users change their email address
*   Bug [243351](https://bugzilla.mozilla.org/show_bug.cgi?id=243351) - Prevents an issue of MySQL version sensitivity in case sensitive searches
*   Bug [183753](https://bugzilla.mozilla.org/show_bug.cgi?id=183753) - Make collectstats.cgi work on Win32
*   Bug [179671](https://bugzilla.mozilla.org/show_bug.cgi?id=179671) - Fix boolean charts
*   Bug [223541](https://bugzilla.mozilla.org/show_bug.cgi?id=223541) - Make flags appear correctly in "view all attachments" mode
*   Bug [240079](https://bugzilla.mozilla.org/show_bug.cgi?id=240079) - Improved wording in README file
*   Bug [242161](https://bugzilla.mozilla.org/show_bug.cgi?id=242161) - Adds a patchviewer("diff") link to process_bug.cgi
*   Bug [240252](https://bugzilla.mozilla.org/show_bug.cgi?id=240252) - Improved wording in editproducts.cgi
*   Bug [245976](https://bugzilla.mozilla.org/show_bug.cgi?id=245976) - Fixes an error that occured when trying to add a milestone
*   Bug [240325](https://bugzilla.mozilla.org/show_bug.cgi?id=240325) - Update regexp-based groups
*   Bug [160210](https://bugzilla.mozilla.org/show_bug.cgi?id=160210) - Fixes Mac OS X detection and adds 10.1 and 10.2 to the OS list
*   Bug [246599](https://bugzilla.mozilla.org/show_bug.cgi?id=246599) - Adds Mac OS 10.3 (Panther) to the OS list
*   Bug [142744](https://bugzilla.mozilla.org/show_bug.cgi?id=142744) - Makes the test suite work on Win32
*   Bug [246328](https://bugzilla.mozilla.org/show_bug.cgi?id=246328) - Make editmilestone.cgi check for invalid sortkeys
*   Bug [246778](https://bugzilla.mozilla.org/show_bug.cgi?id=246778) - Fixes an error that occured with ThrowUserError and timetracking
*   Bug [247209](https://bugzilla.mozilla.org/show_bug.cgi?id=247209) - Improves OS detection for Solaris
*   Bug [247192](https://bugzilla.mozilla.org/show_bug.cgi?id=247192) - Improves OS detection for StarOffice on Solaris SPARC
*   Bug [225359](https://bugzilla.mozilla.org/show_bug.cgi?id=225359) - Allows dependency graphs to work on Win32
*   Bug [245924](https://bugzilla.mozilla.org/show_bug.cgi?id=245924) - Uses HTML 4 and CSS formatting for the Bugzilla footer
*   Bug [248685](https://bugzilla.mozilla.org/show_bug.cgi?id=248685) - Fixes the lack of terms in the header of showdependencytree.cgi
*   Bug [248001](https://bugzilla.mozilla.org/show_bug.cgi?id=248001) - Converts boolean conditions in SQL statements to improve database independence
*   Bug [245101](https://bugzilla.mozilla.org/show_bug.cgi?id=245101) - Fixes warnings that occured from upgrades from 2.14.x without going through a 2.16.x version
*   Bug [239343](https://bugzilla.mozilla.org/show_bug.cgi?id=239343) - Adds the sendbugmail.pl script to contrib/ for external scripts that need processmail's functionality
*   Bug [243463](https://bugzilla.mozilla.org/show_bug.cgi?id=243463) - Use a param to prevent charts from leaking secure information
*   Bug [223878](https://bugzilla.mozilla.org/show_bug.cgi?id=223878) - Avoids problems that occur when changing a deleted flag
*   Bug [249802](https://bugzilla.mozilla.org/show_bug.cgi?id=249802) - Document granting of permissions to a MySQL user for MySQL 4
*   Bug [245077](https://bugzilla.mozilla.org/show_bug.cgi?id=245077) - The "find a specific bug" tab is now the default when loading query.cgi, the script will remember the previously selected tab and display it when query.cgi is loaded again.
*   Bug [248988](https://bugzilla.mozilla.org/show_bug.cgi?id=248988) - Prevents a possible error with attachments on Win32
*   Bug [249863](https://bugzilla.mozilla.org/show_bug.cgi?id=249863) - Fix invalid HTML in create.html.tmpl
*   Bug [190432](https://bugzilla.mozilla.org/show_bug.cgi?id=190432) - Avoids using non-ANSI SQL when saving a named query
*   Bug [250265](https://bugzilla.mozilla.org/show_bug.cgi?id=250265) - Fix taint errors with vote fields when editing products
*   **Bug [227191](https://bugzilla.mozilla.org/show_bug.cgi?id=227191) - Prevents the database password from being disclosed when the SQL server is halted and the webserver is left running in 2.17.x releases.**
*   **Bug [233486](https://bugzilla.mozilla.org/show_bug.cgi?id=233486) - Fixes a privilege escalation in 2.17.x releases where auser with privileges to grant membership to one or more individual groups (i.e. usually an administrator) can trick the administrative controls into granting membership in groups other than the ones he has privileges for.**
*   **Bug [234825](https://bugzilla.mozilla.org/show_bug.cgi?id=234825) - Prevents an information leak in all versions of Bugzilla where duplicates.cgi can disclose the names of products to which the user does not have access.**
*   **Bug [234855](https://bugzilla.mozilla.org/show_bug.cgi?id=234855) - Prevents an information leak in all versions of Bugzilla where the form for mass-editing bugs can list products to which the user does not have access.**
*   **Bug [235265](https://bugzilla.mozilla.org/show_bug.cgi?id=235265) - Prevents a Cross-Site Scripting vulnerability in several administrative scripts.**
*   **Bug [235510](https://bugzilla.mozilla.org/show_bug.cgi?id=235510) - Avoids a potential user password comprimise in versions 2.17.5 through 2.17.7 where the user password could be visible in web server logs when accessing a chart.**
*   **Bug [244272](https://bugzilla.mozilla.org/show_bug.cgi?id=244272) - Fixes an issue where a user with permission to grant membership to any group (i.e. usually an administrator) could cause editusers.cgi to execute arbitrary SQL.**

## Stable (2.16) Branch Checkins Since the Last Status Update

The following is a list of specific bugs fixed (and their checkin messages) since the last Bugzilla status report. It is ordered by the checkin date as rendered by [Bonsai](http://bonsai.mozilla.org/). It includes checkins on the branch from 2004/03/03 to 2004/07/08\. This list was written from Bonsai's output on [that query](http://bonsai.mozilla.org/cvsquery.cgi?treeid=default&module=Bugzilla&branch=BUGZILLA-2_16-BRANCH&branchtype=match&dir=&file=&filetype=match&who=&whotype=match&sortby=Date&hours=2&date=explicit&mindate=2004-11-03%2B00:00&maxdate=2004-03-03%2B23:59&cvsroot=/cv).

Bold bugs are security bugs.

Checkin manifest:

*   Bug [236567](https://bugzilla.mozilla.org/show_bug.cgi?id=236567) - Update the documentation for installing perl modules with PPM
*   Bug [220814](https://bugzilla.mozilla.org/show_bug.cgi?id=220814) - Update the FAQ to explain how to update Bugzilla from CVS
*   Bug [207039](https://bugzilla.mozilla.org/show_bug.cgi?id=207039) - Improve documentation on installing Bugzilla with regular user privlieges
*   Bug [237591](https://bugzilla.mozilla.org/show_bug.cgi?id=237591) - Allows XML import to function when there are regexp metacharacters in product names
*   Bug [220817](https://bugzilla.mozilla.org/show_bug.cgi?id=220817) - Update the FAQ to include information on why Bugzilla may request a username and password every time a page is accessed
*   Bug [238628](https://bugzilla.mozilla.org/show_bug.cgi?id=238628) - Adjust the database schema chart to fit on an 8.5X11 inch page
*   Bug [239912](https://bugzilla.mozilla.org/show_bug.cgi?id=239912) - Allows the bug_email.pl contrib script to work with useqacontact
*   Bug [240228](https://bugzilla.mozilla.org/show_bug.cgi?id=240228) - Improves the error message used by checksetup.pl when the MySQL requirements are not met
*   Bug [240060](https://bugzilla.mozilla.org/show_bug.cgi?id=240060) - Elimnates a warning in checksetup.pl about the minimum sendmail version
*   Bug [224477](https://bugzilla.mozilla.org/show_bug.cgi?id=224477) - Makes webservergroup default to group 'apache' in new installations
*   Bug [117297](https://bugzilla.mozilla.org/show_bug.cgi?id=117297) - Fixes an error where a bugmail message could be sent twice to a user on the CC list
*   Bug [240079](https://bugzilla.mozilla.org/show_bug.cgi?id=240079) - Improves the wording in the README
*   Bug [249802](https://bugzilla.mozilla.org/show_bug.cgi?id=249802) - Document how to create a MySQL user with permissions using MySQL 4
*   **Bug [234825](https://bugzilla.mozilla.org/show_bug.cgi?id=234825) - Prevents an information leak in all versions of Bugzilla where duplicates.cgi can disclose the names of products to which the user does not have access.**
*   **Bug [234855](https://bugzilla.mozilla.org/show_bug.cgi?id=234855) - Prevents an information leak in all versions of Bugzilla where the form for mass-editing bugs can list products to which the user does not have access.**
*   **Bug [235265](https://bugzilla.mozilla.org/show_bug.cgi?id=235265) - Prevents a Cross-Site Scripting vulnerability in several administrative scripts.**
*   **Bug [244272](https://bugzilla.mozilla.org/show_bug.cgi?id=244272) - Fixes an issue where a user with permission to grant membership to any group (i.e. usually an administrator) could cause editusers.cgi to execute arbitrary SQL.**

## Conclusion and Credits

Thank you very much to everyone who has helped to bring us so much closer to the 2.18 release. A special thank you to those who helped to edit this status update and those who have assisted in other parts of the the release process. Lastly and as always, a big thank you to Bugzilla's users and testers for their feedback.
