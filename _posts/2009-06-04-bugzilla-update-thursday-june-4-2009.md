---
title: 'Bugzilla Update: Thursday, June 4, 2009'
date: 2009-06-04
author: ["mkanat"]
categories:
- Status
---
Well, it's time for another Bugzilla update\!

**Bugzilla 3.4**

In the Bugzilla 3.4 area, we just made some more changes to how the
login form in the header and footer work. Now it's easy again for users
to discover how to reset their password--when we moved the login forms
into the header/footer, we at first didn't have any way for people to
discover how to reset their password, but now there's a link and
everything works really nicely. You can see how it all works on the
[Bugzilla 3.4 Test
Installation](http://landfill.bugzilla.org/bugzilla-3.4-branch/).

We're getting somewhat closer to Bugzilla 3.4rc1. We found a few more
[blockers](http://tinyurl.com/bz34rc1), so those have to be resolved,
and there's also release notes that need to be written before we can
have a Release Candidate.

One new feature of Bugzilla 3.4 that we haven't talked much about is the
"See Also" field. This is a field where you can put a URL to a bug in
another Bugzilla installation or to a [Launchpad](http://launchpad.net)
bug. The "See Also" feature isn't quite complete--in the future, we also
want to make it update the other installation so that the other
installation knows that you're referring to it. We also want to fix up
the display, and get summary/status/resolution information on the remote
bug, etc. But for now it does check that you've entered a valid bug URL,
and at least you can somehow record that bugs in different Bugzilla
installations are related to each other, and there's a WebService
interface for updating the field.

For installations that don't need the "See Also" field, you can turn it
off by disabling the "use\_see\_also" Parameter.

**Bugzilla 3.6 (HEAD)**

We're working on various interesting things for Bugzilla 3.6, though our
focus recently has been on 3.4rc1, so there are a lot of patches
awaiting review for HEAD that haven't had the time to be reviewed.
People are working on the ability to disable field values and some cool
WebService enhancements, but of course our main focus is fixing up the
[HCI issues](https://bugzilla.mozilla.org/show_bug.cgi?id=bz-hci2008)
that the Carnegie-Mellon research team discovered in their 2008 study.
