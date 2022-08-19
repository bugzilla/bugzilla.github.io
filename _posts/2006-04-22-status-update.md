---
title: "Status Update"
date: 2006-04-22
author: ["justdave"]
categories:
- Status
---

## Introduction and Updates

This Status Update brings with it three new versions of Bugzilla. We have the final release of 2.22, a major feature update to Bugzilla (details below). We are also releasing version 2.20.2, which contains bugfixes and security updates to the 2.20 version series. And last, but not least, Bugzilla 2.23.1, a developer preview release of the codebase that will eventually become either 2.24 or 3.0\. There's a lot of other news about the Bugzilla Project included here, so keep reading!

As usual, we'd like to remind all Bugzilla administrators that to assist them in keeping up-to-date with release announcements and security advisories, we provide an ultra-low-volume administrator mailing list ([announce@bugzilla.org](https://lists.bugzilla.org/cgi-bin/mj_wwwusr?func=lists-full-long&extra=announce)). We advise all Bugzilla administrators to subscribe so they can keep up with important Bugzilla announcements.

Those looking to get involved with Bugzilla development may want to consider joining the [developers list (developers@bugzilla.org)](https://lists.bugzilla.org/cgi-bin/mj_wwwusr?func=lists-long-full&extra=developers). This list offers discussion on new features and issues. Developers are invited to subscribe to the list. You may also want to read our [Contributor's Guide](https://www.bugzilla.org/docs/contributor.html).

## The End Has Come! (of 2.16.x)

This Status Update represents a major milestone in the life of the Bugzilla Project! We are now dropping all support for the 2.16 version series. Why is this a major milestone? Because it is the longest-lived branch in the entire history of Bugzilla, and frankly, we're tired of supporting it. :) Bugzilla 2.16 was released just shy of 4 years ago, and that's a **long** time in the life of computer software. The only reason it's lasted so long is because for a couple years we didn't have anything to replace it with. Bugzilla 2.18 (the version to replace 2.16) has now been out for just over a year, giving most folks plenty of opportunity to upgrade.

Bugzilla has made **tremendous** progress since 2.16, both in terms of customizability and maintainability. Probably a good 50% of the code has been completely rewritten since then, so although it may look similar to an end user from the web (except for the obvious new features), the back end code looks completely different. The problem with all of this change, of course, is that the current version of Bugzilla is absolutely nothing like version 2.16, which makes it very difficult for us to support 2.16 because anything we backport to it has to be completely rewritten, it won't just work with minor changes.

**So if you are using Bugzilla 2.16.x, this is your last warning.** You really need to upgrade if you plan to continue to get security support. We highly recommend version 2.22\. Upgrading is easy if you haven't made a lot of customizations (our upgrade script will upgrade your database schema for you). Not to mention that Bugzilla 2.22 is much more flexible and usable than 2.16. More details on that below.

## Integrating with Bugzilla

I recently read a news article that talked about the CEO of Zimbra demonstrating a Zimlet that pulled data about bugs from Bugzilla when you hovered a bug number in their webmail application (among many other things he demonstrated). My first reaction was "hey, way cool!" My second reaction was "How come we didn't know about that?" I think it'd be really useful for people who are shopping for a bug tracker to be able to see a list of all the things out there that integrate with it. You never know, someone might have already written scripts or extensions to make Bugzilla integrate with other applications they already have, and it might be a key selling point.

We set up a wiki page on the topic a while back, at [https://wiki.mozilla.org/Bugzilla:Addons](https://wiki.mozilla.org/Bugzilla:Addons), but we haven't advertised it very well. Have a look at it, and see what's out there. And if you know of anything that's not listed, please add it!

## New Releases

### 2.22

Bugzilla 2.22 is a major new feature release of Bugzilla. You can see the list of major [new features](/releases/2.22) for details.

In addition to the user-visible features, the code for Bugzilla 2.22 is much cleaner, making it even easier to customize than before. A major new code improvement is that Products, Components, Milestones, Versions, and various other things now have real objects to represent them.

### 2.20.2

2.20.2 is a bug-fix release for the 2.20 series. Most importantly, users can now log in properly to a brand-new Bugzilla installation, which was broken in Bugzilla 2.20.1\. 2.20.2 also includes corrections to the sidebar for admins, a fix for a problem when creating accounts using the "Env" authentication method, a new test for runtests, as well as many smaller fixes and improvements.

This is the last 2.20 release where non-critical bugs will be fixed. 2.20.3 and further will contain only security and dataloss fixes.

### 2.23.1

This is our completely untested development release. There are a few people using this code successfully in production, but that doesn't mean it won't break and destroy everything you have. If you install 2.23.1, you should do so only in a test environment.

Here's a list of the new features or major changes in this release that are not in 2.22:

*   We require at least perl 5.8.0.
*   PostgreSQL users must use at least PostgreSQL 8.0.0.
*   **Custom Fields**: 2.23.1 has an _extremely_ basic Custom Fields functionality. They only show up on `show_bug.cgi`. You create them with the <kbd>customfield.pl</kbd> script.
*   We've re-worked the "Format For Printing" page.
*   Emails can now have a header called <kbd>X-Bugzilla-Who</kbd> which specifies the Bugzilla account that made the changes. If you want this header, and you are upgrading, you have to reset your newchangedmail parameter to the default.
*   Emails also have an `X-Bugzilla-Watch-Reason` header, now. This contains the email address of the person you were watching and why _they_ got the email. If you're getting the email only because you were watching somebody, the old `X-Bugzilla-Reason` header will say "None." If you got an email directly (not through anybody you're watching), `X-Bugzilla-Watch-Reason` will say "None."
*   Many other email headers were added which give information about the bug. See [Bug 70710](https://bugzilla.mozilla.org/show_bug.cgi?id=70710) for details.
*   "Quoted" text in comments is now displayed in a different color from normal comment text.
*   You can search for users in many different ways using editusers.cgi, now.
*   Comment fields (textareas) now zoom large when you click inside them. If you don't like this, you can turn it off in your Preferences.
*   The "Dependency Tree" view has been redesigned.
*   You can now see what changes have been made over time to a user account. (That is, we've finally exposed the "profiles_activity" table in the UI.)
*   Users who wish to customize or extend Bugzilla can now take advantage of "hooks" at certain areas in the code. (See [Bug 298341](https://bugzilla.mozilla.org/show_bug.cgi?id=298341) for details.)
*   Bugzilla supports LDAPS connections in addition to normal LDAP connections.
*   You can now change the resolution of a bug without reopening it.
*   Administrators can delete attachments.
*   The "passwordmail" parameter is now a template instead of a parameter.
*   It's now easy for templates to link to the documentation. (See [Bug 316217](https://bugzilla.mozilla.org/show_bug.cgi?id=316127) for details.)
*   We're in the middle of removing all the global variables from the code. This means eliminating the "versioncache" file. If you notice significant performance differences between 2.22 and 2.23.1 in certain places, please let us know.
*   We're also making a lot of progress on removing functions from globals.pl. Some functions you used in your customizations may have been moved somewhere else.

## Bugzilla Meetings

The Bugzilla Project now has [meetings](https://wiki.mozilla.org/Bugzilla:Meetings) every other week! Anybody is welcome to attend who is interested in helping out with the Bugzilla Project, or just anybody who wants to put in their two cents on how development should go.

You can learn more about the meetings at the [wiki page about Bugzilla Meetings](https://wiki.mozilla.org/Bugzilla:Meetings).
