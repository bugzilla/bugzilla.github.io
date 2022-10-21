---
title: 'Bugzilla Update: Wednesday, May 20, 2009'
date: 2009-05-20
author: ["mkanat"]
categories:
- Status
---
Hey hey. So, I was thinking that I'd do a regular (or semi-regular) post
on the status of the Bugzilla Project, for anybody interested. This is
the first one.

**Bugzilla 3.4**

We're getting pretty close to releasing Bugzilla 3.4rc1, now. There are
only [a few
blockers](https://bugzilla.mozilla.org/buglist.cgi?quicksearch=prod%3ABugzilla+flag%3Ablocking3.4%2B)
left. Mostly they're just awaiting review. I'll also need some help with
the [release process](http://www.bugzilla.org/docs/release.html) for
Bugzilla 3.4rc1, if anybody wants to help out.

The only significant changes since 3.3.4 will be a lot of bug fixes, a
change to the `Bug.search` WebServices API, and
the ability to hide the "See Also" field. The bug fixes are pretty
important, though, so if you're using 3.3.4 you definitely want to
update to the most recent `BUGZILLA-3\_4-BRANCH`
code regularly or update to 3.4rc1 when it comes out.

There are a lot of significant changes in 3.4 compared to Bugzilla 3.2,
though. Those will all be listed in the release notes for 3.4rc1. The
difference between 3.2 and 3.4 is not as great as the difference between
3.0 and 3.2 though. We're working on having smaller releases more often
(starting with 3.4), and it seems to be working pretty well so far.

**HEAD (Bugzilla 3.6)**

On trunk (which will be Bugzilla 3.6), we've done a fair bit. There's a
JSON-RPC interface, support for suexec environments in checksetup, and a
lot of HCI improvements. We've decided that for Bugzilla 3.6, our focus
isn't going to be adding major new features, but fixing up the features
we already have. I wrote [a message to the Bugzilla Developers
List](http://groups.google.com/group/mozilla.dev.apps.bugzilla/browse_thread/thread/cc670a329e681025)
about it, a week ago or so, and I got a lot of positive responses
(mostly on IRC or by private email). If you're interested in helping
out, feel free to check out the [list of bugs we'd like to fix for
Bugzilla 3.6](http://tr.im/36focus).
