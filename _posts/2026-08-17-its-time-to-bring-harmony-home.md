---
title: It's time to bring Harmony home
date: 2026-08-17
author: ["justdave"]
categories:
- Development
comments:
  enabled: true
---
Many Years Ago™ Dylan created a ("temporary"!) repo to house an
experiment with trying to merge bugzilla.mozilla.org's fork of Bugzilla
(henceforth called BMO) back upstream. And thus,
[Harmony](https://github.com/bugzilla/harmony) was born. As this experiment turned
out to be largely successful (though much delayed) and is now considered
our primary development branch, it's time for it to live in the actual
[Bugzilla](https://github.com/bugzilla/bugzilla) repo instead of off on
its own.

This post is aimed at developers and those who customize Bugzilla or otherwise
obtain it from git. If that's not you, the rest of this post will probably be
confusing, so you're welcome to skip it.

Here's my plan:

 1. `bugzilla/harmony:main` will be force-pushed to `bugzilla/bugzilla:main`
    (which does not exist yet)
 2. `bugzilla/bugzilla:master` (which is currently the 5.3 development
    branch) will be renamed to `bugzilla/bugzilla:5.3-dev`.
 3. `bugzilla/bugzilla:main` and `bugzilla/harmony:main` will need to get
    synced with each other frequently until the Pull Requests in the harmony repo
    are cleaned up.
 4. `bugzilla/harmony` will live long enough for its existing PRs to
    either land (and then be synced to `bugzilla/bugzilla`) or close
    unmerged, and then it will be marked archived.

There are some minor issues with that which I'd like to make everyone
aware of:

 1. The rename of `bugzilla:master` to `bugzilla:5.3-dev` will cause people
    with existing `bugzilla:master` checkouts to get told the branch no
    longer exists when they try to pull. But I think this is important
    to do anyway to avoid master and main being confused with each other.
 2. GitHub's automatic links to Pull Requests in commit messages will
    break. By default, GitHub puts the PR number in the summary line of
    a commit when it gets merged. When you view the commit log on
    GitHub, the PR number gets linked and you can click on it to get to
    the PR. After the branch moves into the bugzilla repo, these
    auto-generated links will link to PRs with the same number in the
    bugzilla repo instead of the harmony repo, which will obviously be
    wrong.  Note that Harmony already has this problem with PRs that
    originated on BMO before we forked (because the numbers belong to
    `mozilla-bteam/bmo` PRs). This is probably acceptable breakage. MOST
    of the PRs are linked from their associated Bugzilla bug reports,
    and the bug number should *also* be in the commit message. Going to
    the bug and following the link back to the PR from there should
    still go to the right place.

I haven't set a date on this yet. I'd like to do it Soon™ but as we
actually have developers working on the Bugzilla 6 blockers now, I'm
thinking we stall until most of the blockers land (because there are
several in PRs already in the harmony repo) and that will make less work
keeping the two in sync until the PRs are cleaned up.

Anyone have any thoughts on this?
