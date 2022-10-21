---
title: 'Bugzilla Update: Wednesday, July 8, 2009 (Release of Bugzilla 3.4rc1 and Bugzilla
  3.2.4)'
date: 2009-07-08
author: ["mkanat"]
categories:
- Status
---
Well, it's time for another Bugzilla update\! And today I just did two
releases, [Bugzilla 3.4rc1](http://www.bugzilla.org/releases/3.4/) and
[Bugzilla 3.2.4](http://www.bugzilla.org/releases/3.2.4/).

**Bugzilla 3.4rc1**

Bugzilla 3.4rc1 is particularly exciting, because it's our first Release
Candidate for 3.4. We did a really good job on this Release Candidate, I
think--there's only one 3.4 blocker remaining (and it's only still there
because we're waiting on an external party to do something). In other
words, there are no known issues with the Release Candidate that are so
bad that we couldn't just call it 3.4 next week if all goes well, and
we've never actually been in that state for a Release Candidate, at
least not as long as I've been around the Bugzilla Project.

One of the particularly exciting thing about a Release Candidate is that
it has [release
notes](http://www.bugzilla.org/releases/3.4/)\! That
means that [all the new
features](http://www.bugzilla.org/releases/3.4/#v34_feat)
are listed. There's a lot of really exciting stuff in 3.4, and you
should take a look. There are some gems in the "Other Enhancements and
Changes" section, too, so make sure you read that too. :-)

**WebService Changes Since 3.3.4**

Anybody who was writing WebService clients against 3.3.x development
releases should know: we renamed the `Bug.get\_history` method to
`Bug.history`. You can still call it as `Bug.get\_history` if you want,
but that's undocumented and not recommended.

Also, we don't send `\<nil\>` for NULL items anymore--too many clients
didn't support it. Now we just remove items from the returned result if
they are undefined. (This is documented in the [Bugzilla::WebService
documentation](http://www.bugzilla.org/docs/3.4/en/html/api/Bugzilla/WebService.html).)

**Progress Toward Bugzilla 3.6**

There's been some activity on `HEAD` since our last update. We got a new
WebService method to get attachment information, `Bug.attachments`. I've
been working on making Quicksearch (the search box in the header and
footer) even faster. Greg Hendricks (of
[Testopia](http://www.mozilla.org/projects/testopia/) fame) has been
working on the ability for administrators to "disable" certain field
values (so that they don't show up as options anymore, but remain set on
existing bugs). And Bradley Baetz has been adding new hooks and working
on improving performance in some important areas.

There's no ETA for Bugzilla 3.6, but if it works anything like how
Bugzilla 3.4 works, we will have open development on it until two months
after Bugzilla 3.4 is released, and then we will branch for 3.6 and the
3.6 branch will be "frozen" to only bug-fixes.

**Bugzilla Meeting**

We have a [Bugzilla Meeting](https://wiki.mozilla.org/Bugzilla:Meetings)
next week, on Tuesday, July 14. Just read the page if you want more
information\! Anybody is welcome to attend.
