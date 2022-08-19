---
title: Upgrading your Bugzilla? Don't forget to Sanity Check first.
date: 2012-12-06
categories:
- Updates
---
When planning on upgrading your Bugzilla to a newer version, it's always
a good idea to read the release notes in case of special instructions
that need to be done to handle certain situations in upgrades.  Our
checksetup.pl script has gotten pretty good at handling a lot of
situations automatically for you these days, but nothing is ever
perfect.

One instruction in the upgrade procedure for every release that often
gets overlooked is to run the Sanity Check function from the Admin page
on your Bugzilla site before upgrading.  It checks the integrity of the
data in your database and will alert you to a number of possible
problems with your data.  Sometimes bugs in Bugzilla or even people
manually messing with the database will cause something to not be how
Bugzilla expects it, and every so often one of these problems can cause
issues for an upgrade.  Fixing any problems reported by Sanity Check
before each upgrade can save you a lot of headaches.

In a recent example: newer versions of Bugzilla allow you to edit the
available statuses and resolutions on bugs.  Older versions didn't.  One
of the steps performed by the upgrade script is to examine your
database, take whatever current statuses you've been using (even if you
hacked your Bugzilla to allow different ones before we actually let you
customize them), and convert them to the way the new customizable ones
are stored.  The new custom status system has a flag to distinguish
between statuses that are allowed to have resolutions and those that
aren't.  When upgrading, it decides whether to set that flag on a status
or not by looking in your database to see if there are any bugs with
that status that have resolutions on them.  If it finds any, the status
is set up to use them.

A long time ago there was [Bug
107229](https://bugzilla.mozilla.org/show_bug.cgi?id=107229 "RESO FIXED - Resolution lost due to midair.")
which caused duplicate bugs to get the wrong status if you midaired
while marking it a duplicate.  This caused bugs to exist in an "ASSIGNED
DUPLICATE" state that should have been "RESOLVED DUPLICATE".  A side
effect is if it was left that way, when you later upgraded to a version
of Bugzilla that included the custom statuses, your ASSIGNED status
became a "closed" type instead of an "open" one, and would require a
resolution.  Sanity Check most likely would have caught this, as it
checks for things like resolutions where there shouldn't be any. :)
