---
title: Release of Bugzilla 4.1.2, 4.0.1, 3.6.5, and 3.4.11
date: 2011-04-27
author: ["mkanat"]
---
Hey Bugzilla users\! We just released [four new versions of
Bugzilla](http://www.bugzilla.org/news/#release401). There were a lot of
cool bug fixes in 3.6.5 and 4.0.1, but most importantly, **if you had
trouble installing Bugzilla 4.0, you should try again now with Bugzilla
4.0.1**. There was a problem with the way that our `install-module.pl`
script installed the Math::Random::Secure module--basically, it would
install the module even though the module's prerequisites failed to
install. Then when you tried to run `checksetup.pl`,
Math::Random::Secure would throw a cryptic error about
"Math::Random::Secure::irand."

Now, in 4.0.1 and 3.6.5, `install-module.pl` *won't* install the module
if installing it would break your system. Basically, following the
standard installation instructions should work fine, now. Bugzilla
3.4.11 took this a step further and no longer uses Math::Random::Secure
at all for this older branch (although don't worry, Bugzilla 3.4.x is
still secure).

For 4.1.2, we made this protection even more
extreme--`install-module.pl` now completely refuses to operate if you
don't have a compiler installed somewhere on your system (because so
many CPAN modules require a compiler, and CPAN throws *very* confusing
error messages when there is no compiler available on your system).

#### New Features in 4.1.2

All right, with all that out of the way, let's talk about new features
in 4.1.2\! Here's a quick list of important new things:

  - Extensions can call a `web\_dir` method to
    get the on-disk path to where web-accessible files should go for the
    extensions.
  - Work to improve Bugzilla's accessibility (per the WAI WCAG) is
    ongoing.
  - There's a new hook in Bugzilla::Install::Filesystem to allow
    extensions to create their own files, directories, etc.
  - Searching by relative dates (like 1d, 1w, etc.) now don't round you
    off to the beginning of the time period (that is, the beginning of
    the day, the start of the week) unless you put the letter "s" after
    them (exception: searching for "0d" or "0w" still gives you the
    start of that the current day, week, etc.).
  - New WebService function: Product.create
  - New WebService function: Group.create
  - If you change the requestee of a flag that is set to "?", the
    "requester" will *not* change.
  - install-module.pl now requires a compiler to be installed on the
    system.
  - Update to YUI 2.9.0.
  - contrib/bugzilla\_ldapsync.rb has been removed (it was
    non-functional).
  - If you are using some authentication method that uses the extern\_id
    field (like LDAP), you can now edit a user's extern\_id from the
    Users control panel.

#### The Plan For Pretty

So, as you may have read, the "Make Bugzilla Pretty" contest is over,
and [Jonathan Wilde](http://speedbreeze.com/) has won. The current plan
is for his UI to be the new official UI for Bugzilla 5.0, which will
come some time after 4.2.

Basically, the way that it will work is this: After we branch for 4.2,
we will create a new "pretty" branch. The Bugzilla team will work on
implementing the new UI in this branch, while simultaneously doing new
feature development on the normal Bugzilla trunk. Once the "pretty"
branch is ready, it will be merged back into the trunk. We can do this
all fairly efficiently thanks to [bzr](http://bazaar.canonical.com/).

Now, there is a chance that the "pretty" branch won't be ready by the
time we want to do the release that follows 4.2. In this case, that
release will be called 4.4 and the release *after* that will have the
new UI. However, we very much want to release the new UI as soon as
possible, so our goal is for 5.0 to be the release after 4.2.

#### Get Involved

As always, we love new contributors in every area. There are a [lot of
ways to contribute](http://www.bugzilla.org/contribute/) to
Bugzilla--you don't just have to be a programmer. In particular, we'd
really love to have somebody to be in charge of our documentation. If
you know anybody who's a great documenter (including yourself\!) who
wants to help out an open-source project, please [send them our
way](http://wiki.mozilla.org/Bugzilla:Communicate)\!
