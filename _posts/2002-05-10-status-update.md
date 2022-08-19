---
title: "Bugzilla Status Update"
date: 2002-05-10
author: ["justdave"]
categories:
- Status
---

## Introduction

At long last we are really and truly in the final countdown for the 2.16 release! Tonight we've released 2.16rc1 (first release candidate). As of this time, there are no code bugs remaining targeted for the 2.16 release. The documentation is still incomplete, and will be updated again before the 2.16 release, but the code is basically what we'd like to release, unless any regression bugs are found of course. Check out our [downloads page](https://www.bugzilla.org/download.html) to pick up a copy of the Release Candidate and try it out! Remember we do NOT recommend using the release candidate for production use. You may do so at your own risk. However, if you have someplace to test it out, by all means do so. If you find any regression bugs, please let us know! Win32 users, see note below.

## Highly Misleading & Meaningless Statistics

|Date|2.16 Bugs With Patches Waiting For Review|2.16 Bugs Waiting For Patches|2.16 Release Blockers|2.18 Bugs|Other Bugs|
|--- |--- |--- |--- |--- |--- |
|2002-05-08|0 bugs|0 bugs|2 bugs|597 bugs|410 bugs|
|2002-04-16|11 bugs|4 bugs|5 bugs|541 bugs|437 bugs|
|2002-04-07|8 bugs|8 bugs|9 bugs|494 bugs|465 bugs|
|2002-03-03|16 bugs|17 bugs|23 bugs|487 bugs|430 bugs|
|2002-02-13|24 bugs|21 bugs|23 bugs|481 bugs|405 bugs|
|2002-02-11|34 bugs|35 bugs|27 bugs|477 bugs|396 bugs|
|2002-01-18|49 bugs|61 bugs|34 bugs|459 bugs|337 bugs|
|2001-10-19|112 bugs|329 bugs||36 bugs|299 bugs|

The two remaining "blocker" bugs are the [release tracking bug](https://bugzilla.mozilla.org/show_bug.cgi?id=97495 "Bug 97495 - 2.16 Release Tracking Bug"), and the [release notes](https://bugzilla.mozilla.org/show_bug.cgi?id=97496 "Bug 97496 - 2.16 Release Notes").

## Templatisation Update

One of the biggest and most overwhelming changes in Bugzilla since 2.14 is that all of the customer-visible files have been converted to use HTML templates using Template Toolkit. This has the potential to make migration from an older Bugzilla a royal pain if you've done any customizing, since this essentially amounted to a rewrite of a _huge_ chunk of Bugzilla (and is the main reason this release is so far behind schedule). If you survive this update, all of our future updates should be _tremendously_ easier, though, since you can now customize the look and feel of your site without having to touch Perl code.

The administrative pages are scheduled to go through this same process during the next development cycle.

The template directory has been completely **moved** from it's former location in the CVS repository earlier in the 2.15/2.16 development cycle, to drop things a level deeper in the hierarchy in preparation for localization/internationalization efforts in the near future. The shipped templates now reside in template/en/default instead of template/default. 'en' being the language code for English of course. There are already translations in the works for at least Spanish and German, and efforts will be made early in the next development cycle to make this more seamless and integrate with the user's browser preferences as well.

<a name="win32"></a>

## Email sending is broken on Win32

Unfortunately, the templatization of process_bug.cgi broke the ability for Bugzilla to send bug update notifications via email on Windows due to the way ActiveState Perl handles fork(). There is a fix for this in the works, but it involves **major** code changes, and we didn't want to hold up the 2.16 release for another month to give it adequate testing. The bottom line is, if you're using Win32, you **do not want** Bugzilla 2.16. There will be a 2.16.1 release which includes this fix as soon as it's ready. For up-to-date information on this topic, see bugs [124174](https://bugzilla.mozilla.org/show_bug.cgi?id=124174 "processmail should be a package") and [84876](https://bugzilla.mozilla.org/show_bug.cgi?id=84876 "MTA Config do-it-all patch").

## 2.16 Goals

The current goals for our 2.16 release are still:

*   HTML 4.01 Transitional compliance. (this is being handled in tandem with the templatization) **(complete)**
*   Templatization of all customer-visible CGI pages, to allow easy customization by the administrator **(complete)**
*   Allow users to change their own email addresses, instead of having to bug the site admin (using verification emails sent to both the old and new addresses to validate the change) **(complete)**
*   Remove old attachment code in favor of the new attachment tracker system. **(complete)**
*   Enable Perl's taint mode for all user accesable files, and taint-check anything being sent to the database.**(complete)**

As always, for an up to date list, see [the roadmap](/about/#milestones).

## Upcoming Major Features

Major new features are being working on. If you would like to know when we plan on adding one of these feature, you can get that information from the bug requesting its implementation. These include:

*   Ability to send email via SMTP instead of relying on a local installation of sendmail. (Bug [84876](https://bugzilla.mozilla.org/show_bug.cgi?id=84876))
*   PostgreSQL support. (Bug [98304](https://bugzilla.mozilla.org/show_bug.cgi?id=98304 "Allow Bugzilla to work with Postgres SQL (PgSQL)"))
*   Ability to have more than 55 groups, which will also allow a finer grained rights system to be introduced. (Bug [68022](https://bugzilla.mozilla.org/show_bug.cgi?id=68022 "Need more than 55 groups"))
*   Ability to add generic customized fields to bugs (Bug [91037](https://bugzilla.mozilla.org/show_bug.cgi?id=91037 "a generic implementation for custom fields"))
*   Customised resolutions, that allow adding, removing, deactivating and renaming of resolutions. (Bug [94534](https://bugzilla.mozilla.org/show_bug.cgi?id=94534 "Customised resolutions."))
*   Expanding the e-mail preferences to allow watching components, keywords, etc. (Bug [73665](https://bugzilla.mozilla.org/show_bug.cgi?id=73665 "Need an "emailprefs" table"))
*   Request tracker, for managing requests to change things about bugs. (Bug [98801](https://bugzilla.mozilla.org/show_bug.cgi?id=98801 "request tracker"))
*   `mod_perl` support. (Bug [87406](https://bugzilla.mozilla.org/show_bug.cgi?id=87406 "Make Bugzilla work with mod_perl (under Apache)"))
*   New makefile-based installation system ([Bug 104660](https://bugzilla.mozilla.org/show_bug.cgi?id=104660), [Bug 105854](https://bugzilla.mozilla.org/show_bug.cgi?id=105854), [Bug 105855](https://bugzilla.mozilla.org/show_bug.cgi?id=105855), and [Bug 105856](https://bugzilla.mozilla.org/show_bug.cgi?id=105856))

## Checkins Since the Last Status Update

The following is a list of specific bugs fixed (and their checkin messages) since the last Bugzilla status report. It is ordered by the checkin date, as ordered by Bonsai. It includes checkins from 03/03/2002 to 05/20/2002\. _This_ list was generated by filtering the output from Bonsai; if you're interested, you can [run the query for yourself](http://bonsai.mozilla.org/cvsquery.cgi?treeid=default&module=Bugzilla&branch=HEAD&branchtype=match&dir=&file=&filetype=match&who=&whotype=match&sortby=Date&hours=2&date=explicit&mindate=03%2F03%2F2002&maxdate=05%2F20%2F2002&cvsroot=%2Fcvsroot).

The following general checkins were made without reference to any specific bugs:

*   5/8/2002 - Documentation and Bugzilla Guide updates (Gerv)
*   5/1/2002 - Documentation updates (Gerv)
*   5/1/2002 - Documentation recompile and trial/error updates (justdave)
*   4/24/2002 - tinderbox bustage fixes and .cvsignore updates (justdave/Gerv)
*   4/17/2002 - Missing version string; fixed due to tinderbox bustage (bbaetz)
*   Various other random tinderbox bustage fixes ;-)

And now... for da big list:

*   Bug [143124](https://bugzilla.mozilla.org/show_bug.cgi?id=143124 "unable to access preferences"), Fix warning messages about *::TESTOUT and clean up test code. Patch makes the tests much better now.
*   Bug [143091](https://bugzilla.mozilla.org/show_bug.cgi?id=143091 "No email to the qa contact when creating bugs") - No email to the qa contact when creating bugs.
*   Bug [143040](https://bugzilla.mozilla.org/show_bug.cgi?id=143040 "Tidy up remove parameters message in checksetup.pl") - Tidy up remove parameters message in checksetup.pl.
*   Bug [143066](https://bugzilla.mozilla.org/show_bug.cgi?id=143066 "Footer shows as logged out on show_bug.cgi") - footer shows as logged out on show_bug.cgi.
*   Bug [143045](https://bugzilla.mozilla.org/show_bug.cgi?id=143045 "Bug groups text is unclear") - Bug groups text is unclear.
*   Bug [142950](https://bugzilla.mozilla.org/show_bug.cgi?id=142950 "Queries in footer don't work properly") - query links in footer are broken.
*   Bug [140437](https://bugzilla.mozilla.org/show_bug.cgi?id=140437 "Clean up parameters") - clean up parameters.
*   Bug [142231](https://bugzilla.mozilla.org/show_bug.cgi?id=142231 "template/.cvsignore should contain es, de, ... not custom") - template/.cvsignore should contain es, de, but not custom.
*   bug [142792](https://bugzilla.mozilla.org/show_bug.cgi?id=142792 "Output from checksetup.pl contains misspelled words") - Output from checksetup.pl contains misspelled words.
*   Bug [140435](https://bugzilla.mozilla.org/show_bug.cgi?id=140435 "Templatise GetCommandMenu") - Templatise GetCommandMenu.
*   Bug [135543](https://bugzilla.mozilla.org/show_bug.cgi?id=135543 "@Support::Templates::testitems does not list all templates") - @Support::Templates::testitems does not list all templates
*   Bug [134571](https://bugzilla.mozilla.org/show_bug.cgi?id=134571 "client-side image maps in showdependencygraph.cgi") - client-side image maps in showdependencygraph.cgi
*   Bug [140355](https://bugzilla.mozilla.org/show_bug.cgi?id=140355 "Warn the user about not using a web server group") - warn the user about not using a webserver group
*   Bug [140993](https://bugzilla.mozilla.org/show_bug.cgi?id=140993 "Pass javascript correctly in PutHeader()") - Pass javascript correctly into header; templatise the rest of the header-related parameters.
*   Bug [141036](https://bugzilla.mozilla.org/show_bug.cgi?id=141036 "Add INTERFACE comments to some templates") - add INTERFACE comments to all templates. This does the first 20 or so - many more to go...
*   Rename getSelection to get_selection. Fixes bug [141716](https://bugzilla.mozilla.org/show_bug.cgi?id=141716 "Mozilla context menu broken on query.cgi"), Mozilla context menus were broken on query.cgi because of getSelection overriding the native method which is used by Mozilla's context menu code.
*   Bug [139313](https://bugzilla.mozilla.org/show_bug.cgi?id=139313 "fatal warning in buglist.cgi") - warning in buglist.cgi when votes isn't a parameter
*   Bug [135836](https://bugzilla.mozilla.org/show_bug.cgi?id=135836 "change requests should include expiration details") - change requests should include expiration details.
*   Bug [141609](https://bugzilla.mozilla.org/show_bug.cgi?id=141609) - "Version unspecified" error when changing product with product groups enabled.
*   Bug [97496](https://bugzilla.mozilla.org/show_bug.cgi?id=97496 "2.16 Release Notes Bug") - Release notes updates.
*   Bug [141635](https://bugzilla.mozilla.org/show_bug.cgi?id=141635 "dependency graph requires bug id when requesting 'doall'") - showdependencygraph requires bug number for doall.
*   Bug [117936](https://bugzilla.mozilla.org/show_bug.cgi?id=117936 ".htaccess files for Apache 1.2.x (<Files>, not <FilesMatch>)") - deprecate Apache 1.2 as our .htaccess files don't work with it.
*   Bug [125395](https://bugzilla.mozilla.org/show_bug.cgi?id=125395 "Should move revision history below table of contents in docs index") - remove revision history. That's what CVS is for :-) Also, do other tidy-ups and updates to front page.
*   Bug [105877](https://bugzilla.mozilla.org/show_bug.cgi?id=105877 "Backup & check for modifications before upgrade.") - Backup & check for modifications before upgrade.
*   Bug [137709](https://bugzilla.mozilla.org/show_bug.cgi?id=137709 "Settings for Email Notification do not appear on user screen") - remove incorrect information about email preferences.
*   Bug [111712](https://bugzilla.mozilla.org/show_bug.cgi?id=111712 "Changing path to Perl in all Bugzilla files") - update command for changing path to Perl.
*   Bug [126907](https://bugzilla.mozilla.org/show_bug.cgi?id=126907 "Remove Future from Bugzilla Guide.") - remove "Future" section from guide.
*   Bug [141557](https://bugzilla.mozilla.org/show_bug.cgi?id=141557) - modification to user deletion code in editusers.cgi - prevent allowuserdeletion being bypassed.
*   Bug [140770](https://bugzilla.mozilla.org/show_bug.cgi?id=140770 "Navigation doesn't work after creating a new bug") - Navigation doesn't work after creating a new bug. This fix displays a new bug to the user immediately after it's been filed.
*   Bug [141385](https://bugzilla.mozilla.org/show_bug.cgi?id=141385 "dependency graph title is incorrect when doall is specified") - dependency graph title is incorrect when doall is specified.
*   Bug [141326](https://bugzilla.mozilla.org/show_bug.cgi?id=141326 "broken hyperlink in editkeywords.cgi") - broken hyperlink in editkeywords.cgi.
*   Bug [140311](https://bugzilla.mozilla.org/show_bug.cgi?id=140311 "query.cgi, search/seach.html.tmpl: should move some strings to template") - query.cgi, search/seach.html.tmpl: should move some strings to template.
*   Bug [140664](https://bugzilla.mozilla.org/show_bug.cgi?id=140664 "checksetup.pl fails on perl 5.005") - checksetup.pl fails on perl 5.005\.
*   Bug [140564](https://bugzilla.mozilla.org/show_bug.cgi?id=140564 "Unquoted variable in regexp in globals.pl.") - Unquoted variable in regexp in globals.pl.
*   Bug [140329](https://bugzilla.mozilla.org/show_bug.cgi?id=140329 "Stagger headers have wrong order (buglist.cgi/table.html.tmpl)") - Stagger headers have wrong order.
*   Bug [140784](https://bugzilla.mozilla.org/show_bug.cgi?id=140784 "edit*.cgi need a use lib ") - edit*.cgi need a use lib "." on Win32/IIS w/ taint.
*   Bug [140953](https://bugzilla.mozilla.org/show_bug.cgi?id=140953 "Creating the first attachment status fails") - Creating the first attachment status fails.
*   Bug [140553](https://bugzilla.mozilla.org/show_bug.cgi?id=140553 "Remaining instance of uri filter.") - remaining instances of uri filter.
*   Bug [137623](https://bugzilla.mozilla.org/show_bug.cgi?id=137623 "showdependencytree.cgi has minor grammatical and formatting issues") - showdependencytree.cgi has minor grammatical and formatting issues.
*   Bug [140765](https://bugzilla.mozilla.org/show_bug.cgi?id=140765 "midair collision has a template error") - midair template has an error.
*   Bug [140006](https://bugzilla.mozilla.org/show_bug.cgi?id=140006 "ThrowTemplateError should try the error template first") - ThrowTemplateError should try a template before using print statements.
*   Bug [138904](https://bugzilla.mozilla.org/show_bug.cgi?id=138904 "Should post_bug templates be separate?") - post_bug templates should be separate. Renaming template so that the name's not so long, and we can use formats.
*   Bug [138904](https://bugzilla.mozilla.org/show_bug.cgi?id=138904 "Should post_bug templates be separate?") - post_bug templates should be separate.
*   Bug [140103](https://bugzilla.mozilla.org/show_bug.cgi?id=140103 "Templatisation odds and ends") - various templatisations or cleanups in CGI.pl.
*   Bug [140633](https://bugzilla.mozilla.org/show_bug.cgi?id=140633 "directory datatemplate created in the bugzilla root directory"): Template Toolkit bug causes directory "datatemplate" to be created in the Bugzilla root directory instead of creating "template" within the "data" directory. Adding a trailing slash to the compile directory name to work around it.
*   Bug [138284](https://bugzilla.mozilla.org/show_bug.cgi?id=138284 "Tweak Bugzilla to prepare for simple enter bug template") - prepare for Bugzilla Helper replacement enter_bug template.
*   Bug [105960](https://bugzilla.mozilla.org/show_bug.cgi?id=105960 "xml.cgi and other future xml pages generate invalid XML") - xml.cgi has wrong content type, and should be standalone
*   Bug [97832](https://bugzilla.mozilla.org/show_bug.cgi?id=97832 "turn on template pre-compilation") - turn on template compilation. This means that the minimum TT version is now 2.07\.
*   Bug [138994](https://bugzilla.mozilla.org/show_bug.cgi?id=138994 "Split duplicates.html.tmpl up") - split up duplicates.html.tmpl.
*   Bug [140419](https://bugzilla.mozilla.org/show_bug.cgi?id=140419 "query.cgi fails after search.html.tmpl has been splited") - fix merge error from bug [138995](https://bugzilla.mozilla.org/show_bug.cgi?id=138995). Oops.
*   Bug [140407](https://bugzilla.mozilla.org/show_bug.cgi?id=140407 "Expunge template/default and template/custom references") - remove all references to directories template/default and template/custom. They are no more. Oceania is at war with Eastasia. Oceania has always been at war with Eastasia.
*   Move a \</center> tag (inserted in bug [129442](https://bugzilla.mozilla.org/show_bug.cgi?id=129442 "Make HTML of a default installation HTML W3C compliant") in a vain attempt to make this CGI's HTML validate) to the bottom of the initial page. This has the effect of fixing the alignment of the "choose chart" widgets; returning them back to the centre, where it should be. No bug number.
*   Bug [138995](https://bugzilla.mozilla.org/show_bug.cgi?id=138995 "Split up search.html.tmpl") - split up search.html.tmpl.
*   Bug [139930](https://bugzilla.mozilla.org/show_bug.cgi?id=139930 "checksetup.pl fails if data/params doesn't exist") - checksetup.pl no longer fails if data/params does not exist
*   Bug [139759](https://bugzilla.mozilla.org/show_bug.cgi?id=139759 "'Any of: CC list member' causes problems if used with 'Any of: bug owner'") - gets email searches for "cc: list or assignee" working again.
*   Bug [140354](https://bugzilla.mozilla.org/show_bug.cgi?id=140354 "edit attachment as comment displays pre- and post- html tags") - Prevents "edit attachment as comment" from displaying opening and closing HTML tags on recent versions of Mozilla by making the regexp that finds and removes them case-insensitive.
*   Bug [135817](https://bugzilla.mozilla.org/show_bug.cgi?id=135817 "templatise Token.pm") - update template filename. Oops.
*   Bug [140124](https://bugzilla.mozilla.org/show_bug.cgi?id=140124 "PuntTryAgain must die") - PuntTryAgain must die.
*   Bug [135814](https://bugzilla.mozilla.org/show_bug.cgi?id=135814 "Crash on viewing p3p policy summary") - templatise Token.pm.
*   Bug [139588](https://bugzilla.mozilla.org/show_bug.cgi?id=139588 "TT 2.07 problem: newly added columns are only one (1) character wide"): changes "size" to "maxlength" in abbreviations hash since "size" is a hash built-in method in Template Toolkit 2.[07](https://bugzilla.mozilla.org/show_bug.cgi?id=07)
*   Bug [140161](https://bugzilla.mozilla.org/show_bug.cgi?id=140161 "SyncAnyPendingShadowChanges call in footer.html.tmpl displays 0"): Prevents function call from displaying its return value, which we don't need.
*   Bug [140145](https://bugzilla.mozilla.org/show_bug.cgi?id=140145 "GetLongDescriptionAsHTML must die") - GetLongDescriptionAsHTML must die.
*   Bug [140121](https://bugzilla.mozilla.org/show_bug.cgi?id=140121 "We need to start calling SyncAnyPendingShadowChanges again") - make sure we keep calling SyncAnyPendingShadowChanges from the footer.
*   Bug [140110](https://bugzilla.mozilla.org/show_bug.cgi?id=140110 "Remove redundant code from CGI.pl") - remove 273 lines of redundant code from CGI.pl.
*   Bug [139928](https://bugzilla.mozilla.org/show_bug.cgi?id=139928 "remove templates from template/default/") - cvs remove templates from template/default directory. These templates now all live in template/en/default, for l[10](https://bugzilla.mozilla.org/show_bug.cgi?id=10)n purposes.
*   Bug [137183](https://bugzilla.mozilla.org/show_bug.cgi?id=137183 "userprefs.cgi: tab names should be in the template not in the .cgi") - tab names should be in the template not in the .cgi.
*   Bug [126571](https://bugzilla.mozilla.org/show_bug.cgi?id=126571 "param removal is shown to users in userprefs.cgi"): prevents display of messages to end-users about parameters being removed when an installation upgrades to a later version of Bugzilla from which some parameters have been removed.
*   Bug [138456](https://bugzilla.mozilla.org/show_bug.cgi?id=138456 "adding invalid addresses to CC list results in html error displayed as text") - use proper error functions in DBNameToIdAndCheck.
*   Bug [139632](https://bugzilla.mozilla.org/show_bug.cgi?id=139632 "ConnectToDatabase misuse - partial fix for 2.16"): connect to the database in enter_bug.cgi in case it is time to rebuild the version cache, which needs a database connection.
*   Bug [125066](https://bugzilla.mozilla.org/show_bug.cgi?id=125066 "Have to set milestone when accepting bug") - remove the need to set a milestone on accept for products with just one milestone.
*   Bug [136180](https://bugzilla.mozilla.org/show_bug.cgi?id=136180 "'FILTER html' used in *.txt.tmpl files instead of 'FILTER uri'") - use uri/url_quote filters correctly.
*   Bug [139800](https://bugzilla.mozilla.org/show_bug.cgi?id=139800 "Change references to index.html to index.cgi") - remove errant references to index.html.
*   Bug [139787](https://bugzilla.mozilla.org/show_bug.cgi?id=139787 "Fix Tinderbox bustage caused by various patches") - more template name fixes to stop tree burning.
*   Bug [138588](https://bugzilla.mozilla.org/show_bug.cgi?id=138588 "Convert CGIs to call new templates") - missed a DisplayError -> ThrowTemplateError change.
*   Bug [138588](https://bugzilla.mozilla.org/show_bug.cgi?id=138588 "Convert CGIs to call new templates") - change to use new template structure.
*   Bug [138582](https://bugzilla.mozilla.org/show_bug.cgi?id=138582 "Convert (almost) all INCLUDEs to PROCESSes in templates") - convert all INCLUDEs to PROCESS.
*   Bug [124587](https://bugzilla.mozilla.org/show_bug.cgi?id=124587 "lock the bugs table for writing when inserting a new bug"): Lock bugs table before inserting new bug.
*   Bug [138604](https://bugzilla.mozilla.org/show_bug.cgi?id=138604 "Make the Bugzilla Sidebar use valid XUL"), make the bugzilla sidebar use valid XUL plus some template cleanup.
*   Bug [139051](https://bugzilla.mozilla.org/show_bug.cgi?id=139051 "Two typos") - fix misspelling of "privilege".
*   Bug [135707](https://bugzilla.mozilla.org/show_bug.cgi?id=135707 "normalize template filenames") - rearrange templates to normalise filenames, and create directory structure which allows for localised versions of the templates. Earlier versions of these templates can be found, cvs removed, scattered around bugzilla/template/default; but there are no substantial changes between their initial checkin there and here.
*   Bug [125013](https://bugzilla.mozilla.org/show_bug.cgi?id=125013 "ProcessMultipartFormFields hangs"): ProcessMultipartFormFields in CGI.pl would hang if the posting browser included regexp metacharacters in its boundary string.
*   Bug [138581](https://bugzilla.mozilla.org/show_bug.cgi?id=138581 "Add template/en/default and template/en/custom to the template search path") - add template/en/* to the search path.
*   Bug [135707](https://bugzilla.mozilla.org/show_bug.cgi?id=135707 "normalize template filenames") - make template/en/default templates consistent with template/default.
*   Bug [135707](https://bugzilla.mozilla.org/show_bug.cgi?id=135707 "normalize template filenames") - rearrange templates to normalise filenames, and create directory structure which allows for localised versions of the templates. Earlier versions of these templates can be found, cvs removed, scattered around bugzilla/template/default; but there are no substantial changes between their initial checkin there and here.
*   Bug [138064](https://bugzilla.mozilla.org/show_bug.cgi?id=138064 "False-positive error message in checksetup.pl when checking for ") - False-positive error message in checksetup.pl when checking for "png" in data/webdot/.htaccess.
*   Bug [135707](https://bugzilla.mozilla.org/show_bug.cgi?id=135707 "normalize template filenames") - rearrange templates to normalise filenames, and create directory structure which allows for localised versions of the templates. Earlier versions of these templates can be found, cvs removed, scattered around bugzilla/template/default; but there are no substantial changes between their initial checkin there and here.
*   Bug [12004](https://bugzilla.mozilla.org/show_bug.cgi?id=12004 "Missing </A> tags prevents access to all links except the 1st"): need info on Template and AppConfig in the help docs.
*   Bug [137954](https://bugzilla.mozilla.org/show_bug.cgi?id=137954 "Empty ") - Empty "move-button-text" field blocks changing bugs.
*   Bug [126792](https://bugzilla.mozilla.org/show_bug.cgi?id=126792 "Templatise showdependencytree.cgi"): Templatizes showdependencytree.cgi.
*   Bug [135545](https://bugzilla.mozilla.org/show_bug.cgi?id=135545 "More templates with missing versions") - missing template version strings.
*   Bug [136754](https://bugzilla.mozilla.org/show_bug.cgi?id=136754 "warning in editproduct.cgi if usebuggroups option is on") - warning in editproduct.cgi if usebuggroups option is on.
*   Bug [137589](https://bugzilla.mozilla.org/show_bug.cgi?id=137589 "Tinderbox is stuck waiting for input from CGI.pm in process/verify-new-product.html.tmpl") - fix test 4 not to hang on the "use CGI" in the template.
*   Bug [136506](https://bugzilla.mozilla.org/show_bug.cgi?id=136506 "can't create new accounts cvs tip 4/8/02"): work-around taint error on Perl 5.005\.
*   bug [117718](https://bugzilla.mozilla.org/show_bug.cgi?id=117718 "Mass Change removes a bugs groupset if the bug was in the wrong product group") - Mass Change removes a bugs groupset if the bug was in the wrong product group
*   Bug [125427](https://bugzilla.mozilla.org/show_bug.cgi?id=125427 "Taint error in duplicates.cgi with perl < 5.6 (") - Taint error in duplicates.cgi with perl < 5.6
*   Bug [137669](https://bugzilla.mozilla.org/show_bug.cgi?id=137669 "Remove <nobr>"): remove <nobr> tags from attachment status lists
*   Bug [121247](https://bugzilla.mozilla.org/show_bug.cgi?id=121247 "enter_bug comment templates") - enter_bug comment templates. Template method for amalgamation of free-form enter_bug text fields into the description.
*   Bug [134198](https://bugzilla.mozilla.org/show_bug.cgi?id=134198 "addition for step_by_step installation file"): Warns installations about Apache configuration issue with security ramifications.
*   Bug [92763](https://bugzilla.mozilla.org/show_bug.cgi?id=92763 "Add Windows XP as OS selection for entering/searching bugs") Add Windows XP as OS selection for entering/searching bugs
*   Bug [135666](https://bugzilla.mozilla.org/show_bug.cgi?id=135666 "Creating bugs: OS detection doesn't work for Internet Explorer, Win NT 4.0") Creating bugs: OS detection doesn't work for Internet Explorer, Win NT 4\. Adds Windows XP to the bugzilla OS list Activates the Windows XP detection (it was commented out waiting for this fix...) Makes Windows NT (4) detection match the pattern everything else used
*   Bug [129442](https://bugzilla.mozilla.org/show_bug.cgi?id=129442 "Make HTML of a default installation HTML W3C compliant") - make html of a default installation (mostly) HTML 4.01 transitional compliant Original
*   Bug [136751](https://bugzilla.mozilla.org/show_bug.cgi?id=136751 "warning in show_bug.cgi") - warnings with show_bug.cgi
*   Bug [110980](https://bugzilla.mozilla.org/show_bug.cgi?id=110980 "no email to CC list when opening new bug") - no email to cc list when opening new bug
*   Bug [136227](https://bugzilla.mozilla.org/show_bug.cgi?id=136227 "Perl syntax in runtests.sh causes error message when passing in arguments"): Corrects syntax error in bash script.
*   Bug [125660](https://bugzilla.mozilla.org/show_bug.cgi?id=125660 "Templatise process_bug.cgi"): Templatizes process_bug.cgi.
*   Bug [119635](https://bugzilla.mozilla.org/show_bug.cgi?id=119635 "Templatise duplicates.cgi") - templatise duplicates.cgi.
*   Byg [136003](https://bugzilla.mozilla.org/show_bug.cgi?id=136003 "two extra spaces after every comment") - two extra spaces after every comment
*   Bug [133423](https://bugzilla.mozilla.org/show_bug.cgi?id=133423 "Audit templates for FILTER usage") - Audit templates for FILTER usage
*   Bug [134575](https://bugzilla.mozilla.org/show_bug.cgi?id=134575 "defparams.pl::WriteParams makes data directory world writable") - some scripts trying to make world writable directories
*   Bug [135815](https://bugzilla.mozilla.org/show_bug.cgi?id=135815 "Regression on CGI.pl for link to showvotes.cgi") - Regression on CGI.pl for link to showvotes.cgi.
*   Bug [135473](https://bugzilla.mozilla.org/show_bug.cgi?id=135473 "Using back button after failure on attachment.cgi does not disable radio buttons when patch checkbox is checked") - Using back button after failure on attachment.cgi does not disable radio buttons when patch checkbox is checked.
*   Bug [135469](https://bugzilla.mozilla.org/show_bug.cgi?id=135469 "Missing version in show/dependency-graph.html.tmpl (tree is a-burinin')") - missing version string (tree's afire).
*   Bug [126456](https://bugzilla.mozilla.org/show_bug.cgi?id=126456 "Fix our error handling") - fix our error handling. Change the name of the functions to something more sane; a few enhancements.
*   bug [134562](https://bugzilla.mozilla.org/show_bug.cgi?id=134562 "taint error in buglist.cgi") - taint error in buglist.cgi
*   Bug [117760](https://bugzilla.mozilla.org/show_bug.cgi?id=117760 "Templatise showvotes.cgi and incorporate doeditvotes.cgi") - Templatise showvotes.cgi and incorporate doeditvotes.cgi.
*   Bug [124920](https://bugzilla.mozilla.org/show_bug.cgi?id=124920 "Templatise post_bug.cgi") - Templatise post_bug.cgi.
*   Bug [126793](https://bugzilla.mozilla.org/show_bug.cgi?id=126793 "Templatise showdependencygraph.cgi") - templatise showdependencygraph.cgi.
*   Bug [135291](https://bugzilla.mozilla.org/show_bug.cgi?id=135291 "template version strings break templates"): add version string to new templates and fix the string for non xml templates.
*   Bug [130373](https://bugzilla.mozilla.org/show_bug.cgi?id=130373 "Sorting by Target Milestone in templatized buglist.cgi generates bogus error") - sorting by target milestone genreated bogus error
*   Bug [127200](https://bugzilla.mozilla.org/show_bug.cgi?id=127200 "Query for CC takes long time") - query for cc takes long time
*   Bug [126883](https://bugzilla.mozilla.org/show_bug.cgi?id=126883 "bugzilla.dtd isn't quite correct") - bugzilla.dtd isn't quite correct
*   Partial fix for bug [104600](https://bugzilla.mozilla.org/show_bug.cgi?id=104600 "template/custom gets pruned on cvs update -dP"): Adds "template/custom" to .cvsignore.
*   Bug [126456](https://bugzilla.mozilla.org/show_bug.cgi?id=126456 "Fix our error handling") - improve our error handling.
*   New version of bug writing guidelines - bug [131345](https://bugzilla.mozilla.org/show_bug.cgi?id=131345 "Placeholder bug for revision to Bugzilla distribution of Bug Writing Guidelines"). Written by Eli (eli@prometheus-music.com),
*   Bug [98658](https://bugzilla.mozilla.org/show_bug.cgi?id=98658 "Add version headers to all templates in preparation for later admin notification of template changes."): Let administrator know which customised templates have been updated by Bugzilla team. Patch adds a version string to every template and a check in t/004template.t to check for version strings in templates. Note that two templates that were not included in the initial patch now have version strings added.
*   Bug [126801](https://bugzilla.mozilla.org/show_bug.cgi?id=126801): Suppress display of secure products to users who are not authorized to access those products. Only matters for installations using the "product groups" feature.
*   Bug [124937](https://bugzilla.mozilla.org/show_bug.cgi?id=124937 "Templatise show_activity.cgi") - templatise show_activity.cgi.
*   Bug [109528](https://bugzilla.mozilla.org/show_bug.cgi?id=109528 "Can't query for attachment status != value if patch has no statuses") - Can't query for attachment status != value if patch has no statuses
*   Bug [82143](https://bugzilla.mozilla.org/show_bug.cgi?id=82143 "Reversing dependencies causes ") and bug [95594](https://bugzilla.mozilla.org/show_bug.cgi?id=95594): Attempting to reverse dependencies falsely reported a circular dependency loop, and setting both the blocks and depends at the same time allowed a real dependency loop to be created.
*   Bug [120537](https://bugzilla.mozilla.org/show_bug.cgi?id=120537 "Dependency graphs take forever to load, and are larger than necessary") (b) - fix previous patch to not complain if there's no .htaccess file.
*   Bug [132939](https://bugzilla.mozilla.org/show_bug.cgi?id=132939) - "zarro bugs found" is no more
*   Remaining pieces of Bug [23067](https://bugzilla.mozilla.org/show_bug.cgi?id=23067 "Should have some way to change the email account") from yesterday... no idea why the first commit didn't pick these up.
*   Bug [107513](https://bugzilla.mozilla.org/show_bug.cgi?id=107513 "Can't change params on installation with no webservergroup"): Makes it possible to change parameters on an installation where access to the scripts is not limited to the web server user.
*   Bug [133833](https://bugzilla.mozilla.org/show_bug.cgi?id=133833 "Error in templatized version of userprefs.cgi"). Error in templatized version of userprefs.cgi. Error with ExcludeSelf form variable being all lowercase.
*   Bug [23067](https://bugzilla.mozilla.org/show_bug.cgi?id=23067 "Should have some way to change the email account"): Allow the user to change their email address through the preferences. Sends out tokens in email to both addresses which have to be confirmed by the new address, and can be cancelled by the old one. Entering your password on the preferences page is required to initiate the process.
*   Bug [134465](https://bugzilla.mozilla.org/show_bug.cgi?id=134465 "We die if the admin email address doesn't match the regexp") - Don't die() if the admin email address doesn't match the regexp.
*   Better fix for bug [132929](https://bugzilla.mozilla.org/show_bug.cgi?id=132929 "buglist.cgi "), buglist.cgi "long format" button doesn't work.
*   Bug [133425](https://bugzilla.mozilla.org/show_bug.cgi?id=133425 "Audit show_bug.html.tmpl for FILTER usage"): adding missing FILTERs in the template
*   Bug [92263](https://bugzilla.mozilla.org/show_bug.cgi?id=92263 "Don't output SQL commands before the footer."): Don't output SQL commands before the footer when syncshadowdb fails (only affects Bugzillas that are running shadow databases)
*   Bug [120537](https://bugzilla.mozilla.org/show_bug.cgi?id=120537 "Dependency graphs take forever to load, and are larger than necessary") - Allow the use of a local 'dot' binary to generate dependancy graphs
*   Bug [133210](https://bugzilla.mozilla.org/show_bug.cgi?id=133210 "checksetup uses $::params") - typo in checksetup; uses $::params instead of $::param
*   Bug [133862](https://bugzilla.mozilla.org/show_bug.cgi?id=133862 "bugzilla index page doesn't focus text field") - bugzilla index page doesn't focus text field
*   Bug [104589](https://bugzilla.mozilla.org/show_bug.cgi?id=104589 "User closing window should not terminate Bugzilla scripts (quick fix for 2.16)") - prevent user closing window from terminating Bugzilla scripts.
*   Bug [133425](https://bugzilla.mozilla.org/show_bug.cgi?id=133425 "Audit show_bug.html.tmpl for FILTER usage") - FILTERs and other fixes in show_bug.html.tmpl.
*   Bug [133200](https://bugzilla.mozilla.org/show_bug.cgi?id=133200 "mass change removes dependencies") - mass change removes dependancies.
*   Bug [133206](https://bugzilla.mozilla.org/show_bug.cgi?id=133206) - mass change uses 'severity' rather than 'bug_severity'.
*   Bug [133389](https://bugzilla.mozilla.org/show_bug.cgi?id=133389 "show_bug does not select component"): changing anything on a bug from the show_bug.cgi page would reset its component to the first in the product.
*   Bug [133372](https://bugzilla.mozilla.org/show_bug.cgi?id=133372 "Target Milestone URL should be escaped in templates using 'FILTER uri'") - FILTER uri on milestone URL.
*   Fixes to small issues with show_bug.cgi templatisation. Bug [133276](https://bugzilla.mozilla.org/show_bug.cgi?id=133276 "Check for data in 'groups' variable in show_bug.cgi template doesn't work") - groups test is wrong.
*   Bug [133201](https://bugzilla.mozilla.org/show_bug.cgi?id=133201 "syntax error in show_bug.cgi") - js syntax error in show_bug
*   Bug [128419](https://bugzilla.mozilla.org/show_bug.cgi?id=128419 "link to email preferences from bug changed notification is wrong") - link to email preferences from bug changed notification is wrong
*   Bug [110012](https://bugzilla.mozilla.org/show_bug.cgi?id=110012 "Spank show_bug.cgi hard - templatize and combine") - show_bug templatisation.
*   Bug [132634](https://bugzilla.mozilla.org/show_bug.cgi?id=132634 "error in report when quip option is selected") - remove warning in reports.cgi when quips aren't used.
*   Bug [131659](https://bugzilla.mozilla.org/show_bug.cgi?id=131659 "Need to fixPerms the css directory") - need to fixPerms the css directory
*   Bug [131521](https://bugzilla.mozilla.org/show_bug.cgi?id=131521 "Use of uninitialized value in split at /usr/lib/perl5/5.6.1/Cwd.pm line 103.") - Set $::ENV{PATH} so that we don't get bogus 15 line warnings from perl 5.6.1's Cwd.pm on every system() call.
*   Bug [132929](https://bugzilla.mozilla.org/show_bug.cgi?id=132929 "buglist.cgi ") - buglist.cgi 'long format' button doesn't work
*   Bug [106386](https://bugzilla.mozilla.org/show_bug.cgi?id=106386 "rid source of misspellings") rid source of misspellings
*   Bug [118953](https://bugzilla.mozilla.org/show_bug.cgi?id=118953 "Incorrect message from checksetup.pl") - incorrect message from checksetup.pl
*   Bug [92905](https://bugzilla.mozilla.org/show_bug.cgi?id=92905 "editusers.cgi errors in apache errorlog: fetchrow_array failed") - perl error when editing user and no groups defined
*   Bug [131568](https://bugzilla.mozilla.org/show_bug.cgi?id=131568 "template/default/global/header not valid HTML 4.01"): template/default/global/header validates HTML 4.01 Transitional
*   Bug [103953](https://bugzilla.mozilla.org/show_bug.cgi?id=103953 "Templatise enter_bug.cgi") again = XHTML fixes.
*   Bug [129466](https://bugzilla.mozilla.org/show_bug.cgi?id=129466) - use IP addr (not hostname) in logincookies table
*   Bug [126789](https://bugzilla.mozilla.org/show_bug.cgi?id=126789 "Templatise token.cgi") - templatise token.cgi.
*   Bug [97739](https://bugzilla.mozilla.org/show_bug.cgi?id=97739 "Deleting attachment statuses should give confirmation even when JS off."): Confirms deletion of an attachment status in browsers with no-JS/JS-off.
*   Bug [103778](https://bugzilla.mozilla.org/show_bug.cgi?id=103778 "templatize buglist.cgi"): Rewrites and templatizes buglist.cgi.
*   Bug [130254](https://bugzilla.mozilla.org/show_bug.cgi?id=130254 "Template tests fail for interpolated names") - Template params don't have to exist, since they may be subject to interpolation. Ignore names with $ in them as a workaround
*   Bug [72184](https://bugzilla.mozilla.org/show_bug.cgi?id=72184 "Check for SQL size limit before inserting comment into database"): prevents users from entering too-large comments/descriptions that get rejected by MySQL's MAX_PACKET_SIZE restrictions.
*   Bug [129017](https://bugzilla.mozilla.org/show_bug.cgi?id=129017 "Perl-error in apache-log when executing query.cgi") - perl error in apache log
*   Bug [129016](https://bugzilla.mozilla.org/show_bug.cgi?id=129016 "Error in checking bug_status in post_bug.cgi"): Corrects conditional operator.
*   Bug [128784](https://bugzilla.mozilla.org/show_bug.cgi?id=128784 "Redundant use of DBNameToIDAndCheck in userprefs.cgi"): Eliminates redundant function call in userprefs.cgi.
*   Bug [106377](https://bugzilla.mozilla.org/show_bug.cgi?id=106377 "processmail rescanall should use lastdiffed") - processmail rescanall should use lastdiffed

