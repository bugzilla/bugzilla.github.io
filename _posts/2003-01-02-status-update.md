---
title: "Bugzilla Status Update"
date: 2003-01-02
author: ["preed"]
categories:
- Status
---

## Introduction

The Bugzilla Team is pleased to announce the release of three versions of Bugzilla today: 2.14.5, 2.16.2, and 2.17.3:

*   2.14.5 is a maintenance release on the [2.14 branch](#cvs2_14-BRANCH); it contains a couple of security-related bug fixes.  
    **Note:** this is **the last 2.14.x release**, as the Bugzilla Team has officially stopped supporting the 2.14 branch.  

*   2.16.2 is a maintenance release on the [2.16 branch](#cvs2_16-BRANCH), containing a couple of security-related bug fixes.  
    It is recommended that **all production installations upgrade** to 2.16.2 to make sure they get the fixes for these [security bugs](/security/2.16.1/).  

*   2.17.3 is the latest developers' snapshot release from [the trunk](#cvsHEAD); it contains the above security bug fixes as well as tweaks to [features in 2.17.1](2002-11-18.html#newfeatures) (bug and attachment flags, enterprise groups, etc.). This release is a **developers' release** and is not generally intended for production use.

The security bug fixes on the 2.14.x and 2.16.x branches and the trunk all address the same security bugs. These bugs address cross site scripting vulnerabilities (which the Bugzilla Team [already released an announcement](https://groups.google.com/groups?selm=a05200f02ba09808addb5%40%5B192.168.1.203%5D&output=gplain) about), and sensitive directory and file permissions. In all cases, local server compromises aren't possible, but unrestricted Bugzilla database access is _possible_.

Unfortunately, none of these release address [the Win32 situation](2002-11-18.html#win32) which is still unchanged.

## What Happened to 2.17.2?!

Bugzilla project observers may note that we're releasing a 2.17.3 developers' release without having released a 2.17.2 version.

This was due to an overzealous Bugzilla developer (JayPee) who tagged the 2.17.2 release in CVS before it was quite ready to be released. Because of the holiday season and a couple of other bugs that were found, the Team decided to hold the release of 2.17.2 until _after_ the holidays.

But, some astute users noticed the new, incorrect tag and had already started to pull it from CVS. Therefore, to minimize confusion, and signify that other patches had been checked into the tree after what had been dubbed "2.17.2" was tagged, the Team decided to bump the version number to 2.17.3.

Developers (and anyone else) do not want the 2.17.2 "release"; they want 2.17.3.

## Check-in Policy Update

As Bugzilla project lead Dave Miller announced in the last status report, the Bugzilla project has changed its policies regarding check-ins. The new policy institutes an "approval" process for check-ins and comes as an addition to our existing review policy.

Previously, to check something into Bugzilla's CVS tree, developers were only required to get the approval of one or two people on the review team. That process is now augmented by a requirement of obtaining approval on the patch from the project lead or a designee before it can be checked in. Current "designees," if there are any, are noted in the [#mozwebtools topic](/discussion.html). This won't amount to a code review, but rather a 'yes' or 'no' on whether this feature or bugfix in this form at this time is the best course of action to fulfill Bugzilla's design goals. Approvals are also being used to coordinate landing patches, so the approval flag generally won't be set until there's a patch ready to land. If you want to know if a patch you're working on will likely be given approval for check-in before you expend effort on it, you can ask on the [developers@bugzilla.org](mailto:developers@bugzilla.org) mailing list.

Bugzilla developers and reviewers are adjusting to this new policy well, and it's seemingly serving the Bugzilla project well. The quick release of another 2.17 developers' snapshot, a mere six weeks after 2.17.1, provides good evidence of this.

## Upcoming Major Features

The following is a list of major new features the Bugzilla Team is currently working on. You can find more information, including implementation/design discussions, proposed landing dates, and status in the bug reports below. These are also features that the Bugzilla Team would appreciate help on, so if one of the features below interests you, feel free to jump into the fray!

*   Ability to send email via SMTP instead of relying on a local installation of sendmail. (Bug [84876](https://bugzilla.mozilla.org/show_bug.cgi?id=84876))
*   PostgreSQL support. (Bug [98304](https://bugzilla.mozilla.org/show_bug.cgi?id=98304 "Allow Bugzilla to work with Postgres SQL (PgSQL)"))
*   Sybase support. (Bug [173130](https://bugzilla.mozilla.org/show_bug.cgi?id=173130 "support Sybase"))
*   Ability to add generic customized fields to bugs (Bug [91037](https://bugzilla.mozilla.org/show_bug.cgi?id=91037 "a generic implementation for custom fields"))
*   Customized resolutions, that allow adding, removing, deactivating and renaming of resolutions. (Bug [94534](https://bugzilla.mozilla.org/show_bug.cgi?id=94534 "Customised resolutions."))
*   Expanding the e-mail preferences to allow watching components, keywords, etc. (Bug [73665](https://bugzilla.mozilla.org/show_bug.cgi?id=73665 "Need an "emailprefs" table"))
*   `mod_perl` support. (Bug [87406](https://bugzilla.mozilla.org/show_bug.cgi?id=87406 "Make Bugzilla work with mod_perl (under Apache)"))
*   New makefile-based installation system ([Bug 104660](https://bugzilla.mozilla.org/show_bug.cgi?id=104660), [Bug 105854](https://bugzilla.mozilla.org/show_bug.cgi?id=105854), [Bug 105855](https://bugzilla.mozilla.org/show_bug.cgi?id=105855), and [Bug 105856](https://bugzilla.mozilla.org/show_bug.cgi?id=105856))
*   Generic charting. Allows users to define arbitrary data sets for which historical data will be recorded, and then plot those data sets. Bug [16009](https://bugzilla.mozilla.org/show_bug.cgi?id=16009).

<a name="newfeatures"></a>

## New Bugzilla Features

### Re-architected Product Groups

[Bug 147275](https://bugzilla.mozilla.org/show_bug.cgi?id=147275), re-architected product groups, has finally landed. In the 2.17.3 release, the entire mechanism for handling groups has been revised.

It is now possible to exert much more control over how groups and products are related. In editproducts.cgi, there is now a mechanism to permit you to edit the "Group Controls" for a product and determine which groups are applicable, default, and mandatory for each product as well as controlling entry for each product and being able to set bugs in a product to be totally read-only unless some group restrictions are met.

The patch author, [Joel Peshkin](mailto:bugreport@peshkin.net), has noted that all of the possible scenarios have not been anticipated and this is a new feature, so please Cc him on all bugs you file against re-architected product groups.

Some examples of advanced uses for the re-architected product groups follow:

*   **Example**: When several products need to be associated with the same default group (formerly a product group), instead of defining several groups with the same names as the products and managing memberships in each group, a single group can be defined to control access and that group can be set as a "Default" group for all of the products.
*   **Example**: If certain products are never supposed to have a publicly accessible bug, define a group of all authorized users and set the groups control for those products to indicate that the group is Mandatory/Mandatory. This will place bugs in that group without giving the user any option at all.
*   **Example**: Anyone can enter a security bug. Create a product for security bugs. Do not restrict entry to the product at all. However, set the Member/Nonmember permissions to Default/Mandatory for the security group. This will permit anyone to enter and members of the security group will be able to override the default group restriction while nonmembers will be forced to restrict the bug to the security group.

### Replication/shadowdb removal

The shadowdb was a readonly copy of Bugzilla's database, which Bugzilla used for potentially expensive readonly queries, such as from buglist.cgi. Due to MySQL's table-level locking mechanism, long running queries block modifications and updates to the database; the shadowdb attempted to alleviate this bottleneck by creating a second database for these long running queries to use.

Previously, Bugzilla handled updates from the main database to the copy on its own by keeping track of every SQL update. These updates were then sent to the shadow database via a separate process (`syncshadowdb`). This process had several bugs and was inefficient.

With the landing of bug [124589](https://bugzilla.mozilla.org/show_bug.cgi?id=124589), which added MySQL replication support to Bugzilla, and bug [180870](https://bugzilla.mozilla.org/show_bug.cgi?id=180870), which removed the old manual syncing code, Bugzilla 2.17.3 is now able to use the replication facilities provided by the database to handle these updates. The system is now given the locations of the two databases, but leaves updating them to an alternative process. This simplifies the Bugzilla code, and enables further optimizations which were not possible when Bugzilla needed to capture all of an SQL UPDATE/INSERT command.

### New "always-require-login" Parameter

This new parameter, added under bug [173761](https://bugzilla.mozilla.org/show_bug.cgi?id=173761), allows administrators running commercial or sensitive Bugzilla installations to require users to present login credentials to access Bugzilla.

Bugzilla is most commonly used for open source projects, where anyone should be able to search for and view certain types of bugs. But some entities need to restrict these operations to logged in users; this parameter allows administrators to require a login on every Bugzilla page, except for the front page. If users try to access any page without login credentials (in the form of a valid login cookie) and "always-require-login" is set, they will be prompted for the information before being allowed to continue.

### Attach and Reassign at Once

When developers attach patches or other attachments (testcases, etc.) to bugs, they will commonly reassign the bug to themselves shortly thereafter, since that developer is actively working on that bug. These used to be distinct steps, which generated two email messages and required Bugzilla users to attach their patch and then reassign the bug to themselves.

This patch, added as part of bug [116819](https://bugzilla.mozilla.org/show_bug.cgi?id=116819) allows developers to reassign the bug to themselves and set the status to accepted during the attachment creation process. This effectively makes the above process one atomic operation, reducing bug spam and streamlining a very common process.

<a name="cvsHEAD">

## Trunk Checkins Since the Last Status Update

</a>

The following is a list of specific bugs fixed (and their checkin messages) since the last Bugzilla status report. It is ordered by the checkin date, as ordered by [Bonsai](http://bonsai.mozilla.org/). It includes checkins on the **trunk** from **11/17/2002** to **01/02/2003**. This list was generated by filtering Bonsai's output on [that query](http://bonsai.mozilla.org/cvsquery.cgi?treeid=default&module=Bugzilla&branch=HEAD&branchtype=match&dir=&file=&filetype=match&who=&whotype=match&sortby=Date&hours=2&date=explicit&mindate=11%2F17%2F2002+00%3A00%3A00&maxdate=01%2F02%2F2003+00%3A00%3A00&cvsroot=%2Fcvsroot).

Bold italic bugs are security-sensitive bugs.

Checkins made without reference to any specific bugs:

*   (12/28/02) Release notes update (mattyt)
*   (12/21/02) Documentation rebuild (gerv)
*   (11/21/02) Post-2.17.1 release documentation corrections (justdave)

Checkin manifest:

*   Bug [186673](https://bugzilla.mozilla.org/show_bug.cgi?id=186673 "Red Hat Bugzilla section is out of date") - Updating section on Red Hat Bugzilla and adding last updated lines to each of the variants.
*   Bug [186962](https://bugzilla.mozilla.org/show_bug.cgi?id=186962 "Min versions in install docs incorrect") - Update minimum versions of required software and move those versions to be ENTITY's
*   Bug [180005](https://bugzilla.mozilla.org/show_bug.cgi?id=180005 "Updates to Bugzilla FAQ") - Bring the FAQ up to date.
*   Bug [178230](https://bugzilla.mozilla.org/show_bug.cgi?id=178230 "Update documentation for Enterprise Groups") - Update documentation for Entrprise Groups
*   Bug [183388](https://bugzilla.mozilla.org/show_bug.cgi?id=183388 "email not sent to new assignee or new qa contact when only "added/removed from capacity" selected") - processmail wasn't picking up on users being added to the owner or qa contact role and was dropping emails if the user had selected to only get mail on those events.
*   Bug [186594](https://bugzilla.mozilla.org/show_bug.cgi?id=186594 "Reference to ::db_sock is used in globals.pl without exporting this parameter in Config.pm") - $db_sock was not being exported from Bugzilla/Config.pm
*   Bug [186337](https://bugzilla.mozilla.org/show_bug.cgi?id=186337 "Param lookup should fallback to defaults") - Param lookup should fall back to defaults
*   _**Bug [186383](https://bugzilla.mozilla.org/show_bug.cgi?id=186383) - Checksetup leaves editor backups of localconfig accessible**_
*   Bug [180870](https://bugzilla.mozilla.org/show_bug.cgi?id=180870 "Remove old shadowdb manual replication code") - Remove old shadowdb manual replication code
*   Bug [173622](https://bugzilla.mozilla.org/show_bug.cgi?id=173622 "Move template handling code into a module") - Move template handling into a module.
*   Bug [185760](https://bugzilla.mozilla.org/show_bug.cgi?id=185760 "New group system doesn't upgrade transparently if usebuggroups = 0") - New group system doesn't upgrade transparently if usebuggroups = 0
*   Bug [186218](https://bugzilla.mozilla.org/show_bug.cgi?id=186218 "importxml.pl does a query against products using old schema") - importxml.pl was doing a query against the products table using the old schema
*   Bug [185944](https://bugzilla.mozilla.org/show_bug.cgi?id=185944 "radio buttons for groups all have the same name in change-multiple") - radio buttons for adding/removing groups on the change-multiple-bugs screen all had the same name
*   Bug [184949](https://bugzilla.mozilla.org/show_bug.cgi?id=184949 "CSV buglists are missing the Bug ID column") - CSV buglists are missing the Bug ID column.
*   Bug [185332](https://bugzilla.mozilla.org/show_bug.cgi?id=185332 "Rewrite the description for timezone param") - Rewrite the description for timezone param (typo fixes etc.)
*   Bug [158499](https://bugzilla.mozilla.org/show_bug.cgi?id=158499 "Templatise XML bug output") - Templatise XML bug output
*   Bug [116819](https://bugzilla.mozilla.org/show_bug.cgi?id=116819 "Attach and Reassign in one fell swoop") - Attach and Reassign in one fell swoop.
*   **_Bug [183188](https://bugzilla.mozilla.org/show_bug.cgi?id=183188) - collectstats.pl no longer makes data/mining world-readable_**
*   Bug [184256](https://bugzilla.mozilla.org/show_bug.cgi?id=184256 "Canedit group_control_map entry does not prevent making attachments") Canedit group_control_map entry does not prevent making attachments
*   Bug [184081](https://bugzilla.mozilla.org/show_bug.cgi?id=184081 "Change search interfaces to use Viewable products instead of enterable products") Change search interfaces to use Viewable products instead of enterable products
*   Bug [184336](https://bugzilla.mozilla.org/show_bug.cgi?id=184336 "default urlbase should point to something besides cvs-mirror") - default urlbase parameter on new installs now points at `http://you-havent-visited-editparams.cgi-yet/` to a) relieve cvs-mirror.mozilla.org of all the hits, and b) give people who receive those emails a hint what to do to fix it.
*   Bug [180955](https://bugzilla.mozilla.org/show_bug.cgi?id=180955 "Remove dual-license from test files") - Remove dual-license from test files
*   Bug [184365](https://bugzilla.mozilla.org/show_bug.cgi?id=184365 "Don't link to index.cgi in the site navigation toolbar") - link to urlbase instead of index.cgi from "Top" link in navigation toolbar.
*   Bug [86029](https://bugzilla.mozilla.org/show_bug.cgi?id=86029 "create permission restrictions for createaccount.cgi (prevent people from creating accounts)") - create permission restrictions for createaccount.cgi (prevent people from creating accounts)
*   Bug [159627](https://bugzilla.mozilla.org/show_bug.cgi?id=159627 "quips should be editable and deleteable using the web interface") - quips should be editable and deleteable using the web interface
*   Bug [176461](https://bugzilla.mozilla.org/show_bug.cgi?id=176461 "Move descs strings from change-columns.html.tmpl to field-descs.html.tmpl") - Move descs strings from change-columns.html.tmpl tofield-descs.html.tmpl
*   Bug [183843](https://bugzilla.mozilla.org/show_bug.cgi?id=183843 "Query knobs are missing if requirelogin is set") - Query knobs are missing if requirelogin is set
*   Bug [182946](https://bugzilla.mozilla.org/show_bug.cgi?id=182946 "fix regressions from bug 171493 (Bug.pm/show_bug.cgi/bug_form.pl reorg)") - fix additional typo noticed on irc by tm
*   Bug [182946](https://bugzilla.mozilla.org/show_bug.cgi?id=182946 "fix regressions from bug 171493 (Bug.pm/show_bug.cgi/bug_form.pl reorg)") - fix regressions from bug [171493](https://bugzilla.mozilla.org/show_bug.cgi?id=171493)(Bug.pm/show_bug.cgi/bug_form.pl reorg)
*   Bug [177850](https://bugzilla.mozilla.org/show_bug.cgi?id=177850 "checksetup fails if the user does not have read permission to the whole bugzilla path") - checksetup.pl was failing if the user didn't have read permissions to the entire Bugzilla path
*   Bug [178880](https://bugzilla.mozilla.org/show_bug.cgi?id=178880 "Bug Creation Date doesn't get displayed in long list") - Creation date is now displayed in the long list.
*   Bug [182512](https://bugzilla.mozilla.org/show_bug.cgi?id=182512 "Charts over time broken") - Charts over time broken
*   Bug [181951](https://bugzilla.mozilla.org/show_bug.cgi?id=181951 "Cannot delete groups") - Cannot delete groups
*   Bug [171493](https://bugzilla.mozilla.org/show_bug.cgi?id=171493 "make show_bug use Bug.pm and remove bug_form.pl") - make show_bug use Bug.pm and remove bug_form.pl
*   Bug [67077](https://bugzilla.mozilla.org/show_bug.cgi?id=67077 "Bugzilla should display the time zone on all times") - We now include the timezone (as configured in editparams.cgi) on every time we display.
*   Bug [173761](https://bugzilla.mozilla.org/show_bug.cgi?id=173761 "Need ability to always require login") Need ability to always require login
*   Bug [114179](https://bugzilla.mozilla.org/show_bug.cgi?id=114179 "Concentration, improvement, and templatisation of Bugzilla general user help system") - Concentration, improvement, and templatisation of Bugzilla general user help system.
*   Bug [181221](https://bugzilla.mozilla.org/show_bug.cgi?id=181221 "CSV reports on 2-d tables have header messed up") - CSV reports on 2-d tables have header messed up.
*   Bug [181960](https://bugzilla.mozilla.org/show_bug.cgi?id=181960 "Reason for account being disabled is not shown") Reason for account being disabled is not shown
*   Bug [180460](https://bugzilla.mozilla.org/show_bug.cgi?id=180460) request.cgi doesn't filter list of products/components
*   Bug [181582](https://bugzilla.mozilla.org/show_bug.cgi?id=181582 "Make Bugzilla's query page readable in Lynx") - reorders the table cells on the query page so that the list headers are grouped with the lists in Links and whenused with voice synthesis packages.
*   Bug [147275](https://bugzilla.mozilla.org/show_bug.cgi?id=147275 "Rearchitect product groups.") Rearchitect product groups
*   Bug [180980](https://bugzilla.mozilla.org/show_bug.cgi?id=180980 "Doing 2 email searches fails when searching for CC list members") Doing 2 email searches fails when searching for CC list members
*   Bug [180966](https://bugzilla.mozilla.org/show_bug.cgi?id=180966 "warnings in web server error log") - warnings in webserver error log (take 2)
*   Bug [181613](https://bugzilla.mozilla.org/show_bug.cgi?id=181613 "Dynamics IPs of dyndns.org (and probably other dyndns providers) are not refreshed") - $::ENV not being cleared
*   Bug [181182](https://bugzilla.mozilla.org/show_bug.cgi?id=181182 "Reporting fix pack 2") - Reporting fix pack 2\. Fixes bug [179198](https://bugzilla.mozilla.org/show_bug.cgi?id=179198) (Don't print labels for pie chart wedges when smaller than a certain size), bug [180255](https://bugzilla.mozilla.org/show_bug.cgi?id=180255) (Tabular report CSV downloads should suggest csv filename), and bug [180967](https://bugzilla.mozilla.org/show_bug.cgi?id=180967) (csv reports swap rows/columns).
*   Bug [181286](https://bugzilla.mozilla.org/show_bug.cgi?id=181286 "Invalid html in banner.html.tmpl") - Invalid html in banner.html.tmpl
*   Bug [179483](https://bugzilla.mozilla.org/show_bug.cgi?id=179483 "Displays wrong product name in question of bug entry template for Chimera or Bugzilla") - Guided template displays wrong product name sometimes.
*   Bug [179582](https://bugzilla.mozilla.org/show_bug.cgi?id=179582 "Format flag email to be more informative") - More informative and easier to read flag email template
*   Bug [179293](https://bugzilla.mozilla.org/show_bug.cgi?id=179293 "time tracking js should only appear if time tracking is enabled") - time tracking js should only appear if time tracking isenabled
*   Bug [181000](https://bugzilla.mozilla.org/show_bug.cgi?id=181000 "Software error: SELECT name FROM keyworddefs WHERE id IN ( 7): Table 'keyworddefs' was not locked with LOCK TABLES at globals.pl line 283.") - Lock the keyworddefs table for READ when using a shadowdb, too
*   Bug [180978](https://bugzilla.mozilla.org/show_bug.cgi?id=180978 "Adding keyword from enter_bug doesn't update keyword cache") - Adding keyword from enter_bug doesn't update keyword cache
*   Bug [179811](https://bugzilla.mozilla.org/show_bug.cgi?id=179811 "focus problem in body of message when using tab"), used & instead of &amp;
*   Bug [124589](https://bugzilla.mozilla.org/show_bug.cgi?id=124589 "support replication with mysql") - support database replication
*   Bug [179881](https://bugzilla.mozilla.org/show_bug.cgi?id=179881 "requests link in footer should be 'my requests'") - makes the "Requests" link in the footer be "My Requests" for logged in users.
*   Bug [179876](https://bugzilla.mozilla.org/show_bug.cgi?id=179876 "label requestee field to reduce confusion") - Labels the "Requestee" field to reduce confusion about its purpose.
*   Bug [175579](https://bugzilla.mozilla.org/show_bug.cgi?id=175579 "Make templates html compliant") - make templates html compliant
*   Bug [179206](https://bugzilla.mozilla.org/show_bug.cgi?id=179206 "enter_bug isn't picking up version from URL") - enter_bug isn't picking up version from URL
*   Bug [180545](https://bugzilla.mozilla.org/show_bug.cgi?id=180545 "You can change the product/component on a bug without editbugs privs") - It was possible to change the product/component of a bug without having the editbugs permission.
*   Bug [179960](https://bugzilla.mozilla.org/show_bug.cgi?id=179960 "QuickSearch queries are slow and time out") - Qucksearch queries are slow and timeoutfixed by adding subselect emulation for product/component lookups
*   Bug [180205](https://bugzilla.mozilla.org/show_bug.cgi?id=180205 "General reporting fixes") - General reporting fixes.
*   Bug [180151](https://bugzilla.mozilla.org/show_bug.cgi?id=180151) - Grand total links are messed up when axis is restricted,
*   Bug [180105](https://bugzilla.mozilla.org/show_bug.cgi?id=180105) - CSV reports occasionally break,
*   Bug [179671](https://bugzilla.mozilla.org/show_bug.cgi?id=179671) - Boolean charts are broken on reporting pages,
*   Bug [179887](https://bugzilla.mozilla.org/show_bug.cgi?id=179887) - report.cgi should |require Data::Dumper|, not |use|
*   Bug [179581](https://bugzilla.mozilla.org/show_bug.cgi?id=179581) - Keyword combinations report not very useful.
*   Bug [180444](https://bugzilla.mozilla.org/show_bug.cgi?id=180444 "Request tracker misattributes requests redirected to new requestees") - Correctly attributes request creation to person who submitted it.
*   Bug [180632](https://bugzilla.mozilla.org/show_bug.cgi?id=180632 "Flag.pm references flag->is_requesteeble instead of flag->type->is_requesteeble") - corrects reference flag->is_requesteeble to flag->type->is_requesteeble
*   Last part of fix for bug [179494](https://bugzilla.mozilla.org/show_bug.cgi?id=179494 "requesting super-review didn't work well") - adds "use Bugzilla::Util" and removes "&::" from before "trim" per bbaetz.
*   Bug [179494](https://bugzilla.mozilla.org/show_bug.cgi?id=179494 "requesting super-review didn't work well") - prevents Bugzilla from thinking users have changed flags when they haven't.
*   Bug [180544](https://bugzilla.mozilla.org/show_bug.cgi?id=180544 "generally requestable flags display requestee field") - prevents display of requestee field for generally requestable fields.

<a name="cvs2_16-BRANCH"></a><a name="cvs2_14-BRANCH"></a>

## <a name="cvs2_14-BRANCH">2.16 & 2.14 Branch Checkins Since the Last Status Update</a>

<a name="cvs2_14-BRANCH"></a>

The following is a list of specific bugs fixed (and their checkin messages) since the last Bugzilla status report. It is ordered by the checkin date, as ordered by [Bonsai](http://bonsai.mozilla.org/). It includes checkins on the **2.14 and 2.16 branches** from **11/17/2002** to **01/02/2003**. This list was generated by filtering Bonsai's output on [that query](http://bonsai.mozilla.org/cvsquery.cgi?treeid=default&module=Bugzilla&branch=BUGZILLA-2_1%284_1%7C6%29-BRANCH&branchtype=regexp&dir=&file=&filetype=match&who=&whotype=match&sortby=Date&hours=2&date=explicit&mindate=11%2F17%2F2002&maxdate=01%2F02%2F2003+00%3A00%3A00&cvsroot=%2Fcvsroot) (contains both branches).

Bold italic bugs are security-sensitive bugs.

Checkins made without reference to any specific bugs:

*   Versions numbers were bumped and release notes updated for both branches

Checkin manifest:

*   **_Bug [186383](https://bugzilla.mozilla.org/show_bug.cgi?id=186383 "Checksetup leaves editor backups of localconfig accessible") - Checksetup leaves editor backups of localconfig accessible_**
*   **_Bug [183188](https://bugzilla.mozilla.org/show_bug.cgi?id=183188 "data/mining is world writable after each run of collectstats.pl") - collectstats.pl no longer makes data/mining world-readable_**
*   **_Bug [179329](https://bugzilla.mozilla.org/show_bug.cgi?id=179329 "HTML-unsafe characters need to be escaped in quips") - filter quips in "show all the quips" for HTML_**

