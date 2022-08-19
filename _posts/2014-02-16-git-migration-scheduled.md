---
title: Git Migration Scheduled
date: 2014-02-16
author: ["mcote"]
categories:
- Updates
---
A migration of Bugzilla and related code from bzr.mozilla.org to
git.mozilla.org will be perfomed on Tuesday, 11 March 2014, starting at
17:00 UTC.  At this time, all Bazaar branches on bzr.mozilla.org will be
made read-only (aside from a few admin accounts), and the migration to
git repos on git.mozilla.org will commence.  It should take around 1.5
hours to migrate everything, after which point write access will be
enabled on the git repos for all users previously authorized on
bzr.mozilla.org.  A script will periodically mirror changes from git to
bzr for all currently supported Bugzilla branches (4.0, 4.2, and 4.4). 
Changes will not be mirrored for any other branches of Bugzilla nor any
other related branches (extensions, misc, etc.).

We will start mirroring changes to read-only repos on GitHub at some
point (to be determined) after the migration to git.mozilla.org.
git.mozilla.org will remain the repository of record, meaning the only
place to which changes should be committed by developers.  All
mirroring, e.g. to GitHub and bzr.mozilla.org, will be unidirectional.

We've already done one test migration; see <http://git.mozilla.org>.  It
was successful aside from some missed file deletions, resulting in extra
files on a handful of git repos after the migration.  I manually deleted
the superfluous files after migration, and I also fixed the migration
script to account for this oddity in Bazaar's fast-export output, so it
won't happen during the real migration.

I would like to open up testing to all developers, starting with another
complete, fresh migration, on Tuesday, 18 February 2014, around 17:00
UTC.  To test the git-to-bzr mirroring script, we'll create a new
branch, "migration-test", off of Bugzilla trunk and run the mirroring
script on it after the migration.  We'll leave it running until the real
migration, and I invite anyone with commit access to bzr.mozilla.org to
commit changes to the test-migration branch on git and ensure that they
are mirrored properly to bzr.

The full migration and testing plan, along with other details, is at
<https://wiki.mozilla.org/Bugzilla:Migrating_to_git>.
