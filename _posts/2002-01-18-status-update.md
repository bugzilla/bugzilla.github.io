---
title: "Bugzilla Status Update"
date: 2002-01-18
author: ["jake"]
categories:
- Status
---

## Introduction

It's been a while since the previous (AKA, first) status update, so this one will be a bit longer than may be considered ideal. As you are probably aware, the 2.16 release of Bugzilla hasn't happened yet. We are working hard at making this release a reality, but the members of the core team have been very busy lately with other endevors (rumor has it that some of us have a life :). As of this writing, the goal is to freeze the tree on Saturday, February 2, 2002 with a release happening on Saturday, February 16.

## Highly Misleading & Meaningless Statistics

|Date|2.16 Bugs With Patches Waiting For Review|2.16 Bugs Waiting For Patches|2.16 Release Blockers|2.18 Bugs|Other Bugs|
|--- |--- |--- |--- |--- |--- |
|2001-10-19|112 bugs|329 bugs||36 bugs|299 bugs|
|2002-01-18|49 bugs|61 bugs|34 bugs|459 bugs|337 bugs|

## The 2.14.1 Release

During the time that the trunk was open for 2.15 development, the decision was made that in order to provide better security, all `.cgi` files should run in taint mode. As of the 2.14 release, only `processmail` ran in taint mode. In the process of turning on taint mode in the perl files and for anything entering the database, there were numerous security holes discovered, some of which allowed you to masquerade as another user, others allowed you to glean information about secure bugs. It was decided that these holes were of a high enough severity to backport the patches to 2.14 and put out an interm release rather than wait for 2.16 to come out. More specific information can be found in the [2.14.1 Release Notes](/release2_14_1.html).

Please note that 2.14.1 does not run in taint mode. Also, the goal for 2.16 is to have all the user accessible files running in taint mode (basically, anything that doesn't start with `edit`).

## Templatisation

For better or for worse, templatisation of all user visible `.cgi`'s is now a 2.16 release goal. The "better" part is that it makes customizing the look and feel of the front end much easier as you only have to change the template, you don't have to change any of the perl code. The "worse" is that it's a lot of work and probably one of the main reasons for the constant delays of 2.16.

The minimum version of the [Template Toolkit](http://www.template-toolkit.org/) was recently increased to be 2.06 instead of 2.01\. This is because there were certain features that required this newer version that we wanted to take advantage of in Bugzilla. See bug [120081](https://bugzilla.mozilla.org/show_bug.cgi?id=120081 "New min version of Template Toolkit - 2.06") for more information.

The Template Toolkit is available from [their web page](http://www.template-toolkit.org/download.html). If you use linux, you can also get the module from CPAN. Instructions for using PPM on win32 are available from [their web page](http://www.template-toolkit.org/download.html).

Bugs relevant to the templating process that are still outstanding are:

*   [Bug 86168](https://bugzilla.mozilla.org/show_bug.cgi?id=86168 "Bugzilla should use template pages instead of hard-coded HTML") - The main "umbrella" bug.
*   [Bug 103778](https://bugzilla.mozilla.org/show_bug.cgi?id=103778 "templatize buglist.cgi") - `buglist.cgi`
*   [Bug 115369](https://bugzilla.mozilla.org/show_bug.cgi?id=115369 "Templatise long_list.cgi") - `long_list.cgi`
*   [Bug 103953](https://bugzilla.mozilla.org/show_bug.cgi?id=103953 "Templatise enter_bug.cgi") - `enter_bug.cgi`
*   [Bug 110012](https://bugzilla.mozilla.org/show_bug.cgi?id=110012 "Spank show_bug.cgi hard - templatize and combine") - `show_bug.cgi`
*   [Bug 110013](https://bugzilla.mozilla.org/show_bug.cgi?id=110013 "templatize describecomponents.cgi") - `describecomponents.cgi`
*   [Bug 117060](https://bugzilla.mozilla.org/show_bug.cgi?id=117060 "Templatise user_prefs.cgi") - `user_prefs.cgi`
*   [Bug 117509](https://bugzilla.mozilla.org/show_bug.cgi?id=117509 "Templatise createaccount.cgi") - `createaccount.cgi`
*   [Bug 117759](https://bugzilla.mozilla.org/show_bug.cgi?id=117759 "Templatise quips.cgi and roll in new_comment.cgi") - `quips.cgi`
*   [Bug 106612](https://bugzilla.mozilla.org/show_bug.cgi?id=106612 "Convert HTML files to HTML templates.") - All the files `*.html` files currently in the main directory

## 2.16 Goals

The goals for our 2.16 release have changed since the last status update. When that update was written, the goal was to have no patches setting around bit-rotting. It was determined that while this is an admirable goal, there were other things that Bugzilla needed more, such as the aforementioned templates. Reducing the patch queue and accepting submissions from non-core developers is an ongoing goal for the Bugzilla develepment team, but we are constantly faced with the difficult decision of how to manage what little time we have to work on this project.

The current goals for our 2.16 release are:

*   HTML 4.01 Transitional compliance.
*   Templatization of all customer-visible CGI pages, to allow easy customization by the administrator
*   Allow users to change their own email addresses, instead of having to bug the site admin (using verification emails sent to both the old and new addresses to validate the change)
*   Complete redesign of the schema related to security groups to eliminate the "funky groupset math" and allow more than 55 bug groups to be created.
*   Remove old attachment code in favor of the new attachment tracker system.
*   Enable Perl's taint mode for all user accesable files, and taint-check anything being sent to the database.

For a more up to date list, see [the roadmap](/about/#milestones). Also, the current list of open bugs that are considered release blockers can be found [in this buglist](https://bugzilla.mozilla.org/buglist.cgi?product=Bugzilla&resolution=---&bug_severity=blocker&target_milestone=Bugzilla+2.16).

## Contributions

There are many ways you can help the Bugzilla team.

*   **Patches to Fix Bugs/Implement New Features.** These are very welcome, especially if they are targetted for the 2.16 milestone! They need to be appropriately generic for all Bugzilla installations and conform to our other requirements (see [the hackers' guide](/contributing/developer)) before they can appear in CVS, but if you don't wish to do this, anything is better than nothing, and we can use your work as a base.
*   **New documentation.** If you think you can help with the documentation for Bugzilla, please contact [Matthew Barnson](mailto:barnboy@trilobyte.net).
*   **Testing.** Search for bugs in the Bugzilla software, as well as trying out pending patches in the bug system.
*   **Review.** If you have experience with Perl and Bugzilla code, it would be very useful if you look over pending patches in the bug system and see if there are any problems with them. Generally we expect reviewers to have submitted some patches first so we can evaluate their ability. If you fit into this category, please contact [Dave Miller](mailto:justdave@bugzilla.org) about this.
*   **Automatic Problem Finding.** If you have ideas for automatically detecting problems, please let the team know by filing a bug in the [Testing Suite](https://bugzilla.mozilla.org/enter_bug.cgi?product=Bugzilla&component=Testing+Suite) component.

The Bugzilla team mainly communicates through the IRC channel [#mozwebtools](irc://irc.mozilla.org/#mozwebtools) on irc.mozilla.org. All are welcome on this channel, whether you are an administrator of a Bugzilla installation or wish to contribute. The more the merrier.

## Upcoming Major Features

Major new features are being working on. Some of these will appear in 2.16. If you would like to know when we plan on adding one of these feature, you can get that information from the bug requesting its implementation. These include:

*   PostgreSQL support. (Bug [98304](https://bugzilla.mozilla.org/show_bug.cgi?id=98304 "Allow Bugzilla to work with Postgres SQL (PgSQL)"))
*   Ability to have more than 55 groups, which will also allow a finer grained rights system to be introduced. (Bug [68022](https://bugzilla.mozilla.org/show_bug.cgi?id=68022 "Need more than 55 groups"))
*   Customised resolutions, that allow adding, removing, deactivating and renaming of resolutions. (Bug [94534](https://bugzilla.mozilla.org/show_bug.cgi?id=94534 "Customised resolutions."))
*   Expanding the e-mail preferences to allow watching components, keywords, etc. (Bug [73665](https://bugzilla.mozilla.org/show_bug.cgi?id=73665 "Need an "emailprefs" table"))
*   Request tracker, for managing requests to change things about bugs. (Bug [98801](https://bugzilla.mozilla.org/show_bug.cgi?id=98801 "request tracker"))
*   Use template pages instead of hard-coding the HTML into the perl. (Bug [86168](https://bugzilla.mozilla.org/show_bug.cgi?id=86168 "Bugzilla should use template pages instead of hard-coded HTML"))
*   `mod_perl` support. (Bug [87406](https://bugzilla.mozilla.org/show_bug.cgi?id=87406 "Make Bugzilla work with mod_perl (under Apache)"))

## Checkins Since the Last Status Update

[Get this list from Bonsai](http://bonsai.mozilla.org/cvsquery.cgi?module=Bugzilla&sortby=Date&date=explicit&mindate=2001%2F10%2F19+12%3A00%3A00&maxdate=2002%2F01%2F18+07%3A00%3A00)

*   [Bug 73180](https://bugzilla.mozilla.org/show_bug.cgi?id=73180 "versioncache should say it's not editable.") - Put a notice in the `versioncache` file stating that it's automatically generated
*   [Bug 104340](https://bugzilla.mozilla.org/show_bug.cgi?id=104340 "showdependencytree.cgi: toolbar UI design") - Change the UI for the toolbar that allows bugs to be hidden in the dependancy tree
*   [Bug 105480](https://bugzilla.mozilla.org/show_bug.cgi?id=105480 "Make better use of fielddefs TABLE when displaying errors") - Use the friendly name from the fielddefs table when reporting strictvalue errors if it's available
*   [Bug 71840](https://bugzilla.mozilla.org/show_bug.cgi?id=71840 "[RFE] Make comments referenceable") - Make comments referenceable using a #c4 to get the fourth comment
*   [Bug 63249](https://bugzilla.mozilla.org/show_bug.cgi?id=63249 "Bug count is very slow for Products with many bugs") - The Bug Counts report was running very slowly due to unneeded fields/joins in the SQL query
*   [Bug 97469](https://bugzilla.mozilla.org/show_bug.cgi?id=97469 "Assignee/QA/Reporter/CC don't get email on restricted bugs") - Fixed the mail handling code to allow "extra" people that can see a restricted bug to get e-mail about it
*   [Bug 95024](https://bugzilla.mozilla.org/show_bug.cgi?id=95024 "Assignee/QA/Reporter/CC can't see restricted bugs in buglist") - Fixed the query code to allow "extra" people see their bugs in a buglist
*   [Bug 101560](https://bugzilla.mozilla.org/show_bug.cgi?id=101560 "processmail doesn't work with the P4DTI") - `BASH_ENV` was casing `processmail` grief in if it existed due to Taint mode
*   [Bug 106315](https://bugzilla.mozilla.org/show_bug.cgi?id=106315 "Would like to be able to send mail to all QA contacts from query results page") - Added a link to the bottom of a buglist to send e-mail to all QA Contacts contained in that buglist
*   [Bug 104065](https://bugzilla.mozilla.org/show_bug.cgi?id=104065 "uninitialized string in "process_bug.cgi" line 92") - Stop uninitialized string warnings from getting into the error log when the login cookie doesn't exist
*   [Bug 98602](https://bugzilla.mozilla.org/show_bug.cgi?id=98602 "Templatize createattachment.cgi") - Completely redesigned the Create Attachment page
*   [Bug 81594](https://bugzilla.mozilla.org/show_bug.cgi?id=81594 "SQL error after editing user entry in editusers.cgi") - SQL error after editing user entry when changing numerous things at once
*   [Bug 150879](https://bugzilla.mozilla.org/show_bug.cgi?id=105879) - Footer links have an extra `|` by Sanity Check
*   [Bug 96675](https://bugzilla.mozilla.org/show_bug.cgi?id=96675 "checksetup should require admin e-mail address satisfy emailregexp.") - `checksetup.pl` should require admin e-mail address satisfy `emailregexp`
*   [Bug 95615](https://bugzilla.mozilla.org/show_bug.cgi?id=95615 "editvotes error:'u r using X votes', should be 'u r *TRYING* to use X votes'") - cosmetic change to clarify error message when trying to use too many votes
*   [Bug 105773](https://bugzilla.mozilla.org/show_bug.cgi?id=105773 "Email addresses in cc list should be sorted case insensitively") - Email addresses in the CC list are now sorted case-insensitively
*   [Bug 107718](https://bugzilla.mozilla.org/show_bug.cgi?id=107718 "masschange gives all changed bugs the groupset of the first bug in the list") - Do bit fiddling instead of adding groupsets from the first bug to prevent problems with mass changes
*   [Bug 107672](https://bugzilla.mozilla.org/show_bug.cgi?id=107672 "Browser OS/Platform discrimination alg sucks") - All new regular expressions for determining what browser/os is being used
*   *[Bug 108516](https://bugzilla.mozilla.org/show_bug.cgi?id=108516 "[security] It's possible to file a bug as somebody you're not.") - Stopped trusting the hidden form value from `enter_bug.cgi` to determine who is filing the bug
*   *[Bug 108385](https://bugzilla.mozilla.org/show_bug.cgi?id=108385 "[security] Possible to add comments to a bug as someone else") - Stopped trusting the hidden value from the bug form when adding a comment to the database.
*   [Bug 108547](https://bugzilla.mozilla.org/show_bug.cgi?id=108547 "javascript error in attachment.cgi - using bad DOM Style code") - Use proper DOM code on the edit attachment page
*   [Bug 101166](https://bugzilla.mozilla.org/show_bug.cgi?id=101166 "users seeing a bug via *_accessible bits should see group names") - Allow "extra" people to see that the bug is in a group
*   *[Bug 108812](https://bugzilla.mozilla.org/show_bug.cgi?id=108812 "[security] We allow the user to send arbitary SQL!!!!!") - Prevent users from running queries containing arbitrary SQL
*   *[Bug 108821](https://bugzilla.mozilla.org/show_bug.cgi?id=108821 "[security] users with blessgroupset!= 0 can change any groupset") - Prevent users with blessgroupset privileges from blessing any group set
*   *[Bug 108822](https://bugzilla.mozilla.org/show_bug.cgi?id=108822 "[security] Any user can change their groupset!") - Prevent any user from changing their own groupset
*   [Bug 104652](https://bugzilla.mozilla.org/show_bug.cgi?id=104652 "Missing dependency tree information") - Duplicate bugs in the dependency tree now get marked with the message "This bug appears elsewhere in this tree." so users know why the bug does not appear to have dependencies
*   [Bug 99519](https://bugzilla.mozilla.org/show_bug.cgi?id=99519 "Invalid timestamp in cc, no e-mail") - timestamps were not being set correctly in the activity table in some situations, and the delta_ts on the bug itself was not always being updated if dependencies or CCs changed
*   [Bug 109048](https://bugzilla.mozilla.org/show_bug.cgi?id=109048 "can not create attachments") - Fixed error when creating attachments without logging in
*   [Bug 109138](https://bugzilla.mozilla.org/show_bug.cgi?id=109138 "platform detection not working on macintosh") - Fixed a problem where Bugzilla didn't detect Macs
*   *[Bug 109690](https://bugzilla.mozilla.org/show_bug.cgi?id=109690 "[security] longlist.cgi doesn't check that $bug is valid") - Verify that all bugs passed to longlist.cgi are valid
*   [Bug 86300](https://bugzilla.mozilla.org/show_bug.cgi?id=86300 "Multiple usage of potentially uninitialized variables in globals.pl/GetBugLink") - Don't link to bugs that do not exist. Also, cache the results of the `GetBugLink()`
*   [Bug 99518](https://bugzilla.mozilla.org/show_bug.cgi?id=99518 "template files do not have license headers") - Added license header to all templates
*   [Bug 98110](https://bugzilla.mozilla.org/show_bug.cgi?id=98110 "Attachment change page looks different from bug change page.") - Make the attachment change page look like the bug changed page
*   [Bug 6419](https://bugzilla.mozilla.org/show_bug.cgi?id=6419 "want command-line queries for bugzilla") - Tools that can be used to generate Bugzilla queries on the command line were added to the `contrib/` directory
*   [Bug 101560](https://bugzilla.mozilla.org/show_bug.cgi?id=101560 "processmail doesn't work with the P4DTI") - Cleared some more environment variables that caused issues when running in Taint mode
*   [Bug 104667](https://bugzilla.mozilla.org/show_bug.cgi?id=104677 "vote field for products which allow multiple votes defaults to size="5" and doesnt include a maxlength="" attribute") - Votes field (text style) on showvotes.cgi defaults to size 5, not natural size and doesn't include a maxlength attribute
*   [Bug 12284](https://bugzilla.mozilla.org/show_bug.cgi?id=12284 "let me specify which columns to display in a bug list") - allow user to specify which columns to display in a bug list
*   [Bug 92500](https://bugzilla.mozilla.org/show_bug.cgi?id=92500 "OmniWeb browser "corrupts" params file with hard returns (^M)") - Line-feeds were not being properly converted when submitting parameter changes with some Mac browsers
*   [Bug 107120](https://bugzilla.mozilla.org/show_bug.cgi?id=107120 "templates/default/global/header has invalid HTML") - Make the header template generate valid HTML 4.01 Transitional
*   [Bug 107120](https://bugzilla.mozilla.org/show_bug.cgi?id=109354 "Attachment link on newly entered bug refers to old form") - After entering a new bug, the link offering to add an attachment to the bug you just created pointed at the old attachment form instead of the new one
*   [Bug 100788](https://bugzilla.mozilla.org/show_bug.cgi?id=100788 "Bugzilla helper incorrectly prepends http:// to non-http: URLs") - `enter_bug.cgi` wasn't correctly interpretting whether or not a partial URL needed an http:// added to the front of it
*   [Bug 105812](https://bugzilla.mozilla.org/show_bug.cgi?id=105812 "Rename "Components" link in sub GetCommandMenu() to "Products"") - The footer link for editing Products was incorrectly labled as Components
*   [Bug 98707](https://bugzilla.mozilla.org/show_bug.cgi?id=98707 "query.cgi redesign/templatisation") - Complete redesign of the query page
*   [Bug 109240](https://bugzilla.mozilla.org/show_bug.cgi?id=109240 "second line of comment in email is too long when attachment created") - Fixed a regression that caused a really long line in e-mail
*   *[Bug 102141](https://bugzilla.mozilla.org/show_bug.cgi?id=102141 "[security] When changing a bug the Product: list has options the user doesn't have access to.") - The Product select box now only shows products the user has access to (and the product the bug is in, if the user is viewing it because of some other override)
*   [Bug 93754](https://bugzilla.mozilla.org/show_bug.cgi?id=93754 "describe should be #directable") - Individual keywords can be linked to on the describe keywords page by using HTML anchors
*   [Bug 99864](https://bugzilla.mozilla.org/show_bug.cgi?id=99864 "query.cgi lists 'programs' enter_bug.cgi lists 'products'") - consistant use of "product" vs "program"
*   [Bug 104261](https://bugzilla.mozilla.org/show_bug.cgi?id=104261 "attachment.cgi doesn't look in "template/custom" directory") - Made sure all files that use templates look inside the `custom` directory first
*   [Bug 61634](https://bugzilla.mozilla.org/show_bug.cgi?id=61634 "describe Milestone URL in edit products page") - explain what "Milestone URL" is on the editproducts page
*   [Bug 109530](https://bugzilla.mozilla.org/show_bug.cgi?id=109530 "xml.cgi double (and in some cases triple) quoting special characters.") - Fixed Bug.pm so it doesn't quote xml characters until it's asked to output xml (instead of doing it both ways)
*   [Bug 101875](https://bugzilla.mozilla.org/show_bug.cgi?id=101875 "component column should be after product column in query results") - Put the product column before the component column rather than after
*   [Bug 109802](https://bugzilla.mozilla.org/show_bug.cgi?id=109802 "checksetup.pl fails to connect to mysql database - password not escaped in localconfig") - Make it clear how to enter mysql passwords with special characters into `localconfig`
*   [Bug 108312](https://bugzilla.mozilla.org/show_bug.cgi?id=108312 "Mid air collision page may not show all updates") - The mid-air collision page was only showing the most recent changes if two people comitted changes to a bug while you were viewing it.
*   [Bug 54901](https://bugzilla.mozilla.org/show_bug.cgi?id=54901 "[security] LDAP Authentication should fail for empty passwords") - If you were using LDAP authentication it would let you log in as anyone if you left the password blank
*   [Bug 37339](https://bugzilla.mozilla.org/show_bug.cgi?id=37339 "Bugzilla sidebar, containing info in footer") - Added a sidebar for Mozilla based browsers that contains the saved queries from the page footer
*   [Bug 80183](https://bugzilla.mozilla.org/show_bug.cgi?id=80183 "configurable index page (using Template Toolkit)") - Make the index page use a template and contain the normal page footer
*   [Bug 102487](https://bugzilla.mozilla.org/show_bug.cgi?id=102487 "product-change page appears even if i don't write a comment") - Check for lack of comments and warn before checking to see if the product has changed
*   [Bug 113646](https://bugzilla.mozilla.org/show_bug.cgi?id=113646 "midair when changing assignee gives error") - An error would occur if there was a midair collision and the assignee was being changed
*   [Bug 98080](https://bugzilla.mozilla.org/show_bug.cgi?id=98080 "ask for an attachment number when no params are given") - If `attachment.cgi` is run without any params, it will now prompt for the attachment number
*   [Bug 97784](https://bugzilla.mozilla.org/show_bug.cgi?id=97784 "Bugzilla attachment edit textareas missing wrap attribute") - Wrap comments properly on "edit attachment" page
*   *[Bug 109679](https://bugzilla.mozilla.org/show_bug.cgi?id=109679 "[security] fieldx-x-x values not validated") - It was possible to send arbitrary SQL to buglist.cgi by altering the HTML form before submitting
*   [Bug 113975](https://bugzilla.mozilla.org/show_bug.cgi?id=113975 "cannot only add an email to cc: in Change several bugs at once") - Changing only cc on mass change page incorrectly gives an error that you didn't select anything to change
*   [Bug 113383](https://bugzilla.mozilla.org/show_bug.cgi?id=113383 "link to dependent bug in "dependent bug changed state" notification") - Add a link to the dependent bug in emails about a dependent bug changing state
*   [Bug 99608](https://bugzilla.mozilla.org/show_bug.cgi?id=99608 "[security] Possible leak of bug summary in dependency changed e-mail") - Dependency mails are no longer sent if the dependent bug can't be seen by the would-be recipient of the email
*   [Bug 120081](https://bugzilla.mozilla.org/show_bug.cgi?id=120081 "New min version of Template Toolkit - 2.06") - Bugzilla now requires version 2.06 of the Template Toolkit

Bugs with an asterisk (*) next to them were also checked into the 2.14.1 branch

