---
title: "Bugzilla Status Update"
date: 2002-11-18
author: ["preed"]
categories:
- Status
---

## State of Bugzilla

We have come to an exciting time in the life of the Bugzilla project. In the last few months, we've had a few major companies adopt Bugzilla for their internal bug-tracking systems. OK, nothing new here; _lots_ of companies use Bugzilla.

So what's the big deal? These particular companies are contributing back. We've gotten a number of **major** features in the last couple months, and some other major features in the works, all contributed by companies who are paying their employees to make Bugzilla meet their needs.

This is a really good thing for Bugzilla, because it means we're gaining more features that will appeal to the enterprise market rather than just small companies and Open Source groups. It also puts enterprise-level features into the hands of the small companies and Open Source groups. And those same enterprise-level corporations are the ones who can afford to put full-time manpower on improving the product, which just repeats the cycle. I think of it as a "coming of age" for Bugzilla, and a really good demonstration of the power of Open Source.

But this isn't all flowery and sweet-smelling. With that type of contribution level also comes a great challenge. Not everyone who wants to use Bugzilla is going to want all of these features. Sure, a lot of them are really cool--you can read about some of them below--but each software development environment is different, and not everyone will have a use for every feature. So the Bugzilla team is now presented with the challenge of making sure Bugzilla remains easily configurable and scalable from the very small to the very large. There's also the challenge of making sure new features don't slow Bugzilla down beyond a reasonable level, as we've already run into in some cases with the changes to products, components, and groups.

There's also the sense of "too many cooks in the kitchen" that has to be addressed. We **love** getting all this help but to ensure that Bugzilla's goals continue to get met, I feel it's necessary to institute an "approval" process for checkins. This new policy comes as an addition to our existing review policy.

Previously, the only thing developers had to do to check something into Bugzilla's CVS tree was get one or two people on the review team to say "yes, this is quality code" and they could check it in. That process isn't going away, but in addition to that, approval will now need to be obtained from myself or a designee before it can be checked in. This won't amount to a code review, rather a 'yes' or 'no' to whether this feature or bugfix in this form at this time is the best course of action to fulfill Bugzilla's design goals.

Our core development team has always been very good about ensuring that their individual work is peer reviewed for quality, and their checkin coordinated with other work going on in the tree to ensure the greatest benefit for Bugzilla, both from a code/feature perspective and a software engineering/management perspective. This new policy simply ensures that all our "master chefs" in the "kitchen" are working on the same course, preparing the same style of food, ensuring that we continue to provide the best damn bug-tracking package available today _and_ tomorrow, for open source project and enterprise customer alike.

-- Dave Miller, Bugzilla project lead

## Since the Last Status Report...

The Bugzilla Team has been working furiously over the past two weeks on readying the trunk for a 2.17.1 development release. I know many of you reading this were hoping to see that tarball of 2.17.1 by now, but there were some [regressions](https://bugzilla.mozilla.org/show_bug.cgi?id=bmo-regressions) found during the recent [mozilla.org](https://bugzilla.mozilla.org/) upgrade to 2.17.1 from cvs, which we decided were glaring enough that we really should fix them first before we rolled the tarball.

2.17.1 is slated to be released within the week; the Bugzilla team is currently stamping out the last few of the above-mentioned regressions which have cropped up. 2.17.1 is intended for developers wishing to base large landings or patches off an official bugzilla.org release. It should not be used for production purposes, except in special circumstances. 2.17.1 is not a solution for Win32 users ([see below](#win32)). The vast majority of sites wanting to test or use Bugzilla in production should install [2.16.1](https://www.bugzilla.org/releases/2.16.1/). If you're not sure whether you should use 2.17.1 or 2.16.1, you want 2.16.1.

## Administrators' Mailing List Reminder

We'd like to remind all Bugzilla administrators that to assist them in keeping up-to-date with release announcements and security advisories, we've started a mailing list for people who administer Bugzillas. It is very low traffic - release announcements and security advisories only. We advise all Bugzilla administrators to [subscribe](https://lists.bugzilla.org/cgi-bin/mj_wwwusr?func=lists-full-long&extra=announce), so they can keep up with important Bugzilla news.

<a name="win32"></a>

## The (Unchanged) Win32 Situation

Bugzilla-on-Win32 is still unchanged: administrators using Win32 as their platform for Bugzilla do not want the 2.16 branch, including 2.16.1, nor do they want 2.17.1\. The plan is to make the trunk Win32-friendly (which involves a number of quite large changes, and which _unfortunately_ did not happen in this release cycle) and then announce that fact, allowing Win32 Bugzilla administrators to pull from the trunk on a known tag. This may become a 2.17.2 release. Interested admins can search bugzilla on the [[needed for Win32bz]](https://bugzilla.mozilla.org/buglist.cgi?short_desc_type=allwordssubstr&short_desc=&product=Bugzilla&long_desc_type=allwordssubstr&long_desc=&bug_file_loc_type=allwordssubstr&bug_file_loc=&status_whiteboard_type=allwordssubstr&status_whiteboard=%5Bneeded+for+Win32bz%5D&keywords_type=allwords&keywords=&bug_status=NEW&bug_status=ASSIGNED&bug_status=REOPENED&bug_status=RESOLVED&emailassigned_to1=1&emailtype1=substring&email1=&emailassigned_to2=1&emailreporter2=1&emailqa_contact2=1&emailtype2=substring&email2=&bugidtype=include&bug_id=&votes=&changedin=&chfieldfrom=&chfieldto=Now&chfieldvalue=&cmdtype=doit&newqueryname=&order=Reuse+same+sort+as+last+time&field0-0-0=noop&type0-0-0=noop&value0-0-0=) status whiteboard entry to track bugs that are part of this process.

The Bugzilla Team continues to recommend Unix-based operating systems, including Linux, as the best platform for a Bugzilla installation; please consider it if you are starting a new Bugzilla installation and have some say in the platform decision. Trust us: it makes life easier for everyone.

## Upcoming Major Features

Major new features are being worked on. If you would like to know when we plan on adding one of these features, you can get that information from the bug requesting its implementation. These include:

*   Ability to send email via SMTP instead of relying on a local installation of sendmail. (Bug [84876](https://bugzilla.mozilla.org/show_bug.cgi?id=84876))
*   PostgreSQL support. (Bug [98304](https://bugzilla.mozilla.org/show_bug.cgi?id=98304 "Allow Bugzilla to work with Postgres SQL (PgSQL)"))
*   Sybase support. (Bug [173130](https://bugzilla.mozilla.org/show_bug.cgi?id=173130 "support Sybase"))
*   Ability to add generic customized fields to bugs (Bug [91037](https://bugzilla.mozilla.org/show_bug.cgi?id=91037 "a generic implementation for custom fields"))
*   Customised resolutions, that allow adding, removing, deactivating and renaming of resolutions. (Bug [94534](https://bugzilla.mozilla.org/show_bug.cgi?id=94534 "Customised resolutions."))
*   Expanding the e-mail preferences to allow watching components, keywords, etc. (Bug [73665](https://bugzilla.mozilla.org/show_bug.cgi?id=73665 "Need an "emailprefs" table"))
*   `mod_perl` support. (Bug [87406](https://bugzilla.mozilla.org/show_bug.cgi?id=87406 "Make Bugzilla work with mod_perl (under Apache)"))
*   New makefile-based installation system ([Bug 104660](https://bugzilla.mozilla.org/show_bug.cgi?id=104660), [Bug 105854](https://bugzilla.mozilla.org/show_bug.cgi?id=105854), [Bug 105855](https://bugzilla.mozilla.org/show_bug.cgi?id=105855), and [Bug 105856](https://bugzilla.mozilla.org/show_bug.cgi?id=105856))
*   Generic charting. Allows users to define arbitrary data sets for which historical data will be recorded, and then plot those data sets. Bug [16009](https://bugzilla.mozilla.org/show_bug.cgi?id=16009).
*   Rearchitect product groups. Gives administrators much more control over how products and groups are related. Bug [147275](https://bugzilla.mozilla.org/show_bug.cgi?id=147275).

<a name="newfeatures"></a>

## New Bugzilla Features

### Reporting Improvements

Bugzilla has a new mechanism for generating reports of the current state of the bug database. It has two, related parts: a table-based view, and several graphical views.

The table-based view allows you to specify an x, y and z (multiple tables of data) axis to plot, and then restrict the bugs plotted using the standard query form. You can take the data as HTML or CSV, for importing into a spreadsheet. Each number in the HTML version of the table is linked to a query which produces the list.

So, for example, a Netscape manager could plot assignee vertically, and severity horizontally, and restrict assignee to the names of his managees. He would then be able to see which of his managees was overloaded with severe bugs.

There are also bar, line and pie charts, which are defined in a very similar way. These views may be more appropriate for particular data types, and are suitable for saving and then putting into presentations or web pages.

Note that no attempt is made to prevent you from plotting silly data sets. For example, if you plot a graph of "assignee" along the X axis, and choose a line graph, your line won't mean very much.

Example: [https://bugzilla.mozilla.org/report.cgi?x_axis_field=bug_status&y_axis_field=component &product=MailNews&cumulate=1&format=table&ctype=html&action=wrap](https://bugzilla.mozilla.org/report.cgi?x_axis_field=bug_status&y_axis_field=component&product=MailNews&cumulate=1&format=table&ctype=html&action=wrap) (You can switch between report types using the controls at the bottom.)

### Request Tracker

The Request Tracker (RT) is a set of enhancements that make attachment statuses more powerful and easier to administer. It includes the following changes:

*   Additional states: Previously attachment statuses could be in one of two states: off or on. RT adds two more states for a total of four: off, granted, denied, and (optionally) requested, where "granted" is the equivalent of "on". These additions mean it is no longer necessary to define a status to negate another status (f.e. "needs-work" to negate "has-review") because negation is built into each status via the status' "denied" state.
*   Bug statuses: Previously only attachments could have these kinds of statuses. RT enables them for bugs as well. Since the word "status" already has a meaning for bugs, attachment statuses have been renamed to "flags" to avoid confusion.
*   Requests: Flags can now optionally be made requestable, which means users can ask other users to set them. When a user requests a flag, Bugzilla emails the requestee and adds the request to a browsable queue so both the requester and the requestee can keep track of its status. Once the requestee fulfills the request by setting the flag to either granted or denied, Bugzilla emails the requestee and removes the request from the queue.  
    This feature supports workflow like the mozilla.org code review and milestone approval processes, whereby code is peer reviewed before being committed and patches get approved by product release managers for inclusion in specific product releases.
*   Product/component specificity: Previously flags were product-specific, and if you wanted the same flag for multiple products you had to define multiple flags with the same name. Flags are now product/component-specific, and a single flag can be enabled or disabled for multiple product/component combinations via inclusions and exclusions lists. Flags are enabled for all combinations on their inclusions list except those that appear on their exclusions list.

For more information see the [brief online documentation](https://bugzilla.mozilla.org/flag-help.html).

### User Wildcard Matching

Sites can now enable the use of wildcards and substrings in bug entry and editing forms. If the `usermatchmode` param is set to wildcard, then any "*" included in email addreses will be treated as a wildcard and cause the entry provided to be matched against all active userids and real names in the system. If `usermatchmode` is set to search, addresses that do not exactly match an existing email address will be matched as a substring as well.

Two other paramaters influence the behavior of wildcards, `maxusermatches` and `confirmuniqueusermatch` permit a site to determine how broadly to apply ambiguous wildcards and to determine if all wildcard expansions should be confirmed.

### Support for "Insiders"

If the `insidergroup` parameter is defined, a specific group of users can be designated insiders who can designate comments and attachments as private to other insiders. These comments and attachments will be invisible to other users who are not members of the insiders group even if the bugs to which they apply are visible. Other insiders will see the comments and attachments with a visual tinting indicating that they are private.

### Enterprise Group Support

The 55 group limit is now gone along with the `groupset` and `blessgroupset` bitset fields. Each user is now a member of a list of groups. It is now possible to define a group in terms of other groups as well as to place individual users in a group directly.

Bugzilla now keeps track of whether a user was added to a group via a regular expression match or whether they were explicitly added to that group. Changes to regular expressions for group membership now take effect instantly for all users when updated, and no longer apply only to new accounts. If a member no longer matches the group's regexp, and they were originally added to that group because they matched the regexp, they are removed from that group. Note that the upgrade process has no way to know who was added to a group explicitly and who was added by a regexp, so all members of a group prior to this feature will remain members of that group until explicitly removed from it via the user editor, wether they still match the regexp or not.

### Estimated/Actual/Remaining Time

If the `timetrackinggroup` parameter is defined, members of the named group get controls for tracking the time spent fixing a bug added to the bug form. Any time comments are added to the bug, members of the time tracking group can add an amount of time they spent, and it's figured into the total and displayed at the top of the bug. Shown in the bug are your original estimate, the amount of time spent so far, the revised estimate of how much time is remaining, and your gain/loss on the original estimate.

### Support for database replication

The shadow database is a read-only copy of the Bugzilla database which can be used for queries. Until now, keeping the main database in sync with the shadow was handled internally by Bugzilla. This has several issues with performance, stability, and accuracy, and so Bugzilla now supports using MySQL's replication to handle the mirroring ([bug 124589](https://bugzilla.mozilla.org/show_bug.cgi?id=124589)).

As announced before the release of Bugzilla 2.16, the only supported way for a read-only database will soon become replication ([bug 180870](https://bugzilla.mozilla.org/show_bug.cgi?id=180870)). It is not expected that this will cause any problems for sites, as the only installation known to be using the shadowdb is bugzilla.mozilla.org. The old code will be removed from Bugzilla as soon as <span title="bugzilla.mozilla.org">bmo</span> upgrades, and well before the next stable release (2.18).

### Miscellaneous Improvements

2.17.1 also introduces a number of general improvements; these features are now available on [bmo](https://bugzilla.mozilla.org/).

*   [Autolinkification Page](https://bugzilla.mozilla.org/page.cgi?id=linkify.html) - It's now possible to apply Bugzilla's comment hyperlinking algorithm to any text you like. This should be useful for status updates and other web pages which give lists of bugs. The bug links created include the subject, status and resolution of the bug as a tooltip.
*   There are more <link> tags on the links toolbar for navigating quickly between different areas
*   Buglists are now available as comma-separated value files (CSV) (link at the bottom)
*   Keywords and dependencies can now be entered during initial bug entry
*   The performance of some queries and CGIs has been improved; unfortunately, some have also gotten worse; "hey, that's life."

## Trunk Checkins Since the Last Status Update

The following is a list of specific bugs fixed (and their checkin messages) since the last Bugzilla status report. It is ordered by the checkin date, as ordered by [Bonsai](http://bonsai.mozilla.org/). It includes checkins on the **trunk** from **09/22/2002** to **11/17/2002**. This list was generated by filtering Bonsai's output on [that query](http://bonsai.mozilla.org/cvsquery.cgi?treeid=default&module=Bugzilla&branch=HEAD&branchtype=match&dir=&file=&filetype=match&who=&whotype=match&sortby=Date&hours=2&date=explicit&mindate=9%2F22%2F2002+12%3A00%3A00&maxdate=11%2F17%2F2002+00%3A00%3A00&cvsroot=%2Fcvsroot).

Bold italic bugs are security-sensitive bugs.

Checkins made without reference to any specific bugs:

*   Various build bustage fixes (Myk and JayPee)
*   (11/4/2002) Some installation documentation updates (mbarnson)

Checkin manifest:

*   Bug [179886](https://bugzilla.mozilla.org/show_bug.cgi?id=179886 "request.cgi should not |use diagnostics;|") - request.cgi should not |use diagnostics|
*   Bug [179264](https://bugzilla.mozilla.org/show_bug.cgi?id=179264 "csv output for the buglist (see url inside) is invalid (too many "s)") - only quote non-numeric CSV values.
*   Bug [100639](https://bugzilla.mozilla.org/show_bug.cgi?id=100639 "make resolution more visible on mostfreq list") - make resolution more visible on mostfreq list.
*   Bug [180232](https://bugzilla.mozilla.org/show_bug.cgi?id=180232 "remove unnecessary border/margin on xul duplicates tree"): removes unnecessary margins/borders around XUL duplicates report
*   Bug [179462](https://bugzilla.mozilla.org/show_bug.cgi?id=179462 "Clarify description for enablequips param") - Clarify description for enablequips param.
*   Bug [179697](https://bugzilla.mozilla.org/show_bug.cgi?id=179697 "OR terms need extra level of bracketing") - OR terms need extra level of bracketing
*   Bug [178043](https://bugzilla.mozilla.org/show_bug.cgi?id=178043 "In graphical reports, provide mechanism for user to tweak presentation of report") - Make it possible to have vertical x-axis labels.
*   Bug [179706](https://bugzilla.mozilla.org/show_bug.cgi?id=179706 "activity log needs to include full account names for requestees") activity log needs to include full account names for requestees
*   Bug [179302](https://bugzilla.mozilla.org/show_bug.cgi?id=179302 "'anyexact' isn't an option for boolean charts") - 'anyexact' isn't an option for boolean charts
*   _**Bug [179491](https://bugzilla.mozilla.org/show_bug.cgi?id=179491 "Searchs of attachments containing a string do not enforce attchment privacy") Searchs of attachments containing a string do not enforce attchment privacy**_
*   Second installment of Bug [179260](https://bugzilla.mozilla.org/show_bug.cgi?id=179260 "Unknown table 'map_assigned_to' in order clause at globals.pl line 242") Unknown table 'map_assigned_to' in order clause at globals.pl line 242
*   Bug [179360](https://bugzilla.mozilla.org/show_bug.cgi?id=179360 "request.cgi: "Filter the Queue" should come before "Request Queue""): puts the filters at the top of the request queue and eliminates that empty table that sometimes is at the top of the queue.
*   Bug [179334](https://bugzilla.mozilla.org/show_bug.cgi?id=179334 "removing + from a flag doesn't clear setter"): updates the setter consistently. also fixes numerous other bugs in the RT code.
*   Bug [179260](https://bugzilla.mozilla.org/show_bug.cgi?id=179260 "Unknown table 'map_assigned_to' in order clause at globals.pl line 242") Unknown table 'map_assigned_to' in order clause at globals.pl line 242
*   Bug [179290](https://bugzilla.mozilla.org/show_bug.cgi?id=179290 "login cookie email needs to be escaped") - login cookie email needs to be escaped
*   Bug [179380](https://bugzilla.mozilla.org/show_bug.cgi?id=179380 "If 'enablequips' is off, quips.cgi shouldn't work"): if "enablequips" is off, quips.cgi now presents a message that the quips are disabled instead of letting you view or add quips.
*   Bug [179396](https://bugzilla.mozilla.org/show_bug.cgi?id=179396 "Test Bugzilla::Util") (add [007](https://bugzilla.mozilla.org/show_bug.cgi?id=007)util.t in order to test Bugzilla::Util).
*   Bug [178984](https://bugzilla.mozilla.org/show_bug.cgi?id=178984 "flag requestee field should be disabled unless flag is requested"): disables flag requestee field using JavaScript unless flag is set to "requested".
*   Bug [170464](https://bugzilla.mozilla.org/show_bug.cgi?id=170464 "OS/2 disappeared from 'Operating System' list") - OS/2 disappeared from 'Operating System' list. This allows selection of any OS, if the submitter is running it, on this form.
*   Bug [178178](https://bugzilla.mozilla.org/show_bug.cgi?id=178178 "Sidebar name should not be hardcoded to "Bugzilla"") Sidebar name should not be hardcoded to "Bugzilla"
*   Bug [173689](https://bugzilla.mozilla.org/show_bug.cgi?id=173689 "Default comments search box type to "contains string"") - Default comments search box type to "contains string".
*   Bug [179321](https://bugzilla.mozilla.org/show_bug.cgi?id=179321 "cannot clear status whiteboard entirely") - cannot clear status whiteboard entirely
*   Bug [179264](https://bugzilla.mozilla.org/show_bug.cgi?id=179264 "csv output for the buglist (see url inside) is invalid (too many "s)") csv output for the buglist (see url inside) is invalid (too many "s)
*   **_Bug [179329](https://bugzilla.mozilla.org/show_bug.cgi?id=179329 "HTML-unsafe characters need to be escaped in quips"): filters HTML out of quips on "show all quips" page_**
*   Adding runtests.pl for bug [143155](https://bugzilla.mozilla.org/show_bug.cgi?id=143155 "Make runtests.sh be a .pl"). runtests.sh will remain for a little while in order to allow tinderboxen to transition and any documents to be updated.
*   Bug [179238](https://bugzilla.mozilla.org/show_bug.cgi?id=179238 "Searching by commenter (longdesc) is ignored if you do "exact" or "contains"") - searching by commenter is ignored if you do 'exact' or 'contains'
*   Bug [176599](https://bugzilla.mozilla.org/show_bug.cgi?id=176599 "Improve performance of duplicates.cgi"), Improve performance of duplicates.cgi
*   Bug [179242](https://bugzilla.mozilla.org/show_bug.cgi?id=179242 "Searching for comment contains string + email gives "Not unique table/alias: 'longdescs_' at globals.pl line 242"") Part 2 - Handle both conditions for the if block
*   Bug [178383](https://bugzilla.mozilla.org/show_bug.cgi?id=178383 "product/component query conditions appear twice") - product/component query conditions appear twice
*   Bug [179193](https://bugzilla.mozilla.org/show_bug.cgi?id=179193 "anyexact should use IN, not OR") - anyexact should use IN, not OR
*   Bug [179184](https://bugzilla.mozilla.org/show_bug.cgi?id=179184 "regetlastlist returns all bugs") - regetlastlist returns all bugs
*   Bug [179203](https://bugzilla.mozilla.org/show_bug.cgi?id=179203 ""Preset Queries" text does not appear in footer if last named query is not in footer") - "Preset Queries" text does not appear in footer if last named query is not in footer
*   Bug [179188](https://bugzilla.mozilla.org/show_bug.cgi?id=179188 "New flag system doesn't tell you what the flag was set on in bugmail") - The new flag system wasn't indicating which attachment a flag was changed on. This patch inserts the attachment ID any time it exists in the activity log (to match what show_activity does).
*   Bug [179225](https://bugzilla.mozilla.org/show_bug.cgi?id=179225 "Missing space.   "Reassign bug to ownerand QA contact of selected component "") Missing space. "Reassign bug to ownerand QA contact of selected component "
*   Bug [179242](https://bugzilla.mozilla.org/show_bug.cgi?id=179242 "Searching for comment contains string + email gives "Not unique table/alias: 'longdescs_' at globals.pl line 242"") Searching for comment contains string + email gives "Not unique table/alias: 'longdescs_' at globals.pl line 242"
*   Bug [179207](https://bugzilla.mozilla.org/show_bug.cgi?id=179207 "Blessing doesn't work right") Blessing doesn't work right
*   bug [179205](https://bugzilla.mozilla.org/show_bug.cgi?id=179205 "flag options incorrect"): Makes flag options be correct in all situations.
*   Bug [179177](https://bugzilla.mozilla.org/show_bug.cgi?id=179177 "keywords and dependencies tables aren't locked when creating bug"): avoid database errors when inserting bug by locking all tables i need to access
*   Bug [178189](https://bugzilla.mozilla.org/show_bug.cgi?id=178189 "|nsCOMPtr|: do we still care about VC++4.2?  and if not, can we remove this comment") - when filing a new bug, the generated bugmail doesn't include product/component
*   Bug [179174](https://bugzilla.mozilla.org/show_bug.cgi?id=179174 "Need to fix use of $| (for buffering)") - renable $| = 1
*   Bug [114696](https://bugzilla.mozilla.org/show_bug.cgi?id=114696 "Permission checking in queries not optimal") - permission checking in queries not optimal
*   Bug [171505](https://bugzilla.mozilla.org/show_bug.cgi?id=171505 "Disabled flags should still be visible in the UI"): shows disabled flags in the UI
*   Bug [114696](https://bugzilla.mozilla.org/show_bug.cgi?id=114696 "Permission checking in queries not optimal") - permission checking in queries not optimal
*   **_Bug [178841](https://bugzilla.mozilla.org/show_bug.cgi?id=178841 "file name field must *not* include full windows paths"): removes full paths from filenames in attachments table and prevents them from appearing again_**
*   Bug [92253](https://bugzilla.mozilla.org/show_bug.cgi?id=92253 "Boolean chart makes very wide web pages from query.cgi") - Boolean chart makes very wide web pages from query.cgi.
*   Bug [164003](https://bugzilla.mozilla.org/show_bug.cgi?id=164003 "Button "Add another boolean chart" appears twice after clicking "And"") - Button "Add another boolean chart" appears twice after clicking "And".
*   Bug [71794](https://bugzilla.mozilla.org/show_bug.cgi?id=71794 "processmail shouldn't bother checking dependencies unless state changes.") - processmail shouldn't bother checking dependencies unless state changes.
*   Bug [171480](https://bugzilla.mozilla.org/show_bug.cgi?id=171480 "Request queue output for non requestee-specific request is ugly"): make output for non requestee-specific requests look better in the request queue.
*   Bug [178776](https://bugzilla.mozilla.org/show_bug.cgi?id=178776 "warning in duplicates report"): Eliminates warning in duplicates.cgi.
*   Bug [172518](https://bugzilla.mozilla.org/show_bug.cgi?id=172518 "make request tracker use generic user matching code"): makes the request tracker use the generic user matching code
*   Bug [178772](https://bugzilla.mozilla.org/show_bug.cgi?id=178772 "doeditparams.cgi failed with malformed headers") doeditparams.cgi failed with malformed headers
*   Bug [178800](https://bugzilla.mozilla.org/show_bug.cgi?id=178800 "Graphical Charts fail with taint error with perl 5.6.0"): fixes taint failure in graphical charts with Perl 5.6.0
*   Bug [178801](https://bugzilla.mozilla.org/show_bug.cgi?id=178801 "missing &:: in Search.pm"): Missing &:: caused function call to fail, resulting in server error.
*   Bug [178794](https://bugzilla.mozilla.org/show_bug.cgi?id=178794 "Request Queue has Internal Server Error if accessed when not logged in") Request Queue has Internal Server Error if accessed when not logged in
*   Bug [174731](https://bugzilla.mozilla.org/show_bug.cgi?id=174731 "Spurious flags are set by default"): no longer represents spurious flags as being set by default.
*   Bug [171475](https://bugzilla.mozilla.org/show_bug.cgi?id=171475 "Flag UI is confusing"): make new flags include all categories (product/component combinations) by default.
*   Added information about versioncache back in. See bug [140332](https://bugzilla.mozilla.org/show_bug.cgi?id=140332 "versioncache needs to be deleted on bug status changes")
*   Added blurb about movebugs. At this point, only bmo uses it, so I'm calling it an "undocumented feature". See bug [127818](https://bugzilla.mozilla.org/show_bug.cgi?id=127818 "Lack of documentation for moving bugs between BZ-Installations")
*   Modified text for cookiepath line for clarity. See bug [162359](https://bugzilla.mozilla.org/show_bug.cgi?id=162359 "Change wording on the cookiepath parameter")
*   Included note regarding the origin of "bonsaitools", per bug [174922](https://bugzilla.mozilla.org/show_bug.cgi?id=174922 "Bugzilla documentation is too vague about "bonsaitools"").
*   Added section for Bugzilla and mod_perl (future expansion). Right now, it just says "Bugzilla doesn't work under mod_perl". See bug [149883](https://bugzilla.mozilla.org/show_bug.cgi?id=149883 "Document Bugzilla doesn't work under mod_perl.")
*   A rather controversial new entry to the FAQ. See bug [107917](https://bugzilla.mozilla.org/show_bug.cgi?id=107917 "Template Style"). I decided one way for the Guide, based upon the code I see currently checked in. If I'm wrong, feel free to correct it!
*   Fix for Apache configuration directives from bug [174255](https://bugzilla.mozilla.org/show_bug.cgi?id=174255 "Typo & omission in Install Guide's Apache directives") and de-stupidifying of emacs destruction of <programlisting> tags.
*   Removed links to dbschema.jpg image. See bug [173484](https://bugzilla.mozilla.org/show_bug.cgi?id=173484 "dbschema.jpg file is out of date"), it was really outdated and redundant anyway.
*   Removing these images, since they are too outdated to be useful, and they are basically redundant anyway. See bug [173484](https://bugzilla.mozilla.org/show_bug.cgi?id=173484 "dbschema.jpg file is out of date")
*   Added notes on using OpenLDAP; We should probably look at code changes to make Net::LDAP our permanent LDAP plugin rather than Mozilla::LDAP...See bug [167379](https://bugzilla.mozilla.org/show_bug.cgi?id=167379 "LDAP docs").
*   Bug [156548](https://bugzilla.mozilla.org/show_bug.cgi?id=156548 "XUL version of duplicates report"): XUL implementation of duplicates report.
*   Bug [173571](https://bugzilla.mozilla.org/show_bug.cgi?id=173571 "Turn "all selected" into "none selected" for efficiency") - Turn "all selected" into "none selected" for efficiency.
*   Bug [177436](https://bugzilla.mozilla.org/show_bug.cgi?id=177436 "User matching shouldn't be case-sensitive") User matching shouldn't be case-sensitive
*   Bug [62729](https://bugzilla.mozilla.org/show_bug.cgi?id=62729 "Real name capability on bug_list.cgi."), "Add real name capability to bug_list.cgi".
*   Bug [178019](https://bugzilla.mozilla.org/show_bug.cgi?id=178019 "reports.cgi should use the shadowdb") - reports.cgi should use the shadowdb.
*   Bug [176509](https://bugzilla.mozilla.org/show_bug.cgi?id=176509 ""This bug is not in your list" appears in error."): "(this bug is not in your list)" no longer appears in the navigation bar when you aren't viewing a bug.
*   Bug [127200](https://bugzilla.mozilla.org/show_bug.cgi?id=127200 "Query for CC/longdesc/OR takes long time") Query for CC/longdesc/OR takes long time
*   Bug [177430](https://bugzilla.mozilla.org/show_bug.cgi?id=177430 "buglist.cgi needs a CSV output format") - buglist.cgi needs a CSV output format.
*   Bug [177435](https://bugzilla.mozilla.org/show_bug.cgi?id=177435 "exact match on assignee fails with user matching") exact match on assignee fails with user matching
*   Bug [177624](https://bugzilla.mozilla.org/show_bug.cgi?id=177624 "Wildcard rejects --do_not_change-- in mass-change") Wildcard rejects --do_not_change-- in mass-change
*   Bug [95430](https://bugzilla.mozilla.org/show_bug.cgi?id=95430 "Reopening en masse fails.") Reopening en masse fails.
*   Bug [177099](https://bugzilla.mozilla.org/show_bug.cgi?id=177099 "Stored queries ordering and editing broken after moving to CGI.pm"): stored queries ordering and editing were broken after moving to CGI.pm. They work again now.
*   Bug [175838](https://bugzilla.mozilla.org/show_bug.cgi?id=175838 "Reopening a bug does not clear resolution, nor does selecting 'clear resolution'") Reopening a bug does not clear resolution, nor does selecting 'clear resolution'
*   Bug [177351](https://bugzilla.mozilla.org/show_bug.cgi?id=177351 "checksetup.pl tells about deleting templates in silent-running mode") - checksetup.pl tells about deleting templates in silent-running mode.
*   Bug [176953](https://bugzilla.mozilla.org/show_bug.cgi?id=176953 "version not set properly from form value like others") - version not set properly from form value like others in enter_bug.cgi.
*   Bug [168191](https://bugzilla.mozilla.org/show_bug.cgi?id=168191 "Checksetup needs to force template recompilation") - Checksetup needs to force template recompilation.
*   Bug [173005](https://bugzilla.mozilla.org/show_bug.cgi?id=173005 "Add bar charts, pie charts etc. to reporting") - Add bar charts, pie charts etc. to reporting.
*   Bug [176936](https://bugzilla.mozilla.org/show_bug.cgi?id=176936 "minor consistency changes for editproducts and editflags") minor consistency changes for editproducts and editflags
*   Bug [147833](https://bugzilla.mozilla.org/show_bug.cgi?id=147833 "Start using CGI.pm") - start using CGI.pm
*   Bug [171278](https://bugzilla.mozilla.org/show_bug.cgi?id=171278 "Component/Product IDs mean you can't do change queries on component/product") - component/product ids mean that you can't do change queries oncomponent/product
*   Bug [162990](https://bugzilla.mozilla.org/show_bug.cgi?id=162990 "Shorthand/wildcard entry for login names in assign, cc, qa, fields")Adding missing new file
*   Bug [162990](https://bugzilla.mozilla.org/show_bug.cgi?id=162990 "Shorthand/wildcard entry for login names in assign, cc, qa, fields") Shorthand/wildcard entry for login names in assign, cc, qa, fields
*   Bug [172874](https://bugzilla.mozilla.org/show_bug.cgi?id=172874 "cvs remove attachstatus templates") - cvs remove old editattachstatus templates, take 2\. All tests still pass.
*   Bug [171770](https://bugzilla.mozilla.org/show_bug.cgi?id=171770 "Check in Bugzilla Helper") - check in Bugzilla Helper.
*   Bug [175625](https://bugzilla.mozilla.org/show_bug.cgi?id=175625 "Timetracking columns are computed even if not displayed") Timetracking columns are computed even if not displayed
*   Bug [172875](https://bugzilla.mozilla.org/show_bug.cgi?id=172875 "Fix site-navigation.html.tmpl to link to flags CGI and not attachments one") - Fix site-navigation.html.tmpl to link to flags CGI and not attachments one.
*   Bug [173495](https://bugzilla.mozilla.org/show_bug.cgi?id=173495 "require perl 5.6") - require perl 5.6
*   Bug [112373](https://bugzilla.mozilla.org/show_bug.cgi?id=112373 "you should be able to enter bug dependencies/blockers when you enter a bug.") you should be able to enter bug dependencies/blockers when you enter a bug.
*   Bug [174221](https://bugzilla.mozilla.org/show_bug.cgi?id=174221 "field names should be l10n in user-errors.html.tmpl called by Add Estimated, Actual, Remaining Time Fields") - field names should be l10n in user-errors.html.tmpl.
*   Bug [172959](https://bugzilla.mozilla.org/show_bug.cgi?id=172959 "Remove old reporting (most doomed etc.)") - Remove old reporting (most doomed etc.).
*   Bug [174524](https://bugzilla.mozilla.org/show_bug.cgi?id=174524 "Tidy up Bugzilla::{Util,Config}, and lazily-load unneeded modules") - Tidy up Bugzilla::{Util,Config}, and lazily-load unneeded modules
*   Bug [174464](https://bugzilla.mozilla.org/show_bug.cgi?id=174464 "buglist code for empty query shouldn't set headers_done") - buglist code for empty query shouldn't set headers_done
*   Bug [24789](https://bugzilla.mozilla.org/show_bug.cgi?id=24789 "[E|A|R] Add Estimated, Actual, Remaining Time Fields") [E|A|R] Add Estimated, Actual, Remaining Time Fields
*   Bug [174112](https://bugzilla.mozilla.org/show_bug.cgi?id=174112 "Edit multiple bugs broken") Edit multiple bugs broken
*   Bug [173808](https://bugzilla.mozilla.org/show_bug.cgi?id=173808 "Use of uninitialized value in subtraction (-) at duplicates.cgi line 133") - Use of uninitialized value in subtraction (-) at duplicates.cgi line 133\.
*   Bug [173719](https://bugzilla.mozilla.org/show_bug.cgi?id=173719 "warnings in report.cgi") - warnings in report.cgi.
*   Bug [170903](https://bugzilla.mozilla.org/show_bug.cgi?id=170903 "Remove hard-coded titles and things") - review markup I missed.
*   Bug [170903](https://bugzilla.mozilla.org/show_bug.cgi?id=170903 "Remove hard-coded titles and things") - Remove hard-coded titles and things.
*   Bug [173581](https://bugzilla.mozilla.org/show_bug.cgi?id=173581 "Changing milestone sortkeys is broken") - Changing milestone sortkeys is broken.
*   Bug [173249](https://bugzilla.mozilla.org/show_bug.cgi?id=173249 "user-error.html.tmpl: Bogus title, inconsistent indenting") - user-error.html.tmpl: Bogus title, inconsistent indenting.
*   Bug [171437](https://bugzilla.mozilla.org/show_bug.cgi?id=171437 "Enhancements to generic reporting") - Enhancements to generic reporting. Reporting menu, 3D tables, rearranged UI, better API for new report types.
*   Bug [173027](https://bugzilla.mozilla.org/show_bug.cgi?id=173027 "code-error.html.tmpl misses a </em>") - code-error.html.tmpl misses a </em>.
*   Bug [172740](https://bugzilla.mozilla.org/show_bug.cgi?id=172740 ""use of uninitialized variable" warnings") - "use of uninitialized variable" warnings.
*   Bug [163114](https://bugzilla.mozilla.org/show_bug.cgi?id=163114 "Templatise all calls to DisplayError") - Templatise all calls to DisplayError.
*   Bug [93667](https://bugzilla.mozilla.org/show_bug.cgi?id=93667 "Sanity check cleanup."): Minor style fix, uninit var fix, add explanatory comments to CrossCheck/DoubleCrossCheck.
*   Bug [93667](https://bugzilla.mozilla.org/show_bug.cgi?id=93667 "Sanity check cleanup."): More movement, commenting, and remove an unused variable.
*   Bug [93667](https://bugzilla.mozilla.org/show_bug.cgi?id=93667 "Sanity check cleanup."): Move some code around, add some section heading comments.
*   Bug [93667](https://bugzilla.mozilla.org/show_bug.cgi?id=93667 "Sanity check cleanup."): Rewrite double cross checking.
*   Bug [93667](https://bugzilla.mozilla.org/show_bug.cgi?id=93667 "Sanity check cleanup."): Rewrite single cross checking.
*   Bug [93667](https://bugzilla.mozilla.org/show_bug.cgi?id=93667 "Sanity check cleanup."): General bug check refactoring.
*   Bug [155389](https://bugzilla.mozilla.org/show_bug.cgi?id=155389 "More <link> elements & templatization of navigation_links") - More <link> elements & templatization of navigation_links. Fix small regression where I accidentally damaged the user.login field.
*   Bug [155389](https://bugzilla.mozilla.org/show_bug.cgi?id=155389 "More <link> elements & templatization of navigation_links") - More <link> elements & templatization of navigation_links.
*   Bug [20122](https://bugzilla.mozilla.org/show_bug.cgi?id=20122 "Bugzilla requires new login if IP changes") - Bugzilla requires new login if IP changes
*   Bug [172045](https://bugzilla.mozilla.org/show_bug.cgi?id=172045 "can't see restricted bugs if cc set") can't see restricted bugs if cc set
*   Bug [172010](https://bugzilla.mozilla.org/show_bug.cgi?id=172010 "voting broken on tip") voting broken on tipRegression from [43600](https://bugzilla.mozilla.org/show_bug.cgi?id=43600) and [157756](https://bugzilla.mozilla.org/show_bug.cgi?id=157756)
*   Bug [163114](https://bugzilla.mozilla.org/show_bug.cgi?id=163114 "Templatise all calls to DisplayError") - Templatise all calls to DisplayError.
*   Bug [170903](https://bugzilla.mozilla.org/show_bug.cgi?id=170903 "Remove hard-coded titles and things") - Remove hard-coded titles and things.
*   Bug [171639](https://bugzilla.mozilla.org/show_bug.cgi?id=171639 "dupes not marked in original bug") dupes not marked in original bug
*   Bug [164038](https://bugzilla.mozilla.org/show_bug.cgi?id=164038 "token.cgi: Cancel token messages should be moved into the templates") - token.cgi: Cancel token messages should be moved into the templates.
*   Bug [169819](https://bugzilla.mozilla.org/show_bug.cgi?id=169819 "remove  "This is Bugzilla: the Mozilla bug system. For more information..." from footer.html.tmpl") - remove 'this is bugzilla...' text from footer
*   Bug [170073](https://bugzilla.mozilla.org/show_bug.cgi?id=170073 "Running checksetup without File::Temp installed results in error."): checksetup.pl (indirectly via Bugzilla::Config.pm) had a dependency on File::Temp, which caused it to crash before the version checks were even done to warn the admin that it wasn't present. This patch reorders the loading sequence in checksetup.pl so that the version checks are done before the Config module is loaded.
*   Bug [171506](https://bugzilla.mozilla.org/show_bug.cgi?id=171506 "Sanitycheck broken"): Fixes bustage in sanitycheck.cgi by making it check for correct product IDs in the flaginclusions and flagexclusionstables instead of the flagtypes table, which no longer has a product_id field.
*   Bug [171420](https://bugzilla.mozilla.org/show_bug.cgi?id=171420 "faulty use of local variables in Flag.pm"): fixes usage of $template, $vars, and &Param in Flag.pm.
*   Bug [171322](https://bugzilla.mozilla.org/show_bug.cgi?id=171322 "process_bug.cgi makes reference to non-existant product variable") process_bug.cgi makes reference to non-existant product variable
*   Bug [171440](https://bugzilla.mozilla.org/show_bug.cgi?id=171440 "editgroups shows system groups as usable for bugs even though they are not") editgroups shows system groups as usable for bugs even though they are not
*   Bug [163114](https://bugzilla.mozilla.org/show_bug.cgi?id=163114 "Templatise all calls to DisplayError") - Templatise all calls to DisplayError.
*   Bug [98801](https://bugzilla.mozilla.org/show_bug.cgi?id=98801 "request tracker"): Implementation of the request tracker, a set of enhancements to attachment statuses.
*   Bug [171296](https://bugzilla.mozilla.org/show_bug.cgi?id=171296 "Content-Disposition: attachment brings up Downloading dialog"): changing Content-disposition header in attachment.cgi to use 'inline' instead of 'attachment' so that itdoesn't *force* you to download it.
*   Bug [170213](https://bugzilla.mozilla.org/show_bug.cgi?id=170213 "Make all static HTML files into page.cgi.pages") - CVS remove old and obsolete HTML files.
*   Bug [170195](https://bugzilla.mozilla.org/show_bug.cgi?id=170195 "Regression - buglist highlighting broken") Regression - buglist highlighting broken
*   Bug [170822](https://bugzilla.mozilla.org/show_bug.cgi?id=170822 "Linkification process destroys whitespace") - Linkification process destroys whitespace.
*   Bug [170986](https://bugzilla.mozilla.org/show_bug.cgi?id=170986 "General Summary reports don't work for me with taint checking") - General Summary reports don't work with taint checking. Also fixes Throw*Error's $extra_vars parameter.
*   Bug [170843](https://bugzilla.mozilla.org/show_bug.cgi?id=170843 "cvs remove changepassword.cgi") - cvs remove obsolete file, changepassword.cgi.
*   Bug [12282](https://bugzilla.mozilla.org/show_bug.cgi?id=12282 "General summary reports.") - General summary reports.
*   Bug [169197](https://bugzilla.mozilla.org/show_bug.cgi?id=169197 "Bugzilla RDF format has errors and deprecated style"): Explicitly identifies RDF 'about' and 'resource' tags as being in the RDF namespace to update deprecated syntax and get some RDF parsers to stopgenerating warnings.
*   Bug [170064](https://bugzilla.mozilla.org/show_bug.cgi?id=170064 "Change error API again") - Change error API again to allow vars to be passed in the call.
*   Bug [170075](https://bugzilla.mozilla.org/show_bug.cgi?id=170075 "Mid-air collision pages should be titled as such") - Mid-air collision pages should be titled as such.

## 2.16-Branch Checkins Since the Last Status Update

None.

## 2.14-Branch Checkins Since the Last Status Update

None.

The Bugzilla team will stop officially supporting the 2.14 branch after December, 2002\. All 2.14 users are strongly encouraged to upgrade to the 2.16 branch to pick up new features, such as template support, request tracking, and improved attachment handling, among tons of other goodies.

