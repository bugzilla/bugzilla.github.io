---
title: Release of Bugzilla 5.2, 5.0.4.1, and 4.4.14
date: 2024-09-03
author: ["justdave"]
categories:
- Releases
- Security
---
_posted by [Dave Miller](https://twitter.com/justdavemiller) \- Bugzilla Project Lead_

This has been a **long** time coming. Just over a year since we announced
the [new nonprofit to manage Bugzilla](/about/zarroboogs), we finally have a
set of releases to show for it. Our only excuse is that the lead developer is
a volunteer, has been working almost (but not quite) alone on it, and still has
to juggle his normal paying job. A little more about what can be done about that
below. First let's get to the big news!

## **The Releases**

Here's what we're releasing today:

**4.4.14** – The 4.4 branch has been on life support for a
**LONG** time (it was initially released in **2013!!!**). It supports outdated
OSes that are hard to find or install, let alone test for these days, and we’ve
been itching to drop it for a long time.  But our support policy says that we
have to support it for 4 months after the following two major releases.  The
next major release after 4.4 was 5.0, and there have been no major releases
after that until today.  **That four month countdown to End-of-Life starts
NOW.** This will be the final release of the 4.4 branch (barring any additional
security issues being found in the next 4 months).

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

**5.2** – This is our new stable release, and starts the 4 month
countdown for discontinuing the 4.4 branch. 5.2 is forked from the 5.0 branch
after 5.0.6, and will contain those schema and code formatting changes from
5.0.5 and 5.0.6 in it. So if you _**did**_ upgrade to 5.0.6, 5.2 will be
equivalent to a point upgrade for you.  Those schema changes should have caused
a major release to happen anyway, so this is just fixing the numbering problem
with that release (i.e. 5.0.5 should have been called 5.2 to begin with). Note
that **if you are using the 5.1.x development releases, those did NOT feed into
this**, and 5.2 would actually be a downgrade for you.

**5.3.3** – In order to avoid confusion with 5.2 above, the 5.1 branch has been
retroactively renumbered to 5.3. It is also basically dead, as we’ve put all of our resources
into finishing off the Harmony release (see 5.9.1 below). We’re going to
encourage people on 5.1.x/5.3.x to move to Harmony, but you’ll want to be mindful of
the release blockers first before you make the jump. There are some features in
5.1.x/5.3.x that were implemented differently in Harmony, and the code to migrate the
related data may or may not work yet (if the feature in question is listed on
the release blockers and you use it, you’ll want to wait for now). Even though
this branch is dead, we’re put out this release with the current batch of
security fixes so you aren’t left high and dry before Harmony is ready for you.

**5.9.1** – This is the first official release
off the Harmony branch, and is classified as a **developer preview
release**, not for production use. This is what will eventually be Bugzilla
6. The code is mostly good enough to use right now, but there are still
showstoppers to be able to fully release it as a production release. There are
also a few gotchas when upgrading from older versions of Bugzilla. If you’re
interested in helping make Bugzilla 6 happen, that list of showstoppers is
[here](//github.com/bugzilla/harmony/blob/main/RELEASE_BLOCKERS.md). We are
hoping to have Bugzilla 6 in release candidate stage (or at least in beta)
within the next few months.

## Download

Bugzilla is available at:

  [https://www.bugzilla.org/download/](https://www.bugzilla.org/download/)

## Release Notes & Changes

Before installing or upgrading, you should read the Release Notes for
this version of Bugzilla:

* [4.4.14 Release Notes](https://www.bugzilla.org/releases/4.4.14)
* [5.0.4.1 Release Notes](https://www.bugzilla.org/releases/5.0.4.1)
* [5.2 Release Notes](https://www.bugzilla.org/releases/5.2)
* [5.3.3 Release Info](https://www.bugzilla.org/releases/5.4)
* [5.9.1 Release Info](https://www.bugzilla.org/releases/6.0)

It is VERY IMPORTANT to read the Release Notes if you are
upgrading from one major version to another (like 4.4.x to 5.0.x).

You can also get a link to see a list of all changes between your version of
Bugzilla and the current version of Bugzilla on the above pages.

## Staying up-to-date with Bugzilla

You can see the latest updates from the Bugzilla Project and
the status of Bugzilla development on the [News page](https://www.bugzilla.org/news) of the Bugzilla website.

You can also follow us on our social media:

* [Mastodon](https://techhub.social/@bugzilla)
* [Twitter/X](https://x.com/bugzilla)


## Live streaming content

Bugzilla now has a [Twitch channel](https://twitch.tv/bugzillaproject)! We will
be streaming things like work sessions, triage parties, and tutorial content.
Can't make the scheduled live streams? You can watch the Video On Demand
recordings on our [YouTube channel](https://www.youtube.com/@bugzillaproject).
Regular streams are at 1pm US Eastern time on Saturdays. We may also stream at
other random times.

## Report Bugs

If you find a bug in Bugzilla, please [report it](https://www.bugzilla.org/contributing/reporting_bugs.html)!


## Support

You can ask questions for free on the mailing lists (or in online chat rooms)
about Bugzilla, or you can hire a paid consultant to help you out:

* [Free Support](https://www.bugzilla.org/support/)
* [Paid Support](https://www.bugzilla.org/support/consulting.html)


## Immediate **Help Wanted**

1. **Section 508 Compliance Audit**. There are a number of US government
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
expenses). See our [Donation page](/donate) to learn how!
- **Bug Triage!** As you probably noticed from the lack of updates around here
  in a while, the bug list hasn’t been getting paid much attention to, either.
Part of getting this project moving again means re-triaging the existing bug
reports. Some of them are really ancient and may not even apply to the current
code-base anymore. I’m going to have a blog post coming in the next week
or two with information on this topic (specifics for how
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
Bugzilla 6, and the new opportunities in store for
us with a real business entity to support the project now. Come find us in any
of our chat rooms (links are in the footer of [our
website](https://bugzilla.org/) alongside the social media links) or drop in on
our [developers mailing list](https://lists.bugzilla.org/listinfo/developers)
if you'd like to help.

## About Bugzilla

  Bugzilla is a "Defect Tracking System" or "Bug-Tracking System."
Defect Tracking Systems allow individuals or groups of developers
to keep track of outstanding bugs in their product effectively.
Most commercial defect-tracking software vendors charge enormous
licensing fees. Despite being "free", Bugzilla has many features
its expensive counterparts lack. Consequently, Bugzilla has quickly
become a favorite of thousands of organizations across the globe, and
is widely regarded as one of the top defect-tracking systems available.

  See [https://www.bugzilla.org/about/](https://www.bugzilla.org/about/) for more details.
