---
title: Bugzilla considering moving to git
date: 2013-11-25
categories:
- Updates
---
The Bugzilla Project is currently considering moving our source code
repository from Bazaar (bzr) to git.  Part of the impetus for this is
that Mozilla is trying to get out of the business of hosting every
version control system known to man (which they currently do, or close
to it anyway) and bzr is one of the low-hanging fruit (Bugzilla is the
only Mozilla project using it).  There's also a lot of feeling out there
that mirroring to github may make contributions easier for new
contributors. The general consensus on the thread so far is that we
should do it; the main point of contention is how long to keep it
mirrored in bzr after it moves.

What's your take on it?  We'd appreciate anyone who currently works on
Bugzilla or is contemplating it to join in on the discussion.

The main discussion thread is in [a thread on our developers
list](https://groups.google.com/forum/#!topic/mozilla.dev.apps.bugzilla/VkMOOQx3oYs/discussion),
and the metabug to track it is
[bug 929685](https://bugzilla.mozilla.org/show_bug.cgi?id=929685).
