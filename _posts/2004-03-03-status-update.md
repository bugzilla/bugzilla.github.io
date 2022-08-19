---
title: "Status Update"
date: 2004-03-03
author: ["justdave"]
categories:
- Status
---

## Introduction

This status update covers the four months that have gone by since our [last update](/blog/2003/11/02/status-update). At the time of our last status update, we released version 2.17.5 of Bugzilla. It was followed a week later by version 2.17.6, which was released to seal a small [security hole](/security/2.17.5/) discovered in one of the new features that was introduced in 2.17.5.

As of this status update, we are also releasing 2.17.7 and 2.16.5\. For the first time in a while, there's no security advisory to go with it, which feels pretty good! So, if there's no security advisory, why are we releasing a new stable release? Well, 2.16.5 had a few regressions from 2.16.4 that we had to fix. The most major of which was that xml.cgi was completely busted. We also fixed some compatibility problems with older versions of DBI, fixed a MySQL 4 compatibility issue which we thought we'd fixed in 2.16.4, but it turns out we really hadn't, and several other minor bugfixes that we hope will improve the overall stability of the 2.16 series.  

Note that (in tradition with previous updates, which have included a bit on this subject) Windows support (which implies being able to run a Bugzilla instance on a Windows web server) is _still_ to be completed and integrated! We would really appreciate community assistance in fixing the [remaining issues for Windows support](https://bugzilla.mozilla.org/buglist.cgi?product=Bugzilla&resolution=---&status_whiteboard_type=allwordssubstr&status_whiteboard=Win32). So far, very few people have been contributing towards the Win32 effort.

We'd also like to remind all Bugzilla administrators that to assist them in keeping up-to-date with release announcements and security advisories, we provide an ultra-low-volume administrator mailing list (announce@bugzilla.org). We advise all Bugzilla administrators to [subscribe](https://lists.bugzilla.org/cgi-bin/mj_wwwusr?func=lists-full-long&extra=announce) so they can keep up with important Bugzilla news.

## New Releases

The Bugzilla Team is pleased to announce the 2.16.5 and 2.17.7 releases of Bugzilla.

*   The stable (2.16.5) release provides a number of bug fixes, as mentioned above. See the check-in manifest at the bottom of this status update for details.
*   The development (2.17.7) release provides a large number of feature enhancements and bug fixes. This release is a developers' release and is not intended for production use.

We would like to remind all administrators running Bugzilla instances from the old 2.14 branch that this branch has been retired, and is no longer being supported actively by the team. We strongly recommend upgrading to the latest stable version to ensure security and proper operation.

<a name="newfeatures"></a>

## New Features (on the Trunk)

A few new features are available for testing on our latest development release. The following items describe the most important of them, and the manifests towards the end of this document describe the full list of changes committed.

*   **CSS Customization:** A CSS id signature unique to each Bugzilla installation is now added to the <body> tag on Bugzilla pages to allow custom end-user CSS to explicitly affect Bugzilla. ([224242](https://bugzilla.mozilla.org/show_bug.cgi?id=224242))
*   **Template Hooks:** A mechanism for third party extensions to plug into existing templates without having to patch or replace distributed templates has been added. More information on this can be found in the [Documentation](/docs/html/cust-hooks.html). ([232903](https://bugzilla.mozilla.org/show_bug.cgi?id=232903))
*   **'commentoncreate' Parameter:** A parameter has been added which allows the administrator to prevent users from submitting new bugs with an empty description. ([213679](https://bugzilla.mozilla.org/show_bug.cgi?id=213679))

## The Road to 2.18

**An update from Dave Miller, Bugzilla project leader, and Matthew Tuck, QA lead**

After a long [discussion](https://www.google.com/groups?threadm=mailman.1071354375.9612.mozilla-webtools%40mozilla.org&rnum=1) on the mozilla-webtools mailing list, we've decided to cave in to popular demand and move to date-based releases for 2.20 and beyond, in response to the enormously long periods for the feature-based releases 2.16 and 2.18\. The current plan is as follows:

The releases will be approximately six-monthly to start with. This should be an upper limit, and we could perhaps consider to go to four-monthly later if things runs smoothly. More releases means code gets out faster and developers have less pain missing a release, and I don't think there's much overhead from extra releases, given pretty much all work before and after a release will be proportionately smaller.

There will be no promises of features appearing in releases, on behalf of the Bugzilla project. We have no way of guaranteeing features in a given or reasonable time frame. If you want to make an individual promise to someone, it's on your head. =)

The date-based part of the release process will be the feature freeze. All other aspects of development will stay "when they're ready". This in particular means the releases will only be approximately six months apart. This means that although the freeze will happen on a set date, the release itself will not happen until the release branch passes release candidate testing.

When the tree opens for 2.19, there will be a little less than six months of development time (so that the freezes themselves can happen every six months). Once this elapses, a feature freeze will be declared, at which point the tree will be closed to anything that is not a user or administrator-visible bug fix, docs updates or an otherwise freeze-approved checkin.

This will continue until the tree is declared fit for Release Candidate (RC) 1\. At this point, the tree will branch, and HEAD will reopen for development. The branch will continue the RC cycle until it's ready for release.

Note that the tree closed time will be deducted from the development time for the next release, which will mean the feature freezes will stay exactly every six months. One would not expect this to be greater than 1-2 weeks, if which case the development time would be about 5 months and 2-3 weeks.

## Upcoming Features

This section lists major new features that are either in progress or have some amount of work toward them completed already, but have not yet landed in CVS. If you would like to help out -- many of these features need either planning, coding, or testing -- or just figure what the current status is on one of these items, check out the parenthesized bug links.

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

Apart from work on Bugzilla itself, Mike Morgan has started work on redesigning the Bugzilla website to a standards-compliant version that matches mozilla.org's new look-and-feel. This is already underway, and will be rolled out with the Bugzilla 2.18 release.

## Trunk Checkins Since the Last Status Update

The following is a list of specific bugs fixed (and their checkin messages) since the last Bugzilla status report. It is ordered by the checkin date as rendered by [Bonsai](http://bonsai.mozilla.org/). It includes checkins on the trunk from 2003/11/03 to 2004/03/03\. This list was generated by filtering Bonsai's output on [that query](http://bonsai.mozilla.org/cvsquery.cgi?module=Bugzilla&branch=HEAD&branch_type=match&sortby=Date&date=explicit&mindate=2003-11-03+00:00&maxdate=2004-03-03+11:59&cvsroot=%2Fcvsroot).

Checkins that don't refer to a specific bug number have been omitted, and were a significant minority. Bold italic bugs are security-sensitive bugs.

Checkin manifest:

*   Bug [123077](https://bugzilla.mozilla.org/show_bug.cgi?id=123077) - improve the ValidatePassword sub so that a password change is no longer accepted with a blank second field
*   Bug [234898](https://bugzilla.mozilla.org/show_bug.cgi?id=234898) - start to use $cgi->param in queryhelp.cgi.
*   Bug [234896](https://bugzilla.mozilla.org/show_bug.cgi?id=234896) - makes sanitycheck.cgi use $cgi->param instead of ::FORM.
*   Bug [234876](https://bugzilla.mozilla.org/show_bug.cgi?id=234876) - removes %FORM from token.cgi.
*   Bug [192247](https://bugzilla.mozilla.org/show_bug.cgi?id=192247) - make Bugzilla quips truly random.
*   Bug [235268](https://bugzilla.mozilla.org/show_bug.cgi?id=235268) - Convert show_activity.cgi to get rid of %FORM
*   Bug [235287](https://bugzilla.mozilla.org/show_bug.cgi?id=235287) - improve a whineatnews.pl comment
*   Bug [65313](https://bugzilla.mozilla.org/show_bug.cgi?id=65313) - improves the email regexp in order to detect better invalid email addresses
*   Bug [235175](https://bugzilla.mozilla.org/show_bug.cgi?id=235175) - replaces ::FORM from createaccount.cgi with CGI based methods that are mod_perl compatible
*   Bug [234264](https://bugzilla.mozilla.org/show_bug.cgi?id=234264) - eliminates a double escaping issue by removing filtering of searchname in title.
*   Bug [226251](https://bugzilla.mozilla.org/show_bug.cgi?id=226251) - (internal error when server push is enabled): Due to randomization of perl hash table functionality since 5.8.1 the 'hack' to unset the nph parameter for multipart messages is not working reliable, instead a modified clone of the original multipart_init function is setting this parameter to '0' and is ignoring the given nph parameter from buglist.cgi.
*   **[SCHEMA CHANGE]** Bug [220232](https://bugzilla.mozilla.org/show_bug.cgi?id=220232): short_desc field in the bugs table is no longer allowed to be NULL. Null summaries would cause BugMail.pm to crash. (Normally this would only be caused by third party touching of the bugs table, such as bugs manually migrated from another system or inserted by a script - such scripts will now break if they don't set a short_desc)
*   Bug [234171](https://bugzilla.mozilla.org/show_bug.cgi?id=234171) - removes \%COOKIE from index.cgi.
*   Bug [233645](https://bugzilla.mozilla.org/show_bug.cgi?id=233645) - fix a number of 'undef' warnings which were killing performance for multiple bug change.
*   Bug [234100](https://bugzilla.mozilla.org/show_bug.cgi?id=234100) - removes redundant longdescs table join criterion
*   Bug [232749](https://bugzilla.mozilla.org/show_bug.cgi?id=232749) - fix various charting problems revealed by b.m.o. upgrade, including editing, subscribe buttons and terminology.
*   Bug [232897](https://bugzilla.mozilla.org/show_bug.cgi?id=232897) - make collectstats.pl work with shadow databases, by reading from shadow and writing to master.
*   Bug [232441](https://bugzilla.mozilla.org/show_bug.cgi?id=232441) - Suggest solution in the error message in case admin forgets to rerun checksetup.pl
*   Bug [158527](https://bugzilla.mozilla.org/show_bug.cgi?id=158527) - Fix up description for the editbugs group so it is closer to the reality
*   Bug [127995](https://bugzilla.mozilla.org/show_bug.cgi?id=127995) - shows the size of attachments in the show bug and attachment interfaces.
*   Bug [218401](https://bugzilla.mozilla.org/show_bug.cgi?id=218401) - add in some places templatization support for the bug term in query.cgi.
*   Bug [194472](https://bugzilla.mozilla.org/show_bug.cgi?id=194472) - link to the product's component editor when displaying error regarding lack of components.
*   Bug [232993](https://bugzilla.mozilla.org/show_bug.cgi?id=232993) - Quote the filenames in the Content-disposition header when downloading attachments. This allows spaces to be used in filenames, and fixes compliance with RFCs 2183, 2045, and 822.
*   Bug [232830](https://bugzilla.mozilla.org/show_bug.cgi?id=232830) - use url_quote instead of html filtering to make sure we can delete queries which contain a "+".
*   Bug [224242](https://bugzilla.mozilla.org/show_bug.cgi?id=224242) - Add a CSS id signature to the <body> attribute on Bugzilla pages to allow user CSS to explicitly affect Bugzilla.
*   Bug [220998](https://bugzilla.mozilla.org/show_bug.cgi?id=220998) - Allows blocks, dependson, and keywords values to be part of a bug entry template (i.e. a URL that presets those fields to specific values). Original
*   Bug [232903](https://bugzilla.mozilla.org/show_bug.cgi?id=232903) - hook to allow addition of extra administration links in the footer.
*   Bug [232804](https://bugzilla.mozilla.org/show_bug.cgi?id=232804) - add a "--check-modules" switch to checksetup.pl to get it to only do the Perl module checks. This makes installation easier to explain.
*   Bug [232413](https://bugzilla.mozilla.org/show_bug.cgi?id=232413) - remove occurrences of &nbsp; in favour of [%+ construct to prevent whitespace chomping.
*   Bug [228917](https://bugzilla.mozilla.org/show_bug.cgi?id=228917) - Makes some flag SQL work with PostgreSQL by using the semantically equivalent INNER JOIN over a comma (,).
*   Bug [213679](https://bugzilla.mozilla.org/show_bug.cgi?id=213679) - Implement a parameter that allows administrators to control whether blank comments are allowed when filling new bugs.
*   Bug [232485](https://bugzilla.mozilla.org/show_bug.cgi?id=232485) - fix missing space between words.
*   Bug [232494](https://bugzilla.mozilla.org/show_bug.cgi?id=232494) - fix missing space between words.
*   Bug [232508](https://bugzilla.mozilla.org/show_bug.cgi?id=232508) - adds back missing space between "tell" and "[% terms.Bugzilla %]".
*   Bug [232447](https://bugzilla.mozilla.org/show_bug.cgi?id=232447) - Warns user about missing bug number instead of dying in GetBugLink().
*   Bug [232161](https://bugzilla.mozilla.org/show_bug.cgi?id=232161) - add ability to forget or edit saved searches when the search throws an error.
*   Bug [225043](https://bugzilla.mozilla.org/show_bug.cgi?id=225043) - enhance chart migration code to populate 'All Open' charts from historical data.
*   Bug [232164](https://bugzilla.mozilla.org/show_bug.cgi?id=232164) - Adds backwards-compatibility hack for changedin queries for newly created bugs and simplifies the code.
*   Bug [232160](https://bugzilla.mozilla.org/show_bug.cgi?id=232160) - adds the header back in to the "verify component, etc." page that appears when a user changes the product to which a bug belongs.
*   Bug [232154](https://bugzilla.mozilla.org/show_bug.cgi?id=232154) - Make old column lists work again by correctly translating old -> new column names.
*   Bug [232140](https://bugzilla.mozilla.org/show_bug.cgi?id=232140) - makes tests work on b.m.o by making BugMail.pm use Bugzilla::Util, which contains the trim() function BugMail.pm needs.
*   Bug [232150](https://bugzilla.mozilla.org/show_bug.cgi?id=232150) - Corrects "field changed" queries including [Bug creation] as one of the fields so that they actually work instead of taking forever. The query was structured as "[Bug creation] clause OR (bugs_activity JOIN clause OR (other field clauses))" when it should have been "bugs_activity JOIN CLAUSE AND ([Bug creation] clause OR other field clauses)"
*   Bug [183774](https://bugzilla.mozilla.org/show_bug.cgi?id=183774) - makes duplicates.xul compute a correct base URL when jarred so that links to bugs work.
*   Bug [232055](https://bugzilla.mozilla.org/show_bug.cgi?id=232055) - add more colours to line graphs (default is 7; we now have 16 - .)
*   Bug [227155](https://bugzilla.mozilla.org/show_bug.cgi?id=227155) - make sure running collectstats.pl twice in a day, or migrating data from old charts to new charts where there are duplicate entries, doesn't cause an SQL error.
*   Bug [231391](https://bugzilla.mozilla.org/show_bug.cgi?id=231391) - make "cumulate" option work on new charts, together with a few UI tweaks.
*   Bug [225075](https://bugzilla.mozilla.org/show_bug.cgi?id=225075) - Fix exact case search so it only selects bugs with matching case strings.
*   Bug [231026](https://bugzilla.mozilla.org/show_bug.cgi?id=231026) - improve the appearance of the buglist options at the bottom of the buglist.
*   Bug [36379](https://bugzilla.mozilla.org/show_bug.cgi?id=36379) - adds command-line switches for default product, component, and version to bug_email.pl
*   Bug [227026](https://bugzilla.mozilla.org/show_bug.cgi?id=227026) - remove obsolete MacsBug information from guided template (we no longer support OS 9.)
*   Backing out bug [230293](https://bugzilla.mozilla.org/show_bug.cgi?id=230293), we decided this was the wrong approach.
*   Backing out code change that was accidently left in the patch on bug [228894](https://bugzilla.mozilla.org/show_bug.cgi?id=228894) (see comment 9)
*   Bug [228894](https://bugzilla.mozilla.org/show_bug.cgi?id=228894) - Change HTML comments to template-toolkit ones for template version numbers.
*   Bug [224420](https://bugzilla.mozilla.org/show_bug.cgi?id=224420) - fix test bustage caused by accidental use of the word "bugs". Oops.
*   Bug [224420](https://bugzilla.mozilla.org/show_bug.cgi?id=224420) - add a warning that only public bugs are counted by the new charting system at the moment.
*   Bug [90468](https://bugzilla.mozilla.org/show_bug.cgi?id=90468) - Bugzilla does not log out automatically when closing the session.
*   Bug [229998](https://bugzilla.mozilla.org/show_bug.cgi?id=229998) - bugzilla-submit 'Operating-System' and 'URL' fields are rejected. Minor fixes to bugzilla-submit's argument parsing.
*   Bug [231037](https://bugzilla.mozilla.org/show_bug.cgi?id=231037) - remove JS popup from bug entry page.

## Stable (2.16) Branch Checkins Since the Last Status Update

The following is a list of specific bugs fixed (and their checkin messages) since the last Bugzilla status report. It is ordered by the checkin date as rendered by [Bonsai](http://bonsai.mozilla.org/). It includes checkins on the branch from 2003/11/03 to 2004/03/03\. This list was generated by filtering Bonsai's output on [that query](http://bonsai.mozilla.org/cvsquery.cgi?treeid=default&module=Bugzilla&branch=BUGZILLA-2_16-BRANCH&branchtype=match&dir=&file=&filetype=match&who=&whotype=match&sortby=Date&hours=2&date=explicit&mindate=2004-11-03+00:00&maxdate=2004-03-03+23:59&cvsroot=%2Fcvsroot) (with some manual adjustments).

Checkin manifest:

*   Bug [123077](https://bugzilla.mozilla.org/show_bug.cgi?id=123077) - improve the ValidatePassword sub so that a password change is no longer accepted with a blank second field
*   Bug [166755](https://bugzilla.mozilla.org/show_bug.cgi?id=166755) - improve checksetup.pl's error message when asking for administrator's password
*   Bug [137121](https://bugzilla.mozilla.org/show_bug.cgi?id=137121) - modify the way in which headers are printed in order to avoid printing them twice when reporting an error in createaccount.cgi
*   Bug [181106](https://bugzilla.mozilla.org/show_bug.cgi?id=181106) - edit-multiple.html.tmpl uses &apos which Internet Explorer cannot use. Changed the entity in the template to a literal apostrophe.
*   Bug [231691](https://bugzilla.mozilla.org/show_bug.cgi?id=231691) - fix used only once error in Perl 5.00503
*   Bug [224815](https://bugzilla.mozilla.org/show_bug.cgi?id=224815) - The check-in for bug [212095](https://bugzilla.mozilla.org/show_bug.cgi?id=212095) (which fixed a forward-compatibility problem with DBD::mysql) created a backward compatibility issue with DBI (unintentionally bumped the required minimum DBI version). This checkin puts the proper code in place to allow the minimum stated DBI according to the Bugzilla 2.16 documentation as well as the current DBI version as of this writing.
*   Bug [228706](https://bugzilla.mozilla.org/show_bug.cgi?id=228706) - Fixes invalid expiration dates on almost all of the cookies. Amazingly it mostly worked before. It'll work better now. :)
*   Bug [227513](https://bugzilla.mozilla.org/show_bug.cgi?id=227513) - Add text to shadowdb param description to indicate that the privileges to access the shadowdb must be granted from MySQL prior to entering the shadowdb name in the param.
*   Bug [227510](https://bugzilla.mozilla.org/show_bug.cgi?id=227510) - The shadowdb parameter wasn't getting detainted before using it to create the shadowdb.
*   Bug [121419](https://bugzilla.mozilla.org/show_bug.cgi?id=121419) - Use the most-specific cookie if more than one exists with different cookiepaths. Should help ease login troubles related to the cookiepath setting.
*   Bug [188712](https://bugzilla.mozilla.org/show_bug.cgi?id=188712) - Safari thinks it's Gecko, but it doesn't support server-push. Look for it and don't give it server-push.
*   Bug [225474](https://bugzilla.mozilla.org/show_bug.cgi?id=225474) - Fixing regression from bug [217422](https://bugzilla.mozilla.org/show_bug.cgi?id=217422), xml.cgi got busted, and the patch from bug [217422](https://bugzilla.mozilla.org/show_bug.cgi?id=217422) (MySQL 4 compatibility for show_bug) didn't accomplish what it was supposed to anyway. This checkin fixes both.
*   Bug [95430](https://bugzilla.mozilla.org/show_bug.cgi?id=95430) - Reopening bugs from the "change several bugs at once" page did not work.

## Conclusion and Credits

Well, that's it for this status update. We'd like to thank everybody who submitted a patch, helpful comment or bug to Bugzilla -- it's very much appreciated, even when everybody's too busy to stop and say "great work"; we always mean it! Let's work together to make 2.18 the killer release we all want it to be.
