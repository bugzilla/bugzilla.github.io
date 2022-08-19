---
title: "Status Update"
date: 2006-07-09
author: ["mkanat"]
categories:
- Status
---

## Introduction and Updates

Today we released a development snapshot only. We've done a lot of coding on the trunk, and we wanted to get out a new version to be tested. Most of the branches (2.18, 2.20, and 2.22) are pretty stable, so they don't urgently need a release at this time. We may be coming out with some bug fix releases for those in the coming months, though.

As usual, we'd like to remind all Bugzilla administrators that to assist them in keeping up-to-date with release announcements and security advisories, we provide an ultra-low-volume administrator mailing list ([announce@bugzilla.org](https://lists.bugzilla.org/cgi-bin/mj_wwwusr?func=lists-full-long&extra=announce)). We advise all Bugzilla administrators to subscribe so they can keep up with important Bugzilla announcements.

Those looking to get involved with Bugzilla development may want to consider joining the [developers list (developers@bugzilla.org)](https://lists.bugzilla.org/cgi-bin/mj_wwwusr?func=lists-long-full&extra=developers). This list offers discussion on new features and issues. Developers are invited to subscribe to the list. You may also want to read our [Contributor's Guide](https://www.bugzilla.org/docs/contributor.html).

## New Releases

### 2.23.2

In my totally biased opinion, this is a really exciting release. We've made some major changes to certain parts of the Bugzilla code, and we're getting close to some major overall improvements.

However, it is _totally_ untested, so use it at your own risk! We don't recommend using it in a production environment.

Here's a listing of some of the major improvements and changes since 2.23.1:

*   A new user preference to automatically put you on the CC list of any bug that you change.
*   The Summary field is now limited to 255 characters. Summaries longer than that will be truncated, with the original preserved in a comment, when you upgrade.
*   The "whinemail" parameter is now instead contained in a template.
*   Automatic Update Notification: Bugzilla can notify you (the administrator) automatically, on the front page, when there is a new release of Bugzilla. See the <kbd>upgrade_notification</kbd> parameter.
*   There is now navigation at the _top_ of each page in addition to the bottom.
*   The UI at the top of each page has been generally improved.
*   You can now add an attachment to a bug when you are filing it!
*   <kbd>checksetup.pl</kbd> now displays the version of Bugzilla and the version of perl you are using.

In addition, there are a lot of changes that developers, customizers, or packagers of Bugzilla would be interested in:

*   The data formerly stored as the <kbd>:locations</kbd> section of <kbd>Bugzilla::Config</kbd> is now inside of <kbd>Bugzilla::Constants</kbd>. This is particularly important for packagers of Bugzilla.
*   <kbd>CheckCanChangeField()</kbd> has been moved from process_bug.cgi into <kbd>Bugzilla/Bug.pm</kbd>, and is now called <kbd>check_can_change_field</kbd>.
*   The entire <kbd>Bugzilla::Auth</kbd> structure has been entirely re-written. It should be easier to write authentication plugins for Bugzilla now. If you're interested in writing one, just read the documentation on it by typing <kbd>perldoc Bugzilla::Auth</kbd> from inside your Bugzilla directory.
*   <kbd>SendSQL()</kbd> and all of its companion functions (including <kbd>SqlQuote()</kbd>) have been entirely eliminated from Bugzilla. The correct way to access the database now is to [use DBI](/contributing/developer.html#sql-sendreceive).
*   <kbd>globals.pl</kbd> is _gone_. All functions have been moved into modules in the <kbd>Bugzilla/</kbd> directory.
*   Bugzilla no longer uses the <kbd>data/versioncache</kbd> file. If you notice any performance problems because of this, please let us know.
*   The <kbd>Param()</kbd> function now only exists in templates. Normal CGIs and scripts now use <kbd>Bugzilla->params</kbd> to access Bugzilla's parameters. This also means most scripts don't need to <kbd>use Bugzilla::Config</kbd> anymore.
*   There is a new <kbd>Bugzilla::Object</kbd> class that makes writing new objects even easier. See <kbd>Bugzilla/Keyword.pm</kbd> for an example.
*   The code for actually _sending an email_ (<kbd>MessageToMTA()</kbd>) has moved into <kbd>Bugzilla::Mailer</kbd>.
*   There is now a <kbd>Bugzilla->request_cache</kbd> for storing variables that should live throughout an entire request. (For example, what used to be <kbd>$Bugzilla::_cgi</kbd> is now <kbd>Bugzilla->request_cache->{cgi}</kbd>.)

## The Road to mod_perl

For many, many years, we have been working toward having Bugzilla support mod_perl, which would be a huge performance improvement.

Well, after a multi-year effort by almost every developer on the Project, we are almost there!

We should soon have a version of Bugzilla in CVS that supports mod_perl. If you're interested, watch the [mod_perl bug](https://bugzilla.mozilla.org/show_bug.cgi?id=87406) and its [blockers](https://bugzilla.mozilla.org/showdependencytree.cgi?id=87406&hide_resolved=1). If you have any questions about mod_perl support, feel free to come into [IRC](irc://irc.mozilla.org/mozwebtools) and ask <kbd>mkanat</kbd>, if he's around. Some other developers may be able to help you, also.

## Bugzilla Meetings

Come to our [meetings](https://wiki.mozilla.org/Bugzilla:Meetings) every other week! Anybody is welcome to attend who is interested in helping out with the Bugzilla Project, or just anybody who wants to put in their two cents on how development should go.

You can learn more about the meetings at the [wiki page about Bugzilla Meetings](https://wiki.mozilla.org/Bugzilla:Meetings).
