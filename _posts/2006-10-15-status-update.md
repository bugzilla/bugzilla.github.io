---
title: "Status Update"
date: 2006-10-15
author: ["mkanat"]
categories:
- Status
---

## Introduction and Updates

Well, we have a whole bunch of releases out today, all the way from 2.18.6 to 2.23.3.

*   2.18.6 and 2.20.3 are primarily security fix releases.
*   2.22.1 is our first bug-fix release for the 2.22 series, containing many useful fixes. We recommend everybody upgrade to 2.22.1 as soon as possible.
*   2.23.3 is one of our most important development releases ever, containing the two "holy grails" of Bugzilla development, custom fields and mod_perl support. (Of course, the release is only a development snapshot, so don't use it in production! It hasn't received the same level of QA as the other releases!)

Bugzilla development has been _extremely_ active lately, and we're happy that we're receiving so many contributions. As usual, though, we need more reviewers! To become a reviewer, you first have to be a consistent contributor, and then we have to trust your judgement. You can see more details at the [List of Reviewers](https://www.bugzilla.org/contributing/reviewer-list.html#become).

## Stay Updated About Bugzilla

As usual, we'd like to remind all Bugzilla administrators that to assist them in keeping up-to-date with release announcements and security advisories, we provide an ultra-low-volume administrator mailing list ([announce@bugzilla.org](https://lists.bugzilla.org/cgi-bin/mj_wwwusr?func=lists-full-long&extra=announce)). We advise all Bugzilla administrators to subscribe so they can keep up with important Bugzilla announcements.

Those looking to get involved with Bugzilla development may want to consider joining the [developers list (developers@bugzilla.org)](https://lists.bugzilla.org/cgi-bin/mj_wwwusr?func=lists-long-full&extra=developers). This list offers discussion on new features and issues. Developers are invited to subscribe to the list. You may also want to read our [Contributor's Guide](https://www.bugzilla.org/docs/contributor.html).

## About Our Latest Development Release (2.23.3)

This tops 2.23.2 as one of our most feature-packed development releases ever. However, it is not strongly QA-tested, so use it at your own risk! We don't recommend using it in a production environment. We _know_ there are bugs in it.

Here's a listing of some of the major improvements and changes since 2.23.2:

*   **Custom Resolutions**: You can now customize the list of resolutions for bugs.
*   **Shared Queries**: You can share saved queries with a group of users.
*   **Custom Fields**: Administrators can add plain-text and drop-down custom fields to Bugzilla. Note that you can search these fields using the Boolean Charts at the bottom of the search page.
*   **mod_perl**: Bugzilla can now run under mod_perl. See lower in this Status Update for more details.
*   **XML-RPC**: This version of Bugzilla has the beginnings of an XML-RPC interface. Note that the XML-RPC API is not yet stable, and may change before the release of Bugzilla 3.0\. However, any documented function is likely to stay the same in the actual release as it is now.
*   **Skins**: Bugzilla is now skinnable. See the documentation for details.
*   You can now specify a Default CC for a component.
*   You can now disable Bugzilla's sending of email to a particular user, in the administrative interface.
*   There's a parameter for administrators to put an announcement at the top of all Bugzilla pages.
*   You can make a bug ASSIGNED when you file it, now.
*   If you aren't allowed to change a field on a bug, it will look like plain text instead of a form element.
*   _All_ of Bugzilla's emails are now in templates.
*   Some of the messages printed out during installation can now be localized.
*   If you are using Firefox 2 or Internet Explorer 7, you can install a Search Plugin that will let you search Bugzilla bugs.

Also, the following changes may interest developers or customizers of Bugzilla:

*   When you build the documentation, the Bugzilla <acronym title="Plain Old Documentation">POD</acronym> documentation will be available as <kbd>docs/html/api/</kbd> in your installation. The POD describes all of the internal functions of Bugzilla. It's very useful for customizers and developers of Bugzilla. It also explains how a few scripts work, like <kbd>checksetup.pl</kbd>, and that information is useful to all administrators of Bugzilla.
*   <kbd>checksetup.pl</kbd> has been _completely_ reorganized into modules in the <kbd>Bugzilla::Install</kbd> namespace. It also has POD now, so you can do <kbd>perldoc checksetup.pl</kbd> to see all kinds of useful information about it.
*   <kbd>Bugzilla::Object</kbd> now has many more abilities, including the ability to create and update objects in the database.
*   You may notice a huge cleanup in <kbd>post_bug.cgi</kbd> and the creation of <kbd>Bugzilla::Bug->create</kbd>.
*   localconfig variables are now accessed through <kbd>Bugzilla->localconfig</kbd>.
*   <kbd>UserInGroup</kbd> has been removed. You should use <kbd>Bugzilla->user->in_group</kbd> instead.

## mod_perl Support

Bugzilla now can be run under mod_perl. This allows for pages to load _much_ faster (up to six times faster) than they did previously. However, it uses up _much_ more memory than Bugzilla did previously. So if you're going to use it, make sure that you have enough memory available, around 1.5GB.

We'd really like some testing of Bugzilla under mod_perl! We know that some things don't work under mod_perl yet. You can see that at the [tracking bug](https://bugzilla.mozilla.org/show_bug.cgi?id=mod_perl) and its [dependency list](https://bugzilla.mozilla.org/showdependencytree.cgi?id=mod_perl&hide_resolved=1).

For more details, see the [documentation](/docs/tip/html/configuration.html#http-apache-mod_perl).

## The Road to Bugzilla 3.0

Bugzilla development freezes two weeks after today, meaning that no new enhancements will be accepted--we'll focus on fixing bugs. We then hope to have Bugzilla 3.0rc1 out by the end of the year, and the final Bugzilla 3.0 by early 2007.

To see our current plans, you can watch the [Bugzilla Calendar](https://www.google.com/calendar/embed?src=ih4fh7ks327mou7e3hifikokco%40group.calendar.google.com). It reflects only our current plans--it may change at any time.

## Upcoming EOL for Bugzilla 2.18

Users of Bugzilla 2.18 should be aware that it will reach End-Of-Life with the final release of Bugzilla 3.0\. Once Bugzilla 3.0 is released, no new patches will be released for Bugzilla 2.18, even for security issues.

We recommend that all Bugzilla 2.18 users upgrade to 2.22.1 (or 3.0, when it comes out) at their earliest convenience.

## Bugzilla Meetings

Come to our [meetings](https://wiki.mozilla.org/Bugzilla:Meetings) every other week! Anybody is welcome to attend who is interested in helping out with the Bugzilla Project, or just anybody who wants to put in their two cents on how development should go.

You can learn more about the meetings at the [wiki page about Bugzilla Meetings](https://wiki.mozilla.org/Bugzilla:Meetings).
