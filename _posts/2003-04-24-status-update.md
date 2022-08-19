---
title: "Bugzilla Status Update"
date: 2003-04-24
author: ["preed"]
categories:
- Status
---

## Introduction

The Bugzilla Team is pleased to announce the release of Bugzilla 2.16.3, a maintenance release, and 2.17.4, a new developers' release.

2.16.3 continues the Bugzilla Team's support of the stable Bugzilla branch, fixing a couple of important security vulnerabilities and other bugs for 2.16 Bugzilla users.

2.17.4 continues our march toward 2.18, offering new features for developers to play with and refine, and new toys for users who like living on the edge, even though many organizations--mozilla.org included--are using the 2.17 developers' branch without incident.

Users on both branches should upgrade to today's releases. Both contains fixes for multiple cross-site scripting issues and an insecure temporary filename vulnerability. For specifics, see the Bugzilla [security advisory](https://www.bugzilla.org/security/2.16.2/) on these vulnerabilities.

2.14.x users may be affected by at least one of these security vulnerabilities (~~[bug 197153](https://bugzilla.mozilla.org/show_bug.cgi?id=197153)~~), and are encouraged to upgrade. The Bugzilla Team has officially **stopped supporting** the 2.14 branch. Also, the 2.16/2.17 branches have lots of cool new goodies on them!

If you're wondering about [the Win32 situation](2002-11-18.html#win32), it has improved slightly on the 2.17-branch, but "out of the box" Win32 support, on either branch, is still, unfortunately, unchanged. However, the Bugzilla Team is currently discussing the status of "out of box Win32 support" in 2.18 and it is likely to remain a release goal.

## The Road to 2.18

The Bugzilla team has started reviewing goals for the 2.18 release. This includes deciding what's important to keep on the list and what might get pushed off.

As far as timing goes, the Bugzilla Team is not going to set a date; doing so has bit the project too many times in the past. The answer to "when is 2.18 coming out?" will continue to be "When it's done." However, the Team understands the need to do it sooner rather than later, so post-release, we'll be focusing on reducing the list of 2.18 goals. If we can pare this down appropriately, 2.17.5 may be the last developer release prior to the 2.18 release candidates. That may or may not be realistic, but it's a seemingly sensible plan to work from.

The [Bugzilla roadmap](/about/) contains a number of 2.18 goals. If you don't see a feature or fix you feel is necessary for 2.18 on that list, now is the time to make your case to the module owners. Also, be looking for bugs you're interested in to be retargetted in the next few days. If you're significantly concerned about this process, considering joining the [Bugzilla developers' mailing list](https://lists.bugzilla.org/cgi-bin/mj_wwwusr?func=lists-long-full&extra=developers).

A good initial summary of the Team's current thinking on goals can be read in this [`developers@` thread](https://lists.bugzilla.org/cgi-bin/mj_wwwusr?list=developers&brief=on&func=archive-get-part&extra=200304/187).

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
*   Generic charting. Allows users to define arbitrary data sets for which historical data will be recorded, and then plot those data sets. (Bug [16009](https://bugzilla.mozilla.org/show_bug.cgi?id=16009))

<a name="newfeatures">

## New Bugzilla Features

</a>

### In-core `processmail`

~~[Bug 124174](https://bugzilla.mozilla.org/show_bug.cgi?id=124174)~~, `processmail` as a package, has finally landed. This bug moves bug mail handling (mail from bug submissions/changes) from the venerable external `processmail` script, the source of much porting pain and some security issues, into a new module `Bugzilla::BugMail`.

This change moves the actual sending of mail into the same Bugzilla core process handling web requests. This change will make Win32 porting easier and has significantly sped up bug mail handling (~~[Bug 178153](https://bugzilla.mozilla.org/show_bug.cgi?id=178153)~~) for large bug changes. The checkin also cleans up the mail sub-system interface and backend, meeting--along with Win32 support--a number of 2.18 goals.

### Authentication module/LDAP improvements

As part of the ongoing preparation for `mod_perl`, Bugzilla's authentication mechanisms have been modularized, making pluggable authentication schemes for Bugzilla a reality. Both the existing database and LDAP systems were ported as part of modularization process. Additionally, the CGI portion of the backend was redesigned to allow for authentication from other sources, including (theoretically) email, which will help [Bug 94850](https://bugzilla.mozilla.org/show_bug.cgi?id=94850 "Integrate bug_email into the main code.").

As part of this conversion, LDAP logins now use Perl's standard Net::LDAP module, which has no external library dependencies. This is a departure from using the Mozilla::LDAP modules, which relied on the Netscape LDAP SDK.

### Bugzilla `mod_perl` support

Work continues on updating Bugzilla to support `mod_perl`, a performance and modularization win. In addition to the authentication module re-org, patches are pending (not included in 2.17.4) to move Bugzilla user handling into a module. With these and other patches, `show_bug.cgi` (and other minor pages) now support `mod_perl`, but have not been extensively tested, and are mostly a proof-of-concept at this point.

Initial testing is very encouraging; some very raw performance data suggests that for a simple bug with 5 comments, load times decrease from 0.6 seconds to 0.15 seconds on an unloaded P4-2.4GHz machine.

Despite this, `mod_perl` support is not yet ready for prime time. Lots of the work is very 'hacked together', and the patches only support `mod_perl` installations, to the detriment of normal CGI/Bugzilla installations. This will, of course, be fixed before checkin.

The major factor inhibiting `mod_perl` support is the lack of development time and the lack of time for other Bugzilla developers to review patches. If you're interested in helping Bugzilla increase performance with `mod_perl`, check out [bug 87406](https://bugzilla.mozilla.org/show_bug.cgi?id=mod_perl "Make Bugzilla work with mod_perl (under Apache)").

### JS versions of buglists

Buglists are now available as JavaScript structures in addition to HTML and RDF. This allows features like the ["update buglinks" bookmarklet](https://bugzilla.mozilla.org/attachment.cgi?id=119087&action=view), which will update the state of all the buglinks in a page to have the correct status and tooltip.

### Perl on the "move" from `/usr/bonsaitools/bin` to `/usr/bin`

One of the most common support requests was what this "bonsaitools" directory was all about, and how could the Perl location Bugzilla expects be changed from that to the more standard `/usr/bin`. This request was never fulfilled because Bugzilla's primary installation, [bugzilla.mozilla.org](https://bugzilla.mozilla.org/), needed to have Perl installed in a location other than `/usr/bin` and a longstanding rule for Bugzilla development has been "don't break mozilla.org."

Because of server changes at mozilla.org, a bonsaitools was no longer required for them. After a quick message to the Bugzilla [newsgroups and mailing lists](https://www.bugzilla.org/discussion.html) asking if anybody else relied on this path, it was determined that finally getting this change checked in wouldn't affect many people, so the oft-requested feature was finally completed.

More information can be found in ~~[bug 196433](https://bugzilla.mozilla.org/show_bug.cgi?id=196433)~~.

### Doc changes

Matthew Barnson, the original author of much of the [Bugzilla Guide](https://www.bugzilla.org/docs/html/), has recently been swamped by life. Jacob Steenhagen was gracious (and foolish) enough to volunteer to take over. In an attempt to "sync up" the documentation, Jake has been focusing on backporting relevant changes to the documentation to the 2.16 branch. Many items in the guide have received love, but the most notable ones include:

*   **Section 4.3 - OS Specific Installation (New in Devel)** - Moved a lot of stuff that is specific to the OS (or distro) out into a special section. The next step is to make the installation instructions more generic as there are still some OS specific hints, etc.
*   **Section 4.4 - HTTP Server Configuration (New in Devel)** - Moved some information that is specific to the web server being used into its own section. I currently have varying amount of information for Apache, IIS, and AOL Server.
*   **Section 5.5 - Group Security (Devel)** - Because the tip has a new security model the docs needed updating for the tip.
*   **Section 5.6 - Bugzilla Security (2.16 and Devel)** - This section has been cleaned up considerably. It also now contains information that used to be scattered about in different sections.
*   **Section 5.8 - Upgrading (2.16 and Devel)** - Add a lot of information about upgrading along with specific instructions and examples for 3 different ways to get the latest code.
*   Many Misc. FAQ Updates (2.16 and Devel)
*   Finally moved everything to the `xml/` directory. For quite some time now, the documentation has been using the DocBook 4.1.2 XML doctype but still residing in a directory named `sgml/` and having file names ending in the .sgml extension. The master documentation files now live in the `xml/` directory and have `.xml` extensions.

Please join the Bugzilla team in welcoming Jake back! Documentation is often the most overlooked and under-appreciated task of any open source project, so if you see Jake on IRC, be sure to thank him!

### Improved localization support

With the landing of ~~[Bug 126955](https://bugzilla.mozilla.org/show_bug.cgi?id=126955)~~, support for localized Bugzilla templates has improved tremendously. Bugzilla administrators can now configure which languages are supported by their installations and _automatically_ serve correct, localized content to users based on the `Accept Language` header sent from users' browsers, providing the appropriate language for a user with minimal configuration on their part.

There are currently [localized templates](https://www.bugzilla.org/download.html#localizations) available for Chinese, German, Spanish (Spain or Mexico) and Russian. These localized template packs are third-party contributions, may only be available for specific versions of 2.16 or 2.17, and may not be supported in the future.)

<a name="cvsHEAD">

## Trunk Checkins Since the Last Status Update

</a>

The following is a list of specific bugs fixed (and their checkin messages) since the last Bugzilla status report. It is ordered by the checkin date, as ordered by [Bonsai](http://bonsai.mozilla.org/). It includes checkins on the **trunk** from **01/02/2003** to **04/24/2003**. This list was generated by filtering Bonsai's output on [that query](http://bonsai.mozilla.org/cvsquery.cgi?treeid=default&module=Bugzilla&branch=HEAD&branchtype=regexp&sortby=Date&date=explicit&mindate=01%2F02%2F2003+10%3A15%3A00&maxdate=04%2F24%2F2003+23%3A55%3A00&cvsroot=%2Fcvsroot).

Bold italic bugs are security-sensitive bugs.

Checkins made without reference to any specific bugs:

*   Versions numbers were bumped and release notes updated
*   (1/4/03, 2/19/03, 4/1/03, 4/22/03) Documentation updates (Jake)
*   (2/16/03) Allow `runtests.pl` to let you specify a test number to run (justdave)
*   (1/12/03) XUL Chrome should use |content| over |_content| (in sidebar.cgi). (caillon)

Checkin manifest:

*   _**Bug [179510](https://bugzilla.mozilla.org/show_bug.cgi?id=179510) - Fix to take group restrictions into account when sending request notifications**_
*   Bug [172331](https://bugzilla.mozilla.org/show_bug.cgi?id=172331) - importxml.pl warnings under perl 5.8
*   Bug [179513](https://bugzilla.mozilla.org/show_bug.cgi?id=179513) - take N. Fix the bracketing so that it actually works...
*   Bug [201018](https://bugzilla.mozilla.org/show_bug.cgi?id=201018) - editusers.cgi never calls DeriveGroup prior to changing a bug
*   Bug [197153](https://bugzilla.mozilla.org/show_bug.cgi?id=197153) - Add wording schange requested by reviewer which wasn't in the patch on the bug, and so wasn't checked in.
*   _**Bug [193965](https://bugzilla.mozilla.org/show_bug.cgi?id=193965) - On product change, user can accidentally opt-out of required group restriction**_
*   **_Bug [197153](https://bugzilla.mozilla.org/show_bug.cgi?id=197153) - Fix for insecure temporary filename handling._**
*   **_Bug [192661](https://bugzilla.mozilla.org/show_bug.cgi?id=192661) - Dependency graphs were printing bug summaries without HTML filtering._**
*   **_Bug [192677](https://bugzilla.mozilla.org/show_bug.cgi?id=192677) - Add new test to flag failure-to-filter situations in the templates, and correct the XSS holes that were discovered as a result of it._**
*   Bug [198458](https://bugzilla.mozilla.org/show_bug.cgi?id=198458 "ldap to bugzilla account sync script, tested against Exchange (for contrib/)") - Added LDAP Sync script contributed by thomas+mozilla@stromberg.org (Thomas Stromberg) to the contrib directory.
*   Bug [202744](https://bugzilla.mozilla.org/show_bug.cgi?id=202744 "Receiving unnecessary output from cron when running collectstats.pl") - Removing unnecessary output from collectstats.pl cron job
*   Per bug [200472](https://bugzilla.mozilla.org/show_bug.cgi?id=200472 "Using an array as a reference is deprecated at Date/Format.pm") - Changing the version information for Date::Parse (any) to instead specify Date::Format (2.21).
*   Fix typo in previous checking for bug [200472](https://bugzilla.mozilla.org/show_bug.cgi?id=200472 "Using an array as a reference is deprecated at Date/Format.pm") - Date::Format should be version *2*.21.
*   Bug [200472](https://bugzilla.mozilla.org/show_bug.cgi?id=200472 "Using an array as a reference is deprecated at Date/Format.pm") - Require specific version of Date::Format to ensure we don't run into a bug in an older version that we're triggering.
*   bug [202534](https://bugzilla.mozilla.org/show_bug.cgi?id=202534 "Login with unrestricted IP address fails - tries to access missing get_netaddr") - Login with unrestricted IP address fails - tries to access missing get_netaddr
*   Bug [71790](https://bugzilla.mozilla.org/show_bug.cgi?id=71790 "Duplicate resolution field should include bug number of original") - Duplicate resolution field should include bug number of original
*   Bug [199012](https://bugzilla.mozilla.org/show_bug.cgi?id=199012 "Default (and b.m.o.) bug email should have "change prefs" line") - Default (and b.m.o.) bug email should have "change prefs" line.
*   Fix for bug [200961](https://bugzilla.mozilla.org/show_bug.cgi?id=200961 "id -> bug_id change horked RDF version of bug list") - unhorks display of bug ID in RDF version of bug list.
*   Bug [200072](https://bugzilla.mozilla.org/show_bug.cgi?id=200072 "Can't read mail via the webmail interface of .Mac") - Creating new users from LDAP at authentication time is broken
*   Bug [190589](https://bugzilla.mozilla.org/show_bug.cgi?id=190589 "sidebar.cgi should link to report.cgi instead of reports.cgi for consistency") - sidebar.cgi should link to report.cgi instead of reports.cgi for consistency
*   Bug [199813](https://bugzilla.mozilla.org/show_bug.cgi?id=199813 "Make all users of ThrowUserError pass $vars in explictly") - Make all users of ThrowUserError pass $vars in explicitly.
*   Bug [195424](https://bugzilla.mozilla.org/show_bug.cgi?id=195424 "MySQL 4 Table Locking appears to be different") - Add a note about new MySQL permissions needed for Bugzilla in MySQL 4.
*   Bug [194541](https://bugzilla.mozilla.org/show_bug.cgi?id=194541 "Win32 documentation says to run dot with Perl") - Dot is a binary executable, not a perl script so we don't need to prefix the system call with the perl binary. There are no more system calls of perl scripts in Bugzilla, so this section can go away.
*   Bug [171674](https://bugzilla.mozilla.org/show_bug.cgi?id=171674 "File::Temp (required by TT 2.08) is broken in Perl 5.6.0") - Adding a section to the Troubleshooting section describing how to fix the File::Temp problems in perl 5.6.0.
*   Bug [195530](https://bugzilla.mozilla.org/show_bug.cgi?id=195530 "Make javascript version of buglists available") - Make javascript version of buglists available.
*   Bug [80157](https://bugzilla.mozilla.org/show_bug.cgi?id=80157 "patch that adds "regenerate" option to collectstats.pl") - Add "regenerate" option to collectstats.pl.
*   Bug [192121](https://bugzilla.mozilla.org/show_bug.cgi?id=192121 "Javascript error in guided bug entry") - Javascript error in guided bug entry.
*   Bug [197689](https://bugzilla.mozilla.org/show_bug.cgi?id=197689 "Missing Query - The query named $name seems to no longer exist.") Missing Query - The query named $name seems to no longer exist.
*   Bug [65319](https://bugzilla.mozilla.org/show_bug.cgi?id=65319 "editmilestones & editversions don't have extra add.") editmilestones & editversions don't have extra add.
*   Bug [196433](https://bugzilla.mozilla.org/show_bug.cgi?id=196433 "use /usr/bin/perl instead of /usr/bonsaitools/bin/perl") - Bugzilla now uses /usr/bin/perl as the shebang line
*   Bug [195621](https://bugzilla.mozilla.org/show_bug.cgi?id=195621 "Back out taint-related changes from bug 160710") - Back out taint-related changes from bug [160710](https://bugzilla.mozilla.org/show_bug.cgi?id=160710).
*   Bug [190892](https://bugzilla.mozilla.org/show_bug.cgi?id=190892 "Radio button for "run this query" appears needlessly if you don't have saved queries") - Radio button for "run this query" looks silly if it's the only choice. Make it a hidden input if it's the only one.
*   Bug [180642](https://bugzilla.mozilla.org/show_bug.cgi?id=180642 "Move authentication code into a module") - Move authentication code into a module
*   Bug [195695](https://bugzilla.mozilla.org/show_bug.cgi?id=195695 "Requesting a non-existant format results in an Internal Error") - Requesting a non-existant format results in an Internal Error
*   Bug [197180](https://bugzilla.mozilla.org/show_bug.cgi?id=197180 "Long component name accepted on component creation but not working when creating a bug") - Long comment names not flagged as an error
*   Bug [193989](https://bugzilla.mozilla.org/show_bug.cgi?id=193989 "Email notification for cancellation of "password change token" does not use emailsuffix") - EmailSuffix wasn't getting used for password change tokens. Also removes real name from To: header which wasn't being escaped properly for RFC[2822](https://bugzilla.mozilla.org/show_bug.cgi?id=2822) specs.
*   Bug [194917](https://bugzilla.mozilla.org/show_bug.cgi?id=194917 "bug flags template includes javascript outside of comment block") - Javascript missing HTML comments in flag list.
*   Bug [190848](https://bugzilla.mozilla.org/show_bug.cgi?id=190848 "When trying to add a new product I get a 'software error'.") - Adding a new product results in a software error.
*   Fix for bug [191051](https://bugzilla.mozilla.org/show_bug.cgi?id=191051 "emailtype2 substring search returns no hits") - make substring searches actually do substring instead of anyexact.
*   Bug [196101](https://bugzilla.mozilla.org/show_bug.cgi?id=196101 "group checks in sanitycheck should use ANSI-compliant SQL") - use ANSI-compliant SQL for group checks in sanitycheck
*   Bug [194345](https://bugzilla.mozilla.org/show_bug.cgi?id=194345 "checksetup.pl chokes if params set for local dot and executable doesn't exist") - checksetup.pl would die if you had your params set for a local dot, and the executable didn't exist. The polite error message it was supposed to print works now.
*   Bug [196420](https://bugzilla.mozilla.org/show_bug.cgi?id=196420 "jsmagic for add/and/or in boolean charts isn't working") - jsmagic for add/and/or in boolean charts isn't working
*   Bug [156436](https://bugzilla.mozilla.org/show_bug.cgi?id=156436 "IBM Web Browser is unrecognized") IBM Web Browser is unrecognizedpatch by mkaply@us.ibm.com
*   [180692](https://bugzilla.mozilla.org/show_bug.cgi?id=180692 "enter_bug shows keywords option even if keywords are disabled") - enter_bug shows keywords option even if keywords are disabledFix broken tree.
*   Bug [180692](https://bugzilla.mozilla.org/show_bug.cgi?id=180692 "enter_bug shows keywords option even if keywords are disabled") - enter_bug shows keywords option even if keywords are disabled
*   Bug [195137](https://bugzilla.mozilla.org/show_bug.cgi?id=195137 "Creating a bug with keywords: Those are not send via email") - Keywords are not sent in new bug mail
*   Bug [194744](https://bugzilla.mozilla.org/show_bug.cgi?id=194744 "Link to confirmhelp.html is not working - file not on server") - fix dead link to confirmhelp.html.
*   Bug [183017](https://bugzilla.mozilla.org/show_bug.cgi?id=183017 "Only numbers displayed when bar chart contains too many products") - Only numbers displayed when bar chart contains too many products.
*   **_Bug [194394](https://bugzilla.mozilla.org/show_bug.cgi?id=194394) - Internal error after turning useqacontact off_**
*   Bug [186689](https://bugzilla.mozilla.org/show_bug.cgi?id=186689 "Should be able to set all/clear all email options in preferences") - Should be able to set all/clear all email options in user preferences with one click.
*   Bug [194426](https://bugzilla.mozilla.org/show_bug.cgi?id=194426 ""usequip" parameter changed to "allowquips" instead of "enablequips"") - "usequips" was renamed improperly in the backward-compatibility Param code.
*   Bug [194172](https://bugzilla.mozilla.org/show_bug.cgi?id=194172 "move.pl exports empty bugs") - move.pl was sending empty bugs because of failure to initialize the field list for the new "XML Summary" mode.
*   Bug [193985](https://bugzilla.mozilla.org/show_bug.cgi?id=193985 "Errors from SendSQL aren't being reported") - errors from SendSQL aren't being reported
*   Bug [135820](https://bugzilla.mozilla.org/show_bug.cgi?id=135820 "token cancellation message are not user-friendly") - token cancellation message are not user-friendly
*   Bug [193511](https://bugzilla.mozilla.org/show_bug.cgi?id=193511 "post_bug page has two headers") - post_bug page has two headers.
*   Bug [186994](https://bugzilla.mozilla.org/show_bug.cgi?id=186994 "Unable to accept a new bug that has been assigned.") - Unable to accept a new bug that has been assigned.
*   Bug [191537](https://bugzilla.mozilla.org/show_bug.cgi?id=191537 "Make Security Section better") - Improvements to the security section.
*   Bug [192877](https://bugzilla.mozilla.org/show_bug.cgi?id=192877 "State changes on bugs w/ dependancies cause "Use of uninitialized values"") - State changes on bugs w/ dependancies cause "Use of uninitialized values" in BugMail.pm;
*   Bug [193286](https://bugzilla.mozilla.org/show_bug.cgi?id=193286 "Field validation errors have wrong page title") - Field validation errors had the wrong page title
*   Bug [192531](https://bugzilla.mozilla.org/show_bug.cgi?id=192531 "Bugzilla not properly closing DB statement handles") - Bugzilla not properly closing DB statement handles. Change code to work arround a perl < 5.8 leak when localising the tiedstatement attributes. Also, clear the sql statestack compat stuff so thatthe handles are really dead by the time we disconnect
*   Bug [177997](https://bugzilla.mozilla.org/show_bug.cgi?id=177997 "Bugzilla Docs: Installing with AOLserver") - Update the AOL Server section with the new configuration information.
*   Bug [192511](https://bugzilla.mozilla.org/show_bug.cgi?id=192511 "Remove references to processmail from the docs") - Removing all occurances of 'processmail' from the documentation now that bug [124174](https://bugzilla.mozilla.org/show_bug.cgi?id=124174) is FIXED.
*   Bug [192874](https://bugzilla.mozilla.org/show_bug.cgi?id=192874 "checksetup.pl doesn't silence the GraphViz check in silent mode") - checksetup.pl wasn't silencing the GraphViz check when running in silent mode.
*   Bug [58020](https://bugzilla.mozilla.org/show_bug.cgi?id=58020 "Let whineatnews include descriptions with email") - include bug summaries in whinemail.
*   Bug [192513](https://bugzilla.mozilla.org/show_bug.cgi?id=192513 "processmail as a package cleanup") - importxml.pl and move.pl now use the new mail routines introduced in bug [124174](https://bugzilla.mozilla.org/show_bug.cgi?id=124174) (they got broken when processmail was removed). Also fixes several comments referring to processmail (which no longer exists) in other files, and removes references to processmail from the .htaccess files and the executable file list in checksetup.pl.
*   Partial fix for bug [192513](https://bugzilla.mozilla.org/show_bug.cgi?id=192513 "processmail as a package cleanup") (processmail cleanup). Patch fixes test filesto disregard processmail since it no longer exists (it was special-casedbefore).
*   Bug [124174](https://bugzilla.mozilla.org/show_bug.cgi?id=124174 "processmail should be a package") - make processmail a package (Bugzilla::BugMail),
*   Bug [192393](https://bugzilla.mozilla.org/show_bug.cgi?id=192393 "$::dbwritesallowed is never set") - $::dbwritesallowed never set
*   Bug [192340](https://bugzilla.mozilla.org/show_bug.cgi?id=192340 "'unknown_keyword' error doesn't mention keyword") - 'unknown_keyword' error doesn't mention keyword
*   Bug [192182](https://bugzilla.mozilla.org/show_bug.cgi?id=192182 "editflagtypes uses ^ instead of **") - editflagtypes uses ^ instead of **
*   Bug [191020](https://bugzilla.mozilla.org/show_bug.cgi?id=191020 "buglist.cgi doesn't always get query names right for filename to save") - back out bits of generic charting checked in by mistake. Apologies.
*   Bug [191020](https://bugzilla.mozilla.org/show_bug.cgi?id=191020 "buglist.cgi doesn't always get query names right for filename to save") - buglist.cgi doesn't always get query names right for filename to save.
*   Bug [191863](https://bugzilla.mozilla.org/show_bug.cgi?id=191863 "Clean up Bugzilla.pm") - Clean up Bugzilla.pm
*   This checkin contains two fixes:* Bug [191971](https://bugzilla.mozilla.org/show_bug.cgi?id=191971 "Bugzilla Guide says you can resolve bugs by email") - The guide incorrectly stated that you could resolve a bug via email* Provide an example of a glossary term in the document conventions section
*   Bug [172434](https://bugzilla.mozilla.org/show_bug.cgi?id=172434 "Useful link on the bugzilla page to ease download of NEWEST version") - add link to latest nightly.
*   bug [191087](https://bugzilla.mozilla.org/show_bug.cgi?id=191087 "process_bug.cgi: "Mid-air collision!" title when not allowed to change a field") - process_bug.cgi: "Mid-air collision!" title when not allowed to change a field
*   Bug [191085](https://bugzilla.mozilla.org/show_bug.cgi?id=191085 "process_bug.cgi: FetchSQLData vs. FetchOneColumn and other oddness") - Fix FetchSQLData compat code.
*   Bug [191034](https://bugzilla.mozilla.org/show_bug.cgi?id=191034 "Refactor Installation chapter") - step 1 - Refactoring the installation chapter to provide sections for OS Specific notes and configuration help on multiple web servers. Also added some terms to the glossary.
*   Bug [191080](https://bugzilla.mozilla.org/show_bug.cgi?id=191080 "process_bug.cgi: SQL error (die) if no component has been selected") - fix SQLQuote return value for an undef input
*   bug [190999](https://bugzilla.mozilla.org/show_bug.cgi?id=190999 "Quips.cgi editing doesn't show quips author -- s/FetchSQLData/FetchOneColumn/") - Quips.cgi editing doesn't show quips author -- s/FetchSQLData/FetchOneColumn/
*   Spell servlet correctly. Also, Scarab is now at Version 1.0 Beta [13](https://bugzilla.mozilla.org/show_bug.cgi?id=13) - as long as I'm updating...
*   Bug [190582](https://bugzilla.mozilla.org/show_bug.cgi?id=190582 "quips table initial definition in checksetup.pl missing approved column") - quips table initial definition in checksetup.pl missing approved column
*   Bug [190521](https://bugzilla.mozilla.org/show_bug.cgi?id=190521 "bug_email.pl attachment might not be named") - If the attachment didn't have a Content-Description: header in the e-mail, it ended up not having a description in Bugzilla leaving nothing to click on in the Attachment table on the bug form.
*   Bug [190437](https://bugzilla.mozilla.org/show_bug.cgi?id=190437 "showdependencytree.cgi and showdependencygraph should use switch_to_shadow_db") - showdependencytree.cgi and showdependencygraph should use switch_to_shadow_db
*   Bug [106918](https://bugzilla.mozilla.org/show_bug.cgi?id=106918 "Mover handling is borked on move.pl.") - the "movers" param was not being interpreted correctly by move.pl or the show_bug template. Also the exporter value was not properly fed into the xml template.
*   Bug [126955](https://bugzilla.mozilla.org/show_bug.cgi?id=126955 "Bugzilla should support translated/localized templates") - Bugzilla should support translated/localized templates.
*   Bug [190197](https://bugzilla.mozilla.org/show_bug.cgi?id=190197 "AnyEntryGroups() is broken in globals.pl; call from enter_bug.cgi breaks bug entering") AnyEntryGroups() is broken in globals.pl; call from enter_bug.cgi breaks bug enteringpatch by jon@vmware.com
*   Bug [188712](https://bugzilla.mozilla.org/show_bug.cgi?id=188712 "Apple's Browser Safari does not support server-push") Apple's Browser Safari does not support server-pushpatch by melo@isp.novis.pt
*   Bug [189446](https://bugzilla.mozilla.org/show_bug.cgi?id=189446 "Cannot change product of a bug") - Can't change product of a bug
*   Bug [188161](https://bugzilla.mozilla.org/show_bug.cgi?id=188161 "assignee/qa missing change knobs") - assignee/qa missing change knobs.
*   Bug [189790](https://bugzilla.mozilla.org/show_bug.cgi?id=189790 "voting info not displayed when editing/viewing a bug") voting info not displayed when editing/viewing a bugpatch by jnerad@bellsouth.net
*   Fix for bug [184909](https://bugzilla.mozilla.org/show_bug.cgi?id=184909 "when I open more then one "window" in a tab some of the tabs lose support for right-clicking in the page area") - show status whiteboard on bug lists when the user requests it.
*   Bug [105692](https://bugzilla.mozilla.org/show_bug.cgi?id=105692 "Would be nice to compile all three docs w/one (short) command") - Script to compile all docs directories.
*   Bug [136603](https://bugzilla.mozilla.org/show_bug.cgi?id=136603 "show_bug.cgi's XML retrieval needs a summary mode") - show_bug.cgi's XML retrieval needs a summary mode.
*   Bug [184309](https://bugzilla.mozilla.org/show_bug.cgi?id=184309 "Add a disabled status to quips with a configurable default") - Adds an optional disabled state to quips, which allows quips to be moderated if the admin so chooses.
*   Bug [148093](https://bugzilla.mozilla.org/show_bug.cgi?id=148093 "Editmilestones shows 'xyzzy' as the product bug count") - editmilestones.cgi shows 'xyzzy' as product bug count.
*   Bumping minimum versions for DBI and DBD::mysql to match what was just checked in for bug [163290](https://bugzilla.mozilla.org/show_bug.cgi?id=163290 "Move DB handling code into a module").
*   Bug [163290](https://bugzilla.mozilla.org/show_bug.cgi?id=163290 "Move DB handling code into a module") - move DB handling code into a module
*   Bug [156169](https://bugzilla.mozilla.org/show_bug.cgi?id=156169 "bug # in attachment editor should be styled like it is everywhere else") - Bug number styling issues in attachment viewer/editor.
*   Bug [187566](https://bugzilla.mozilla.org/show_bug.cgi?id=187566 "Upgrade section is unclear (missing -dP in suggested cvs command)") - Making the upgrading section much clearer and presenting multiple possible methods (CVS, tarball, patch).
*   Bug [153874](https://bugzilla.mozilla.org/show_bug.cgi?id=153874 "Query In Sidebar doesn't work") - Query in sidebar wasn't working
*   Bug [188656](https://bugzilla.mozilla.org/show_bug.cgi?id=188656 "Change required mysqld minimum to 3.23.41") Change required mysqld minimum to 3.23.41
*   Fix for bug [166481](https://bugzilla.mozilla.org/show_bug.cgi?id=166481 "Spellcheck is borked.") ("Spellcheck is borked"). Part one of this fix fixes the spelling errors so tinderbox doesn't barf, part two fixes t/006spellcheck.t and adds some more new words to check for.
*   Bug [142104](https://bugzilla.mozilla.org/show_bug.cgi?id=142104 "enhancements in buglists should be grey") - Enhancements in buglists should be gray.
*   Bug [179328](https://bugzilla.mozilla.org/show_bug.cgi?id=179328 "Mozilla-specific wording in duplicates.cgi explanation text") - Mozilla-specific wording in duplicates.cgi explanation text.
*   Bug [187869](https://bugzilla.mozilla.org/show_bug.cgi?id=187869 "long_list.cgi output includes <font ="+3"> before each bug summary") long_list.cgi output includes <font ="+3"> before each bug summary
*   Bug [186920](https://bugzilla.mozilla.org/show_bug.cgi?id=186920 "Loosen checking for Windows ME user-agent") - Loosen checking for Windows ME user-agents.
*   Bug [181047](https://bugzilla.mozilla.org/show_bug.cgi?id=181047 "Change non-output templates to have a ctype of "none"") - Change non-output templates to have a ctype of "none".
*   Bug [187837](https://bugzilla.mozilla.org/show_bug.cgi?id=187837 "Unify showing and editing of quips") - Unify showing and editing of quips.

<a name="cvs2_16-BRANCH"></a>

## <a name="cvs2_16-BRANCH">2.16 Branch Checkins Since the Last Status Update</a>

<a name="cvs2_16-BRANCH"></a>

The following is a list of specific bugs fixed (and their checkin messages) since the last Bugzilla status report. It is ordered by the checkin date, as ordered by [Bonsai](http://bonsai.mozilla.org/). It includes checkins on the **2.16 branch** from **01/02/2003** to **04/24/2003**. This list was generated by filtering Bonsai's output on [that query](http://bonsai.mozilla.org/cvsquery.cgi?treeid=default&module=Bugzilla&branch=BUGZILLA-2_16-BRANCH&branchtype=regexp&sortby=Date&date=explicit&mindate=01%2F02%2F2003+10%3A15%3A00&maxdate=04%2F24%2F2003+23%3A55%3A00&cvsroot=%2Fcvsroot).

Bold italic bugs are security-sensitive bugs.

Checkins made without reference to any specific bugs:

*   Versions numbers were bumped and release notes updated
*   A **bunch** of highly useful documentation updates (Jake)
*   Allow `runtests.pl` to let you specify a test number to run (justdave)
*   Update template tests to also catch localized template versions during testing (justdave)

Checkin manifest:

*   Bug [172331](https://bugzilla.mozilla.org/show_bug.cgi?id=172331) - importxml.pl warnings under perl 5.8
*   **_Bug [197153](https://bugzilla.mozilla.org/show_bug.cgi?id=197153) - Add wording schange requested by reviewer which wasn't in the patch on the bug, and so wasn't checked in._**
*   Fixing tinderbox test failure resulting from the checkin for bug [197153](https://bugzilla.mozilla.org/show_bug.cgi?id=197153)
*   **_Bug [197153](https://bugzilla.mozilla.org/show_bug.cgi?id=197153) - Fix for insecure temporary filename handling._**
*   **_Bug [194394](https://bugzilla.mozilla.org/show_bug.cgi?id=194394) - Someone listed as QA contact on a bug could still access a bug with QA contact privileges if "useqacontact" was later disabled via the parameters._**
*   **_Bug [192661](https://bugzilla.mozilla.org/show_bug.cgi?id=192661) - Dependency graphs were printing bug summaries without HTML filtering._**
*   **_Bug [192677](https://bugzilla.mozilla.org/show_bug.cgi?id=192677) - Add new test to flag failure-to-filter situations in the templates, and correct the XSS holes that were discovered as a result of it._**
*   Fix (on the 2.16 branch) for bug [160279](https://bugzilla.mozilla.org/show_bug.cgi?id=160279) - checksetup.pl doesn't check permission on data/comments. Patch adds a fixPerms() call for data/comments.
*   Bug [194125](https://bugzilla.mozilla.org/show_bug.cgi?id=194125 "CGI.pl warning: Character in "c" format wrapped...") - CGI.pl perl warning: Character in "c" format wrapped
*   Bug [195424](https://bugzilla.mozilla.org/show_bug.cgi?id=195424 "MySQL 4 Table Locking appears to be different") - Add a note about new MySQL permissions needed for Bugzilla in MySQL 4.
*   Bug [171674](https://bugzilla.mozilla.org/show_bug.cgi?id=171674 "File::Temp (required by TT 2.08) is broken in Perl 5.6.0") - Adding a section to the Troubleshooting section describing how to fix the File::Temp problems in perl 5.6.0.
*   Bug [197180](https://bugzilla.mozilla.org/show_bug.cgi?id=197180 "Long component name accepted on component creation but not working when creating a bug") - long component name not flagged as error. Because of a mismatch between the size of bugs.component andcomponents.program, this caused silent failures when creating/moving bugsin that component.
*   Port security section rewrite from bug [191537](https://bugzilla.mozilla.org/show_bug.cgi?id=191537 "Make Security Section better") to the 2.16.3 docs
*   Bug [157704](https://bugzilla.mozilla.org/show_bug.cgi?id=157704 "if you delete a product when usebuggroups is ON, administrator's right may change") - Deleting a product could potentially remove privileges from administrators.
*   Bug [191971](https://bugzilla.mozilla.org/show_bug.cgi?id=191971 "Bugzilla Guide says you can resolve bugs by email") - The guide incorrectly stated that you could close a bug by sending an email with the code in contib/
*   Bug [188757](https://bugzilla.mozilla.org/show_bug.cgi?id=188757 "Missing line break in Apache config example in online documentation, section "step-by-step install"") - 2.16 shipped with the problem mentioned in bug [174255](https://bugzilla.mozilla.org/show_bug.cgi?id=174255) and that fix was never ported to 2.16's documentation, so the error was still on bugzilla.org.
*   Bug [187566](https://bugzilla.mozilla.org/show_bug.cgi?id=187566 "Upgrade section is unclear (missing -dP in suggested cvs command)") - Update upgrade section in the 2.16 branch as was done on the tip

