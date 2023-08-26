---
title: Bugzilla Celebrates 25 Years With Special Announcements
date: 2023-08-26
author: ["justdave"]
categories:
- Updates
---
_posted by [Dave Miller](https://twitter.com/justdavemiller) \- Bugzilla Project Lead_

## **Happy 25th Birthday to Bugzilla!**

Today, August 26, marks the 25th anniversary of Bugzilla!

The first two paragraphs lifted from our [Bugzilla history](https://www.bugzilla.org/about/):

> When mozilla.org first came online in 1998, one of the first products that
> was released was Bugzilla, a bug system implemented using freely available
> open source tools. Bugzilla was originally written in
> [TCL](http://www.tcl.tk/scripting/) by Terry Weissman for use at mozilla.org
> to replace the in-house system then in use at Netscape. The initial
> installation of Bugzilla was deployed to the public on a mozilla.org server
> on [April 6, 1998](https://www-archive.mozilla.org/news.html#p17).
>
> After a few months of testing and fixing on a public deployment, Bugzilla was
> finally released as open source via anonymous CVS and available for others to
> use on [August 26, 1998](https://www-archive.mozilla.org/news.html#p44). At
> this point. Terry decided to port Bugzilla to [Perl](http://www.perl.org),
> with the hopes that more people would be able to contribute to it, since Perl
> seemed to be a more popular language. The completion of the port to Perl was
> announced on [September 15,
> 1998](https://www-archive.mozilla.org/news.html#p51), and committed to CVS
> [later that
> night](https://github.com/bugzilla/bugzilla/commit/4727e6c09f88e63f02e6c8f359862d0c0942ed36).

25 years is a long time in the software world, and it makes us happy that so
many people still use Bugzilla to track bug reports and feature requests for
their own products. We hope to continue to breath life into Bugzilla and
continue to modernize it over the years to come!

## **New Legal Entity to Manage the Bugzilla Project**

Back in December I made an [enthusiastic
post](https://bugzillaupdate.wordpress.com/2022/12/13/upcoming-releases-and-more-fun-stuff/)
about getting Bugzilla back in motion after it kind of stalled for a while. And
then after a month I kind of stopped posting about it. So what happened?

Well, response to that post was actually pretty enthusiastic in itself. I heard
from several people who wanted to donate money to the project to get it going
again. Which then led to a new problem: we didn't actually have a legal way to
accept donations at the time. So after asking around a bit, and a few
conference calls between myself, my own company's lawyer, and a couple of
Mozilla's lawyers, it was decided that Bugzilla needed a legal entity to manage
it, similar to how Thunderbird has been operating recently. And, that's where
the little bit of time that I've had to spend on Bugzilla has gone the last 6
months. And as you can understand, with the legal work going on in the
background, there wasn't much I could actually talk about until all of the
pieces were actually in place.

Which now brings us to today, when I'm happy to announce the formation of Zarro
Boogs Corporation, which will now be overseeing the Bugzilla Project. This is a
taxable non-profit non-charitable corporation - we have filed with the IRS our
intent to operate under US Tax Code §501(c)(4) (still pending approval from the
IRS) meaning the IRS would require us to spend money raised on project expenses
and not make a profit, but money donated to us will not earn you a tax
deduction because we aren't a charity (software development is not considered a
charitable cause in the US). Unlike Thunderbird, which is a subsidiary of the
Mozilla Foundation, we are an independent entity not owned by or associated
with the Mozilla Foundation, although they have licensed the use of the
Bugzilla trademark to us.

The name Zarro Boogs Corporation is a shout-out to the phrase returned by
Bugzilla when you run a search which returns no results, "Zarro Boogs found."
The buggy spelling of "Zero Bugs" being intentional because it's generally
believed that there's no such thing as a project with zero bugs in it, only
bugs that haven't yet been reported, thus, saying "Zero Bugs" is, in itself,
buggy. There's a nice write-up of this on
[Wikipedia](https://en.wikipedia.org/wiki/Bugzilla#Zarro_Boogs).

If you would like to contribute to the project, we have a donation page set up
on [GitHub Sponsors](https://github.com/sponsors/bugzilla). We hope to have
additional ways to donate that don't require a GitHub account in the future.

## **Upcoming Releases**

Those releases I talked about back in December are finally happening!  Look for
these (except for 5.9.1) this coming week!  Right now we're aiming for
Wednesday, August 30th. We are aiming for September 15 for 5.9.1 (because it's
the 25th anniversary of the port from Tcl to Perl).

**4.4.14** – The 4.4 branch has been on life support for a **LONG** time (it
was initially released in **2013!!!**). It supports outdated OSes that are hard
to find or install, let alone test for these days, and we’ve been itching to
drop it for a long time.  But our support policy says that we have to support
it for 4 months after the following two major releases.  The next major release
after 4.4 was 5.0, and there have been no major releases after that, which
means that 4 month countdown hasn’t even started yet. I am intending this to be
the final release of the 4.4 branch (barring any additional security issues
being found in the next 4 months) as the 5.2 release below will start that 4
month countdown to End-of-Life this branch.

**5.0.4.1** – Why 5.0.4.1 when there’s a 5.0.6 release?  Well, if you paid
attention to the change logs, 5.0.5 and 5.0.6 contained a massive schema
change, as well as reformatting almost all of the Perl code in the source, both
of which are a violation of our support policy for a stable branch (a
new-to-the-process release manager pushed the release out not realizing that,
and by the time we caught it, it was too late). A lot of people noticed this
and never upgraded to 5.0.5 or 5.0.6, since they didn’t contain any security
fixes.  5.0.4.1 will give those people additional fixes for 5.0.4 without
forcing them to pick up those schema and code reformatting changes. Additional
updates to the 5.0 branch from now on will continue from 5.0.4.2 and onward.

**5.2** – This will be the next major release, and will start the 4 month
countdown for discontinuing the 4.4 branch. 5.2 is forked from the 5.0 branch
after 5.0.6, and will contain those schema and code formatting changes from
5.0.5 and 5.0.6 in it. So if you _**did**_ upgrade to 5.0.6, 5.2 will be
equivalent to a point upgrade for you.  Those schema changes should have caused
a major release to happen anyway, so this is just fixing the numbering problem
with that release (i.e. 5.0.5 should have been called 5.2 to begin with). Note
that **if you are using the 5.1.x development releases, those did NOT feed into
this**, and 5.2 would actually be a downgrade for you.

**5.1.3** – The 5.1 branch is basically dead, as we’ve put all of our resources
into finishing off the Harmony release (see 5.9.1 below). We’re going to
encourage people on 5.1.x to move to Harmony, but you’ll want to be mindful of
the release blockers first before you make the jump. There are some features in
5.1.x that were implemented differently in Harmony, and the code to migrate the
related data may or may not work yet (if the feature in question is listed on
the release blockers and you use it, you’ll want to wait for now). Even though
this branch is dead, we’re going to put out a release with the current batch of
security fixes so you aren’t left high and dry before Harmony is ready for you.

**5.9.1** – **Coming September 15!** This will be the first official release
off the Harmony branch, and will be classified as a **developer preview
release**, not for production use.  This is what will eventually be Bugzilla
6.  The code is mostly good enough to use right now, but there are still
showstoppers to be able to fully release it as a production release. There are
also a few gotchas when upgrading from older versions of Bugzilla. If you’re
interested in helping make Bugzilla 6 happen, that list of showstoppers is
[here](//github.com/bugzilla/harmony/blob/main/RELEASE_BLOCKERS.md). We are
hoping to have Bugzilla 6 in release candidate stage (or at least in beta) by
the end of November. The security content for this branch that goes with the
other branch releases will be committed to git at the same time the other
releases get them, since anyone who has this already will only have it via git
pull.

## Immediate **Help Wanted**

1. **Documentation**. Harmony (5.9.1) in particular needs a LOT of
   documentation help, as what’s there now is pretty specific to trying to
produce a testing environment for bugzilla.mozilla.org, rather than a
standalone Bugzilla.
2. **Section 508 Compliance Audit**. There are a number of US government
   agencies who use Bugzilla internally (NASA is a publicly visible example).
New US government projects have to comply with the new accessibility guidelines
in Section 508 of the Communications Act, so if we want them to be able to
upgrade we need to comply (at least in our newer versions).  See
[https://section508.gov/](https://section508.gov/). There is a template for a
compliance statement at
[https://www.section508.gov/sell/vpat/](https://www.section508.gov/sell/vpat/).
I would love to get a volunteer (or a company who can sponsor someone?) who
could audit the 5.2 and harmony branches for compliance, file bugs for things
that are violations, and figure out how much of the VPAT we can actually
provide at this point.  Even if we’re not compliant yet (I suspect we aren’t) I
would love to be able to provide a statement with the 5.2 release saying how
compliant we are, and listing what’s left to be fixed to make us compliant. See
also [Bug 1785941](https://bugzilla.mozilla.org/show_bug.cgi?id=1785941). Some
work has been done on this (as you can see in the dependent bugs to that one)
but it still needs help.

## **Ongoing Help Wanted**

You can always find a list of ways to contribute to Bugzilla on our
[Contributing page](http://bugzilla.org/contributing/). A few highlights with
additional details:

- **Donate Money**. Now that we have a legal entity capable of paying
  developers, we need money to pay them with (and also cover our server hosting
expenses). You can donate via our [GitHub
Sponsors](https://github.com/sponsors/bugzilla) page. If you don't have and
can't create a GitHub account, we hope to have other ways to donate in the
future.
- **Bug Triage!** As you probably noticed from the lack of updates around here
  in a while, the bug list hasn’t been getting paid much attention to, either.
Part of getting this project moving again means re-triaging the existing bug
reports. Some of them are really ancient and may not even apply to the current
code-base anymore. I’m going to have another blog post coming in the next day
or two (for real this time) with information on this topic (specifics for how
to help with it), so keep an eye out for that post!
- **Code!** Once we get the above triage moving, there will be bugs to fix!
  Bugzilla is an Open Source project, and anyone can contribute! We also have a
relatively small user base compared to some of the big projects out there, so
the amount of development we'll be able to fund internally from our donations
will still be limited. It will probably make better sense for us to use our
internal developers (once we have money to pay some) to review patches and
coach external contributors, instead of having them directly producing code.
- **Paid Developer Time**. If you are a business that makes use of Bugzilla,
  and has a staff person responsible for maintaining your Bugzilla
installation, and that person is willing, please consider officially sponsoring
that person to help with upstream Bugzilla development for at least a few hours
per week. Most of our lack of development lately has happened because the last
few companies that used to do that stopped providing developer time during the
economic downturn a few years back (either laid off said person or pulled them
away to work on other things), and they haven’t returned. The developers we
have currently (until we get money donated as listed above) are all volunteer,
and most of them are struggling to find time to work on it.

## In Conclusion

We have a lot of excitement ahead of us with the first developer preview of
Bugzilla 6 coming later this week (I was hoping to have that for you all today
as well, but we didn't quite make it), and the new opportunities in store for
us with a real business entity to support the project now. Come find us in any
of our chat rooms (links are in the footer of [our
website](https://bugzilla.org/) alongside the social media links) or drop in on
our [developers mailing list](https://lists.bugzilla.org/listinfo/developers)
if you'd like to help.
