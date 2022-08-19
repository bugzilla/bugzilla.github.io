---
title: "Bugzilla Status Update"
date: 2001-10-19
author: ["codemachine"]
categories:
- Status
---

## Introduction

This is the first in a (hopefully) regular series of status updates about the progress of Bugzilla development. The aim is to let people know about upcoming versions of Bugzilla, so they can better prepare for new features, as well as to raise any concerns about them before they leave CVS and become a stable tarball.

## Highly Misleading & Meaningless Statistics

|Date|2.16 Bugs With Patches Waiting For Review|2.16 Bugs Waiting For Patches|2.18 Bugs|Other Bugs|
|--- |--- |--- |--- |--- |
|2001-10-19|112 bugs|329 bugs|36 bugs|299 bugs|

## The 2.14 Release

The 2.14 release went relatively smoothly, after some last minute bu ... err hitches were encountered on [bugzilla.mozilla.org](https://bugzilla.mozilla.org/). This site, for those that don't know, was the original installation of Bugzilla and is the "shakedown" site for the CVS code when there are no known non-documentation release blockers.

Inevitably release blockers are found when this occurs, and there were blockers for 2.14 just as there were for 2.12\. However, the actual release process went relatively smoothly this time around. The process includes updating web pages, preparing release announcements/security advisories, checking in the final documentation, including double checking the release notes, checking out and preparing a tarball, and so on. Generally this process occurs over the space of one frantic day.

## 2.14+

The first order of business after 2.14 was to introduce some of the features into CVS that were needed on bugzilla.mozilla.org, but weren't considered necessary for the 2.14 release because their benefit/risk ratio was not high enough. Remembering that bugzilla.mozilla.org is the bug system that is used for tracking bugs in Bugzilla (as well as Mozilla), we obviously are acutely aware of these issues. These features were checked in and bugzilla.mozilla.org updated to CVS. This point was nicknamed "2.14+".

The major part of this was the new "attachment manager". This allows you to edit the attributes of attachments. This includes MIME types, is-patch status, the new is-obsolete status, as well as a feature that allows you to add your own "attachment statuses" to attachments.  These can be thought of as to attachments what keywords are to bugs. Examples include "first-review", "needs-work", etc.

The checkin of the attachment manager was followed by a flurry of reporting of minor bugs and desired features to be added. These include bugs [97729](https://bugzilla.mozilla.org/show_bug.cgi?id=97729 "Bug 97729 - Uploaders need to be able to obsolete their own attachments"), [97733](https://bugzilla.mozilla.org/show_bug.cgi?id=97733 "Bug 97733 - Renaming/deleting attachment status should write to activity."), [97739](https://bugzilla.mozilla.org/show_bug.cgi?id=97739 "Bug 97739 - Deleting attachment statuses should give confirmation even when JS off."), [97764](https://bugzilla.mozilla.org/show_bug.cgi?id=97764 "Bug 97764 - Received bugmail when I changed attachment status"), [97784](https://bugzilla.mozilla.org/show_bug.cgi?id=97784 "Bug 97784 - Bugzilla attachment edit textareas missing wrap attribute"), [97825](https://bugzilla.mozilla.org/show_bug.cgi?id=97825 "Bug 97825 - "Edit Attachment As Comment" relies on Mozilla bug 34297"), [97868](https://bugzilla.mozilla.org/show_bug.cgi?id=97868 "Bug 97868 - "Edit" action for attachments is misleading."), [97877](https://bugzilla.mozilla.org/show_bug.cgi?id=97877 "Bug 97877 - changed* operators don't work for attachment status"), [98201](https://bugzilla.mozilla.org/show_bug.cgi?id=98021 "Bug 98021 - BUTTON tags in template/default/attachment/edit.atml do not work with NS 4.7x"), [98074](https://bugzilla.mozilla.org/show_bug.cgi?id=98074 "Bug 98074 - Attachment manager doesn't html_escape bug titles."), [98103](https://bugzilla.mozilla.org/show_bug.cgi?id=98103 "Bug 98103 - Initial attachments statuses."), [98110](https://bugzilla.mozilla.org/show_bug.cgi?id=98110 "Bug 98110 - Attachment change page looks different from bug change page."), [98111](https://bugzilla.mozilla.org/show_bug.cgi?id=98111 "Bug 98111 - Surpassing attachment."), [98112](https://bugzilla.mozilla.org/show_bug.cgi?id=98112 "Bug 98112 - Edit attachment should appear in comments."), [99215](https://bugzilla.mozilla.org/show_bug.cgi?id=99215 "Bug 99215 - attachment status changes have no midair collision protection"), [99716](https://bugzilla.mozilla.org/show_bug.cgi?id=99716 "Bug 99716 - cannot query for Attachment is obsolete AND Attachment Status"), [101056](https://bugzilla.mozilla.org/show_bug.cgi?id=101056 "Bug 101056 - Edit attachment and login page don't work well together [dataloss]"), [101770](https://bugzilla.mozilla.org/show_bug.cgi?id=101770 "Bug 101770 - comment box on the edit attachment page should be bigger"), [103605](https://bugzilla.mozilla.org/show_bug.cgi?id=103605 "Bug 103605 - marking multiple attachments as obsolete in a single change"), [103661](https://bugzilla.mozilla.org/show_bug.cgi?id=103661 "Bug 103661 - should be able to do more when attaching files") and [104521](https://bugzilla.mozilla.org/show_bug.cgi?id=104521 "Bug 104521 - remove old attachment interface in favor of attachment tracker"). Some of these have been since resolved, while others have not.

This also included a rewrite of the Javascript code that gets run when you add or remove products on the query page. This operation was quite slow if you had a reasonable amount of product/components and used a browser that "reflows" pages, such as Mozilla/N6, IE5+, Konqueror ... (in fact basically everything except N4). The rewrite dramatically improved performance, which is now at acceptable levels on bugzilla.mozilla.org.

Unfortunately the new code turned out to regress milestone sortkeys (bug [97736](https://bugzilla.mozilla.org/show_bug.cgi?id=97736 "Bug 97736 - New query.cgi javascript doesn't support sortkeys.")) and selections on pressing the browser back button (bug [97966](https://bugzilla.mozilla.org/show_bug.cgi?id=97966 "Bug 97966 - Query JS nukes old selections.")).

The other two patches added a summary to "dependent bug has had its status changed" e-mails, as well as fixes to properly shut down a Bugzilla installation when the syncshadowdb script is run. bugzilla.mozilla.org used this script to do backups.

## Templatisation

With the introduction of the attachment manager came the start of a process that many Bugzilla administrators will surely cheer - templatisation (bug [86168](https://bugzilla.mozilla.org/show_bug.cgi?id=86168 "Bug 86168 - Bugzilla should use template pages instead of hard-coded HTML")). With templates, HTML is moved out of the Perl code and into separate files. Dynamically generated data is passed by Bugzilla to the templates and the result is then displayed.

This makes an administrators job easier, firstly, because they don't need to know any Perl to change the user interface, and secondly, because they don't need to make changes to their customisted templates every time they upgrade.

Previously RedHat's fork of Bugzilla supported this feature using the "Text::Template" software. However, the attachment manager uses the "Template Toolkit" software for its templates. This is because the Template Toolkit was judged to be technically superior.

Although the templates will be different, and administrators of RH Bugzilla would need to convert their templates to use mainline Bugzilla, this and other recent events indicate we may see a reunification of RH Bugzilla and mainline Bugzilla at some happy point in the future.

The introduction of the Template Toolkit brought up some issues with the software, namely that it failed install tests in certain parts of the world (now fixed) and that the CPAN package did not do proper dependency checking.

The introduction also meant that CVS Bugzilla now requires Perl 5.005 or later, as that is a template toolkit requirement. 2.14 will be the last version of Bugzilla that allows you to use 5.004.

The landing of the attachment manager brought up various issues with the template implementation, including [97721](https://bugzilla.mozilla.org/show_bug.cgi?id=97721 "Bug 97721 - New min. version for perl [5.005]"), [97832](https://bugzilla.mozilla.org/show_bug.cgi?id=97832 "Bug 97832 - turn on template pre-compilation"), [98658](https://bugzilla.mozilla.org/show_bug.cgi?id=98658 "Bug 98658 - Let administrator know which customised templates have been updated by Bugzilla team."), [99024](https://bugzilla.mozilla.org/show_bug.cgi?id=99024 "Bug 99024 - checksetup doesn't give template proper permissions."), [99518](https://bugzilla.mozilla.org/show_bug.cgi?id=99518 "Bug 99518 - template files do not have license headers"), [100089](https://bugzilla.mozilla.org/show_bug.cgi?id=100089 "Bug 100089 - Remove old "template" parameters."), [100092](https://bugzilla.mozilla.org/show_bug.cgi?id=100092 "Bug 100092 - Template process failed error drops poop trail."), [100094](https://bugzilla.mozilla.org/show_bug.cgi?id=100094 "Bug 100094 - General template handling code."), [104261](https://bugzilla.mozilla.org/show_bug.cgi?id=104261 "Bug 104261 - attachment.cgi doesn't look in "template/custom" directory") and [104600](https://bugzilla.mozilla.org/show_bug.cgi?id=104600 "Bug 104600 - template/custom gets pruned on cvs update -dP").

It is hoped that templatisation may be complete by the end of 2.16.

## Automatically Preventing Problems

One direction the team is heading is to try and be proactive in preventing problems rather than reacting to them.

During the 2.13 cycle [Tinderboxen were introduced](https://tinderbox.mozilla.org/showbuilds.cgi?tree=Bugzilla) to check that Bugzilla compiled. For those not familiar with [Tinderbox](https://www.mozilla.org/tinderbox.html), it is another mozilla.org "web tool" that regularly checks a piece of software in CVS for problems.

After 2.14, a new "testing suite" has been included in CVS. Currently this checks the code for some bad "code patterns" we have encountered in the past. The testing suite does not do testing in the standard sense - the Bugzilla code currently does not have adequate separation between "back-end" and "front-end" (user interface) code to do this easily.

New checks have been suggested that will be added, but more are always welcome. See bug [97976](https://bugzilla.mozilla.org/show_bug.cgi?id=97976 "Bug 97976 - Tests to do ...") for more information.

Current tests are:

*   checking everything compiles, Perl and templates
*   checking no tabs are present
*   checking only the multi-parameter versions of system and exec are used
*   checking all files use -w and use strict

The testing suite is now a pre-checkin requirement - all new code must not cause problems it detects. There are currently 3 [Tinderbox Clients](https://tinderbox.mozilla.org/Bugzilla/) running this test suite to catch the naughty people who checkin without running these tests.

Another area in which problems can be automatically prevented is by using "taint mode". Taint mode is about ensuring data from an untrusted source (such as the user) must be properly checked before being used to influence something else (such as the database). Its intention is to make it harder to introduce security holes into the product where data is not properly checked or escaped. It is a goal to get all of Bugzilla to use taint mode.

Currently, only "processmail" runs in taint mode.

## Hackers' Guide

To encourage others to contribute code towards Bugzilla, a "[hackers' guide](/contributing/developer)" has been incorporated into the [Bugzilla Guide](https://www.bugzilla.org/docs/html/) that comes with every copy of Bugzilla.

The aim is to quickly explain everything a developer needs to know about contributing code to Bugzilla. This includes both the things we require (eg the avoidance of certain features) and prefer (eg style issues).

The document is still in its infancy and it may take some time for all of the conventions and rules of Bugzilla development to be compiled, but it should still be useful in its incomplete state. Suggestions are welcome.

As such it is recommended you consult the online version rather than the one shipped with the 2.14 tarball, as it is out of date.

<font size="-1">_Editor's note: the Hacker's Guide is no longer in the Bugzilla guide, but on the Bugzilla website, renamed as the Developers Guide. The link above will take you to the new Developers Guide instead._</font>

## Product Move

The Bugzilla team felt that having a component in the Webtools product on mozilla.org was too limiting and it would be better to move into a Bugzilla product. Bugzilla has expanded a lot faster than any of the other mozilla.org web tools (such as Bonsai and Tinderbox), both in amount of code and number of developers.

While it may have seemed reasonable to have only a Bugzilla component in the beginning, that no longer is the case. The new product means we can have different Bugzilla components with different default owners, as well as 10 new votes solely for Bugzilla (as opposed to all the web tools), as it should be.

Once the product was created the work began moving the open bugs to the correct component. This has now been completed, and around 800 open bug reports were moved.

It was decided that the resolved bugs would be all moved to the "Bugzilla-General" component, as there was too many to worry about sorting them into their components. At the same time, we took to opportunity to piggy back update the assignee and QA fields on some of the bugs, because emails were already going to be sent out about these bugs.

Because of this, lack of sleep and the long neglected bug [30731](https://bugzilla.mozilla.org/show_bug.cgi?id=30731 "Bug 30731 - status not kept in mass reassignment of resolved bugs") combined to cause an unfortunate incident where 151 resolved bugs got reopened. This resulted in much grumbling, and a fix checked in. This caused special problems for bugs marked DUPLICATE, so related bugs [91808](https://bugzilla.mozilla.org/show_bug.cgi?id=91808 "Bug 91808 - Sanity check duplicates table.") and [97971](https://bugzilla.mozilla.org/show_bug.cgi?id=97971 "Bug 97971 - Sanity check should check statuses, resolutions, everconfirmed & number of votes.") also received attention.

## 2.16 Goals

A message was posted to the webtools mailing list/newsgroup regarding the [goals for the 2.16 release](news://news.mozilla.org/3B8D8CA7.2561F657@chariot.net.au). This goes into detail about the two main goals which are (slightly simplified):

*   no known bugs
*   no pending patches

See the message for more details. Other goals that may be dropped include fully working on Win32, all files running in taint mode, full templatisation and fully valid HTML 4.01 output.

## Review Day

The first "review day" was held on the 5th of October. The idea of review day was that developers would not develop but instead help to review some of the patches waiting for review and check in.

The results were:

*   9 positive reviews.
*   3 negative reviews.
*   5 checkins.
*   The patch queue size went from approximately 124 to 111.

Another review day was held on the 12th of October, but we forgot to keep track of the stats for it. However, during that preceding week, the patch queue size reduced to around 99\. At the time of writing, it was back up. Hopefully further review days can result in bouncing the patch queue size off zero.

## Contributions

There are many ways you can help the Bugzilla team.

*   **Patches to Fix Bugs/Implement New Features.** These are very welcome, especially if they are targetted for the 2.16 milestone! They need to be appropriately generic for all Bugzilla installations and conform to our other requirements (see the hackers' guide) before they can appear in CVS, but if you don't wish to do this, anything is better than nothing, and we can use your work as a base.
*   **New documentation.** If you think you can help with the documentation for Bugzilla, please contact [Matthew Barnson](mailto:barnboy@trilobyte.net).
*   **Testing.** Search for bugs in the Bugzilla software, as well as trying out pending patches in the bug system.
*   **Review.** If you have experience with Perl and Bugzilla code, it would be very useful if you look over pending patches in the bug system and see if there are any problems with them. As dealing with all pending patches is a 2.16 goal, review and testing of them is especially important. Generally we expect reviewers to have submitted some patches first so we can evaluate their ability. If you fit into this category, please contact [Dave Miller](mailto:justdave@bugzilla.org) about this.
*   **Automatic Problem Finding.** If you have ideas for automatically detecting problems, please let the team know by filing a bug in the [Testing Suite](https://bugzilla.mozilla.org/enter_bug.cgi?product=Bugzilla&component=Testing+Suite) component.

The Bugzilla team mainly communicates through the IRC channel #mozwebtools on irc.mozilla.org. All are welcome on this channel, whether you are an administrator of a Bugzilla installation or wish to contribute. The more the merrier.

## Upcoming Major Features

Major new features are being working on that will likely appear in 2.16\. These include:

*   PostgreSQL support. (Bug [98304](https://bugzilla.mozilla.org/show_bug.cgi?id=98304 "Bug 98304 - Allow Bugzilla to work with Postgres SQL (PgSQL)"))
*   Ability to have more than 55 groups, which will also allow a finer grained rights system to be introduced. (Bug [68022](https://bugzilla.mozilla.org/show_bug.cgi?id=68022 "Bug 68022 - Need more than 55 groups"))
*   Customised resolutions, that allow adding, removing, deactivating and renaming of resolutions. (Bug [94534](https://bugzilla.mozilla.org/show_bug.cgi?id=94534 "Bug 94534 - Customised resolutions."))
*   Expanding the e-mail preferences to allow watching components, keywords, etc. (Bug [73665](https://bugzilla.mozilla.org/show_bug.cgi?id=73665 "Bug 73665 - Need an "emailprefs" table"))
*   Request tracker, for managing requests to change things about bugs. (Bug [98801](https://bugzilla.mozilla.org/show_bug.cgi?id=98801 "Bug 98801 - request tracker"))

## Checkins Since 2.14

*   [Bug 8647](https://bugzilla.mozilla.org/show_bug.cgi?id=8647 "Bug 8647 - Query screen should have option to sort on last changed date/time.") - Added option to sort by last change date directly to the query page (query.cgi).
*   [Bug 19910](https://bugzilla.mozilla.org/show_bug.cgi?id=19910 "Bug 19910 - One Bugzilla eats other Bugzilla's cookies on same server") - Added 'cookiepath' parameter for when you have multiple installations at one address, to keep the cookies separate.
*   [Bug 27420](https://bugzilla.mozilla.org/show_bug.cgi?id=27420 "Bug 27420 - Component field should have COLSPAN in long_list.cgi") - Added extra space to the Component and Target Milestone fields in the long list display of bugs (long_list.cgi).
*   [Bug 28736](https://bugzilla.mozilla.org/show_bug.cgi?id=28736 "Bug 28736 - Include bug summary in "dependency changed" mail") - Added summary to dependency status change notification mails (processmail).
*   [Bug 30480](https://bugzilla.mozilla.org/show_bug.cgi?id=30480 "Bug 30480 - [RFE] add 'show dependencies as buglist' link to showdependencytree.cgi") - Added 'show dependencies as buglist' links to the dependency tree (dependencytree.cgi).
*   [Bug 30597](https://bugzilla.mozilla.org/show_bug.cgi?id=30597 "Bug 30597 - "votes" should not be a hyperlink") - Made Votes field on the query page more consistent with the rest of the page (query.cgi).
*   [Bug 30731](https://bugzilla.mozilla.org/show_bug.cgi?id=30731 "Bug 30731 - status not kept in mass reassignment of resolved bugs") - Prevented the status being set to NEW when reassigning non-open bugs on the mass change page (process_bug.cgi).
*   [Bug 42337](https://bugzilla.mozilla.org/show_bug.cgi?id=42337 "Bug 42337 - More visual when encountering errors in attaching files") - Added the usual red box for errors when uploading attachments (createattachment.cgi).
*   [Bug 42810](https://bugzilla.mozilla.org/show_bug.cgi?id=42810 "Bug 42810 - Quotes in product or version field") - Made apostrophes work in product names.
*   [Bug 46935](https://bugzilla.mozilla.org/show_bug.cgi?id=46935 "Bug 46935 - %commandmenu% is ignored in headerhtml") - Fixed a typo on the 'headerhtml' parameter description that implied it could contain '%commandmenu%' (defparams.pl).
*   [Bug 51519](https://bugzilla.mozilla.org/show_bug.cgi?id=51519 "Bug 51519 - Links to index aren't very generic") - Made links to index on the admin edit users page point to '.' instead of 'index.html', to handle customised bases (editusers.cgi).
*   [Bug 51521](https://bugzilla.mozilla.org/show_bug.cgi?id=51521 "Bug 51521 - Broken HTML on user permissions page") - Fixed bad HTML on the user permissions page (userprefs.cgi).
*   [Bug 52577](https://bugzilla.mozilla.org/show_bug.cgi?id=52577 "Bug 52577 - Mac OS X needs an OS entry in bugzilla") - Added Mac OS X to the default operating systems (checksetup.pl).
*   [Bug 52782](https://bugzilla.mozilla.org/show_bug.cgi?id=52782 "Bug 52782 - whineatnews.pl email should use the 'sendmailnow' Param (FIX INCLUDED :-)") - Made 'whineatnews.pl' email use the 'sendmailnow' parameter. This is needed for mail agents other than sendmail.
*   [Bug 52885](https://bugzilla.mozilla.org/show_bug.cgi?id=52885 "Bug 52885 - automatic radio selection for reassign shouldn't trigger if new text is same as original owner or empty") - Made automatic radio selection for the reassignment action not trigger if the new text is same as original owner or empty (show_bug.cgi).
*   [Bug 53612](https://bugzilla.mozilla.org/show_bug.cgi?id=53612 "Bug 53612 - "milestone url" is bad on delete component screen") - Made the milestone URL appear correctly when deleting a product or a component (editproducts.cgi and editcomponents.cgi).
*   [Bug 55630](https://bugzilla.mozilla.org/show_bug.cgi?id=55630 "Bug 55630 - email-suffix is not shown in createaccount-page") - Added email suffix to the users' account creation page (createaccount.cgi).
*   [Bug 57819](https://bugzilla.mozilla.org/show_bug.cgi?id=57819 "Bug 57819 - cut down large mysql error strings") - Pruned down large SQL error strings.
*   [Bug 57821](https://bugzilla.mozilla.org/show_bug.cgi?id=57821 "Bug 57821 - Empty regular expression match nothing") - Prevented an empty regular expression from causing a software error when searching for users (editusers.cgi).
*   [Bug 58436](https://bugzilla.mozilla.org/show_bug.cgi?id=58436 "Bug 58436 - javascript strict warnings in query.cgi") - Fixed Javascript warnings on the query page (query.cgi).
*   [Bug 65164](https://bugzilla.mozilla.org/show_bug.cgi?id=65164 "Bug 65164 - not sending </html>") - Made Bugzilla send </html> at the end of its pages.
*   [Bug 66651](https://bugzilla.mozilla.org/show_bug.cgi?id=66651 "Bug 66651 - include link to attachment in notification mail") - Included link to attachment when a notification mail is sent for an attachment creation (processmail).
*   [Bug 69533](https://bugzilla.mozilla.org/show_bug.cgi?id=69533 "Bug 69533 - enter_bug.cgi does not auto-detect HP-UX as OS") - Added HP-UX to the OS auto detection (enter_bug.cgi).
*   [Bug 69616](https://bugzilla.mozilla.org/show_bug.cgi?id=69616 "Bug 69616 - Edit sanity check?") - Made the footer not imply admins had the ability to "Edit Sanity Check". You actually run sanity checks, not edit them.
*   [Bug 71664](https://bugzilla.mozilla.org/show_bug.cgi?id=71664 "Bug 71664 - No bug record listed as bad keyword cache.") - Fixed sanity check so it doesn't complain about a bad keyword cache on a bug that does not exist, as the error is detected elsewhere, and it can't be fixed automatically like other bad keyword cache problems (sanitycheck.cgi).
*   [Bug 73959](https://bugzilla.mozilla.org/show_bug.cgi?id=73959 "Bug 73959 - My Votes doesn't show up on buglist.cgi or attachment.cgi") - Fixed some pages not displaying the "Show Votes" link in the footer (buglist.cgi and attachment.cgi).
*   [Bug 75840](https://bugzilla.mozilla.org/show_bug.cgi?id=75840 "Bug 75840 - syncshadowdb needs to be more flexible") - Made 'syncshadowdb' shut down Bugzilla when it runs, and accept a parameter for an alternative temporary directory.
*   [Bug 76161](https://bugzilla.mozilla.org/show_bug.cgi?id=76161 "Bug 76161 - Don't select "resolve as dup" radio button when exiting empty dupe field.") - Made the 'resolve as duplicate' action not select the radio button when exiting empty an duplicate bug number field (show_bug.cgi).
*   [Bug 76714](https://bugzilla.mozilla.org/show_bug.cgi?id=76714 "Bug 76714 - incorrectly nested FORM and TABLE tags in command menu") - Fixed the incorrect nesting of FORM and TABLE elements in the footer.
*   [Bug 76140](https://bugzilla.mozilla.org/show_bug.cgi?id=76140 "Bug 76140 - Extra sanity checks.") - Added more referential sanity checks, plus sanity checking the existence of default milestones (sanitycheck.cgi).
*   [Bug 82809](https://bugzilla.mozilla.org/show_bug.cgi?id=82809 "Bug 82809 - bugzilla puts &#013; inside <pre> tags") - Made comments in bugs no longer use &#013; where the linefeeds should be.
*   [Bug 83058](https://bugzilla.mozilla.org/show_bug.cgi?id=83058 "Bug 83058 - need a way to hide resolved bugs in dependency tree view") - Added ability to hide resolved bugs and limit depth to the dependency tree (dependencytree.cgi).
*   [Bug 83474](https://bugzilla.mozilla.org/show_bug.cgi?id=83474 "Bug 83474 - improper handling of "rebuildkeywordcache" in sanitycheck.cgi") - Fixed sanity check so the tables get unlocked properly when rebuilding the keyword cache, if there were no keywords to rebuild (sanitycheck.cgi)
*   [Bug 84338](https://bugzilla.mozilla.org/show_bug.cgi?id=84338 "Bug 84338 - RFE: enhanced attachment, patch and request tracking") - Added attachment tracker (attachment.cgi and editattachstatuses.cgi).
*   [Bug 87818](https://bugzilla.mozilla.org/show_bug.cgi?id=87818 "Bug 87818 - Make Bugzilla support LINK tags for buglists") - Added support for HTML <LINK> tag for buglists (buglist.cgi and show_bug.cgi).
*   [Bug 90333](https://bugzilla.mozilla.org/show_bug.cgi?id=90333 "Bug 90333 - Bulk change of no bugs gives software error.") - Made Bugzilla give an appropriate error message if a user tries to mass change when no bugs are selected to change (process_bug.cgi).
*   [Bug 91486](https://bugzilla.mozilla.org/show_bug.cgi?id=91486 "Bug 91486 - "changed from" missing from boolean chart") - Added a "changed from" option to the boolean charts (query.cgi).
*   [Bug 91808](https://bugzilla.mozilla.org/show_bug.cgi?id=91808 "Bug 91808 - Sanity check duplicates table.") - Added sanity checks to make sure the resolution is DUPLICATE if and only if there is an entry on the duplicates table (sanitycheck.cgi).
*   [Bug 93006](https://bugzilla.mozilla.org/show_bug.cgi?id=93006 "Bug 93006 - Changing several bug at once defaults to "Reassign" checkbox.") - Made the mass change page auto-select the correct radio button (buglist.cgi).
*   [Bug 93388](https://bugzilla.mozilla.org/show_bug.cgi?id=93388 "Bug 93388 - Full name should be trimmed of whitespace before going into database") - Made full name be trimmed of whitespace before going into database.
*   [Bug 95060](https://bugzilla.mozilla.org/show_bug.cgi?id=95060 "Bug 95060 - votehelp.html could do with a bit of clarification") - Corrected instructions on how to vote, regarding using checkboxes as opposed to textboxes where only one vote is allowed.
*   [Bug 96534](https://bugzilla.mozilla.org/show_bug.cgi?id=96534 "Bug 96534 - query.cgi is slow to reflow when you change the product field") - Made performance improvements of Javascript on the query page (query.cgi).
*   [Bug 96603](https://bugzilla.mozilla.org/show_bug.cgi?id=96603 "Bug 96603 - Grammatical error in bug_status.html") - Fixed a grammatical error on bug_status.html.
*   [Bug 97185](https://bugzilla.mozilla.org/show_bug.cgi?id=97185 "Bug 97185 - make_select should add a newline after each option") - Made make_select add a newline after each option in the source.
*   [Bug 97588](https://bugzilla.mozilla.org/show_bug.cgi?id=97588 "Bug 97588 - localconfig should mention access.conf as well as httpd.conf (for old apache)") - Made "localconfig" mention access.conf for old Apache servers.
*   [Bug 97657](https://bugzilla.mozilla.org/show_bug.cgi?id=97657 "Bug 97657 - bug_form_pl_sillyness() used in defparams.pl causes subroutine redefined error") - Made the sillyness sub be called defparams_pl_sillyness in defparams.pl.
*   [Bug 97721](https://bugzilla.mozilla.org/show_bug.cgi?id=97721 "Bug 97721 - New min. version for perl [5.005]") - Added check to ensure Perl is at least version 5.005, and Template Toolkit dependencies are fulfilled (checksetup.pl).
*   [Bug 97764](https://bugzilla.mozilla.org/show_bug.cgi?id=97764 "Bug 97764 - Received bugmail when I changed attachment status") - Made the attachment tracker not send mail to people about their own changes who didn't want to receive their own changes.
*   [Bug 97784](https://bugzilla.mozilla.org/show_bug.cgi?id=97784 "Bug 97784 - Bugzilla attachment edit textareas missing wrap attribute") - Made comments in attachment update form get properly word-wrapped (server side).
*   [Bug 97877](https://bugzilla.mozilla.org/show_bug.cgi?id=97877 "Bug 97877 - changed* operators don't work for attachment status") - Made the changed* operators work for attachment statuses on the boolean charts (query.cgi).
*   [Bug 97971](https://bugzilla.mozilla.org/show_bug.cgi?id=97971 "Bug 97971 - Sanity check should check statuses, resolutions, everconfirmed & number of votes.") - Added sanity checks to check that there is a non-open status if and only if there is a resolution, the status is UNCONFIRMED only if everconfirmed is 0, and that bugs that have enough votes to be confirmed have been.
*   [Bug 97976](https://bugzilla.mozilla.org/show_bug.cgi?id=97976 "Bug 97976 - Tests to do ...") - Testing suite.  Partial checkins.
*   [Bug 98074](https://bugzilla.mozilla.org/show_bug.cgi?id=98074 "Bug 98074 - Attachment manager doesn't html_escape bug titles.") - Made the attachment tracker properly HTML escape bug titles.
*   [Bug 98095](https://bugzilla.mozilla.org/show_bug.cgi?id=98095 "Bug 98095 - importxml.pl fails perl -wc test") - Made importxml.pl pass tests in the testing suite.
*   [Bug 98146](https://bugzilla.mozilla.org/show_bug.cgi?id=98146 "Bug 98146 - Minor problem w/ error message if some sort of login error in doeditvotes") - Made doeditvotes.cgi give a safer error message if login information is bad.
*   [Bug 98468](https://bugzilla.mozilla.org/show_bug.cgi?id=98468 "Bug 98468 - Sample value for emailregexp allows empty user names") - Made the default "emailregexp" parameter not accept blank emails.
*   [Bug 99465](https://bugzilla.mozilla.org/show_bug.cgi?id=99465 "Bug 99465 - FreeBSD not recognized!") - Added FreeBSD to the OS auto detection (enter_bug.cgi).
*   [Bug 99716](https://bugzilla.mozilla.org/show_bug.cgi?id=99716 "Bug 99716 - cannot query for Attachment is obsolete AND Attachment Status") - Made query for "attachment is obsolete" and on attachment status work.
*   [Bug 100490](https://bugzilla.mozilla.org/show_bug.cgi?id=100490 "Bug 100490 - [Bugzilla] bug ID used over search term if javascript disabled. Incorrect error message") - Made QuickSearch give a better error message when Javascript is off.
*   [Bug 101056](https://bugzilla.mozilla.org/show_bug.cgi?id=101056 "Bug 101056 - Edit attachment and login page don't work well together [dataloss]") - Prevented incorrect error messages when editing an attachment if you needed to log in first.
*   [Bug 101659](https://bugzilla.mozilla.org/show_bug.cgi?id=101659 "Bug 101659 - emailsuffix missing from component owner mailto tag") - Added email suffix (where applicable) to the component owner mailto tag.
*   [Bug 102032](https://bugzilla.mozilla.org/show_bug.cgi?id=102032 "Bug 102032 - Fix tinderbox test errors and warnings") - Fixed test errors and warnings in CVS.
*   [Bug 103121](https://bugzilla.mozilla.org/show_bug.cgi?id=103121 "Bug 103121 - editusers.cgi needs an Add link on the query page.") - Made editusers.cgi include 'add user' links.
*   [Bug 103554](https://bugzilla.mozilla.org/show_bug.cgi?id=103554 "Bug 103554 - CGI.pl: PutHeader and GetCommandMenu  should output correct HTML") - Made the HTML generated by the PutHeader and GetCommandMenu subroutines validate as HTML 4.01.
*   [Bug 103592](https://bugzilla.mozilla.org/show_bug.cgi?id=103592 "Bug 103592 - truncate or wrap long email addresses in buglist.cgi") - Made email addresses that are longer than 30 characters be truncated in the bug list, to reduce column size.
*   [Bug 104105](https://bugzilla.mozilla.org/show_bug.cgi?id=104105 "Bug 104105 - Not logged in page should indicate you may need to create account") - Made a cosmetic change to the login page to make it obvious that you can create an account.
*   [Bug 104117](https://bugzilla.mozilla.org/show_bug.cgi?id=104117 "Bug 104117 - Find dialog: sometimes when "Find" button is clicked, the dialog disappear") - Fixed the edit keywords (editkeywords.cgi) link on footer broken as a result of the fix for bug [103554](https://bugzilla.mozilla.org/show_bug.cgi?id=103554 "Bug 103554 - CGI.pl: PutHeader and GetCommandMenu  should output correct HTML").
*   [Bug 104180](https://bugzilla.mozilla.org/show_bug.cgi?id=104180 "Bug 104180 - preset query footer broken for named queries containing spaces") - Made &nbsp; not be used in the URL for a saved query with a space. It should only be used in the display of the query.
*   [Bug 104247](https://bugzilla.mozilla.org/show_bug.cgi?id=104247 "Bug 104247 - buglist.cgi colorization is broken") - Made colours in bug lists work again (buglist.cgi).
*   [Bug 104516](https://bugzilla.mozilla.org/show_bug.cgi?id=104516 "Bug 104516 - Bugzilla source files should not contain <TAB> characters") - Removed all TAB characters from source code.
