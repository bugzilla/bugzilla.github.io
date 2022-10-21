---
title: 'VCS updates: bzr moving, cvs ending'
date: 2015-04-21
author: ["mcote"]
categories:
- Updates
---
At the [Bugzilla project meeting
on 2015-03-25](https://wiki.mozilla.org/Bugzilla:Meetings:2015-03-25)
the project lead and assistant leads agreed on two major changes to
Bugzilla's source-code hosting:

1.  CVS support is officially dropped as of now. 4.0 is the last version
    that was released on CVS, and it will be EOLed when 5.0 comes out
    (very soon; rc3 was just released). In the event of a release on the
    4.0 branch before it is EOLed, any Bugzilla installations that have
    not migrated to bzr or git will have to apply
    [patches](https://www.bugzilla.org/download/#v40) to upgrade, which
    will continue to be distributed as usual. Bugzilla site admins are
    strongly encouraged to [migrate to pulling from
    git.mozilla.org](//bugzilla.readthedocs.org/en/latest/installing/migrating-from-cvs.html)
    as soon as possible.
2.  Bazaar hosting has been officially switched from bzr.mozilla.org to
    bzr.bugzilla.org. bzr.bugzilla.org is already active and syncing
    changes from git.mozilla.org. bzr.mozilla.org is no longer syncing
    changes and will soon be shut down. Any sites upgrading from
    bzr.mozilla.org **must** do one of the following to apply any future
    upgrades, in order of preference:



  - Switch to [upgrading from
    git.mozilla.org](//bugzilla.readthedocs.org/en/latest/installing/migrating-from-bzr.html).
  - Switch to pulling from bzr.bugzilla.org. See instructions at
    <https://bzr.bugzilla.org/>.
  - Apply the released patch.

bzr.bugzilla.org will continue to mirror changes from git.mozilla.org
for the 4.0, 4.2, and 4.4 branches as long as they are supported. Note
that, at the moment, master/trunk is being mirrored as well, but no
other branches, including and subsequent to 5.0, will be mirrored to
bzr.bugzilla.org, and trunk mirroring may cease at any time.

Note that bzr.bugzilla.org is [waiting on a proper
certificate](https://bugzilla.mozilla.org/show_bug.cgi?id=1155525);
please use plain http until this is resolved.

The Bugzilla team apologizes for any inconvenience. Please see our
[support options](https://www.bugzilla.org/support/) if you have trouble
migrating.

Mark Côté  

Assistant Project Lead, Bugzilla
