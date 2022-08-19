---
title: "Status Update"
date: 2005-07-07
author: ["glob", "mkanat"]
categories:
- Status
---

## Introduction and Updates

Welcome to the July 2005 Bugzilla Status Update, covering the status of the Bugzilla project since the May 11th Update.

In this update we are pleased to announce the release of Bugzilla 2.20 Release Candidate 1 (rc1) and Bugzilla 2.18.2.

As usual, we'd like to remind all Bugzilla administrators that to assist them in keeping up-to-date with release announcements and security advisories, we provide an ultra-low-volume administrator mailing list ([announce@bugzilla.org](https://lists.bugzilla.org/cgi-bin/mj_wwwusr?func=lists-full-long&extra=announce)). We advise all Bugzilla administrators to subscribe so they can keep up with important Bugzilla announcements.

Those looking to get involved with Bugzilla development may want to consider joining the [developers list (developers@bugzilla.org)](https://lists.bugzilla.org/cgi-bin/mj_wwwusr?user=&passw=&func=lists-long-full&extra=developers). This list offers discussion on new features and issues. Developers are invited to subscribe to the list. You may also want to read our [Contributor's Guide](https://www.bugzilla.org/docs/contributor.html).

## New Releases

### 2.20rc1

This release is a developer's release and is not recommended for production use, but all existing users of the 2.19 development branch are strongly encouraged to upgrade to 2.20rc1\. The 2.20rc1 release is the culmination of the most active three months in Bugzilla development history. 2.20rc1 resolves many bugs with the 2.19.3 release.

In particular, PostgreSQL support is considerably more stable than it was in 2.19.3\. There are still a few known bugs, but a PostgreSQL Bugzilla should be usable for day-to-day work in small production environments.

We also have finally written up a list of the [new features in 2.20](/releases/2.20/), so go look at them if you're curious as to exactly what new bells and whistles we've added to Bugzilla.

The final 2.20 release will be shaped by your feedback on 2.20rc1 in the next week or two, so please do let us know your comments, either by filing a bug or by telling the mozilla-webtools list/newsgroup. (Details on how to access mozilla-webtools are on the [Support page](/support/).

### 2.18.2

2.18.2 is our second bug-fix release for 2.18, and we encourage anybody running 2.18 to update to 2.18.2.

In particular, you may notice that createaccount.cgi now works even when the "requirelogin" parameter is turned on.

### New Features Since the Last Status Update

In 2.20rc1, you can now localize the names that will be displayed for Statuses and Resolutions. They are in global/field-descs.html.tmpl in the templates.

Other than that, we just fixed a lot of bugs!

### Trunk Checkins Since the Last Status Update

You can see a list of all recent changes to Bugzilla code using the table on our [detailed changes page](https://github.com/bugzilla/bugzilla/compare/).
