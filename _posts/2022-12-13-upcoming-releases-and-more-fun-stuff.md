---
title: Upcoming releases and more fun stuff
date: 2022-12-13
author: ["justdave"]
categories:
- Updates
---
_posted by [Dave Miller](https://twitter.com/justdavemiller) \- Bugzilla Project Lead_

Surprise!  Bugzilla's not dead yet. :-)

So I posted a bunch of this a few months ago on the developers mailing list but it's time to get it in front of a bigger audience. :-)

I am trying to kick-start getting stuff moving again with Bugzilla since most of the core Bugzilla volunteers have had job changes over the last few years that have left them with less time to spend on the project, so things have been very slow going for a while. For those that don't know, I've been more or less of a figurehead of a project leader for a number of years now, not having much time to spend on Bugzilla, but not having anyone in a position to be able to step in to replace me, and only stepping in myself to make decision calls when the other developers were at an impasse.  I've attempted to hand off control of the project to someone else twice in the last 10 years or so, and both times, the person I was about to hand off to got a new job and didn't have time for it anymore just before we were about to do the hand-off (on the plus side, that happened before they took over and not after).  It takes a while for someone to build the trust needed to know I'm leaving it in good hands, so without a lot of active developers it's hard to get someone in place to do that.  But I've had some life changes of my own now, which actually give me **more** time to spend on Bugzilla finally, so I'm getting back in the saddle and taking direct control again.  I've probably poked at it more in the last 5 or 6 months than I have in the last 5 or 6 years combined.

I have started a new consulting business, and I've been trying to structure it in a way that allows me to spend time on Bugzilla again. (If you want to hire me to help with your Bugzilla, or help funding work on upstream Bugzilla, feel free to contact me, even if I'm not publicly advertising yet)

Now back to the nitty gritty and my plans for this project.

**There is a call for help in this post below the release information.** If you can give us a hand it would be greatly appreciated. Not all of it is code-related, so there might be something you can do even if you're not a coder!

### Infrastructure Updates

Prior to a few weeks ago, our [main website](https://www.bugzilla.org/) hadn't been updated beyond quick bugfixes to content in a long time. [LCP](https://twitter.com/ohellcp) recently did a full overhaul of the website to modernize it and make information easier to find. We deployed this a few weeks ago, so go have a look! It looks awesome! It also has RSS feeds!

Also over the last couple months, I've been working on getting some of the project infrastructure back in place to help support active development. Among the list of things that have gotten done are:

- getting our testing suite moved into GitHub Actions so that it runs automatically on every commit
- updating our IRC bot, both to get it to talk to the IRC server again (which it stopped doing recently due to outdated SSL versions), and to update the mail parsing code in it to handle newer versions of Bugzilla (most importantly bugzilla.mozilla.org, where our own notification emails would be coming from).
- Setting up a private Git repository for security commits so that we can stage and test them prior to release without exposing them to the public prior to disclosures.

### **The Release Plans**

I would like to put out a new multi-branch release of Bugzilla as soon as we can get all the pieces in place to do so. I was hoping to do this within a few weeks of the original post to the developers list, but that was back in August and it hasn't happened yet. At this point I think we'll be really lucky if it happens before the end of December; though mid-January is definitely a possibility. As a forewarning to everyone, there will be security content in it, and that's part of the holdup. For obvious reasons I can't ask for help with the security bugs outside of the existing core developer team, as that risks exposure to hackers that might take advantage of it before users have a chance to update. So we ask for your patience while we work through these issues and get them ready to land.

The 4.4 branch has been on life support for a **LONG** time (it was initially released in **2013!!!**), supports outdated OSes that are hard to find or install, let alone test for these days, and we've been itching to drop it for a long time.  But our support policy says that we have to support it for 4 months after the following two major releases.  The next major release after 4.4 was 5.0, and there have been no major releases after that, which means that 4 month countdown hasn't even started yet.

**4.4.14** \- I am intending this to be the final release of the 4.4 branch (barring any additional security issues being found in the next 4 months) as the 5.2 release below will start that 4 month countdown to End-of-Life this branch.

**5.0.4.1** \- Why 5.0.4.1 when there's a 5.0.6 release?  Well, if you paid attention to the change logs, 5.0.5 and 5.0.6 contained a massive schema change, as well as reformatting almost all of the Perl code in the source, both of which are a violation of our support policy for a stable branch (a new-to-the-process release manager pushed the release out not realizing that, and by the time we caught it, it was too late). A lot of people noticed this and never upgraded to 5.0.5 or 5.0.6, since they didn't contain any security fixes.  5.0.4.1 will give those people additional fixes for 5.0.4 without forcing them to pick up those schema and code reformatting changes. Additional updates to the 5.0 branch from now on will continue from 5.0.4.2 and onward.

**5.2** \- This will be the next major release, and will start the 4 month countdown for discontinuing the 4.4 branch. 5.2 is forked from the 5.0 branch after 5.0.6, and will contain those schema and code formatting changes from 5.0.5 and 5.0.6 in it. So if you _**did**_ upgrade to 5.0.6, 5.2 will be equivalent to a point upgrade for you.  Those schema changes should have caused a major release to happen anyway, so this is just fixing the numbering problem with that release (i.e. 5.0.5 should have been called 5.2 to begin with). Note that **if you are using the 5.1.x development releases, those did NOT feed into this**, and 5.2 would actually be a downgrade for you.

**5.1.3** \- The 5.1 branch is basically dead, as we've put all of our resources into finishing off the Harmony release (see 5.9.1 below). We're going to encourage people on 5.1.x to move to Harmony, but you'll want to be mindful of the release blockers first before you make the jump. There are some features in 5.1.x that were implemented differently in Harmony, and the code to migrate the related data may or may not work yet (if the feature in question is listed on the release blockers and you use it, you'll want to wait for now). Even though this branch is dead, we're going to put out a release with the current batch of security fixes so you aren't left high and dry before Harmony is ready for you.

**5.9.1** \- This will be the first official release off the Harmony branch, and will be classified as a **developer preview release**, not for production use.  This is what will eventually be Bugzilla 6.  The code is mostly good enough to use right now, but there are still showstoppers to be able to fully release it as a production release. There are also a few gotchas when upgrading from older versions of Bugzilla. If you're interested in helping make Bugzilla 6 happen, that list of showstoppers is [here](https://github.com/bugzilla/harmony/blob/main/RELEASE_BLOCKERS.md).

### **Immediate Help Wanted**

There's a few things (not all necessarily code related) that I would love to get help with prior to the above releases. This list is not entirely the same as the one that was in the original post to the developers list. Some of the items in that list actually got done! Yay! Thanks to those of you who pitched in!

1. **Documentation**.  This is going to be primarily for the newer branches, but the older ones are going to need some help as well.  Installation instructions mostly.  The examples in the docs use ancient versions of the OSes that are given as sample installs, and no sane person is going to be using an OS that old on a new install.  So the installation sections of the docs need to be updated to use modern versions of the OSes in the instructions and examples. See also [Bug 1785943](https://bugzilla.mozilla.org/show_bug.cgi?id=1785943). This has been done for the 5.0 and 5.2 branches (thanks, LCP!) but still needs to be done for 4.4 and Harmony. In fact, Harmony needs a LOT of documentation help, as what's there now is pretty specific to trying to produce a testing environment for bugzilla.mozilla.org, rather than a standalone Bugzilla.
2. **Section 508 Compliance Audit**. There are a number of US government agencies who use Bugzilla internally (NASA is a publicly visible example).  New US government projects have to comply with the new accessibility guidelines in Section 508 of the Communications Act, so if we want them to be able to upgrade we need to comply (at least in our newer versions).  See [https://section508.gov/](https://section508.gov/). There is a template for a compliance statement at [https://www.section508.gov/sell/vpat/](https://www.section508.gov/sell/vpat/).  I would love to get a volunteer (or a company who can sponsor someone?) who could audit the 5.2 and harmony branches for compliance, file bugs for things that are violations, and figure out how much of the VPAT we can actually provide at this point.  Even if we're not compliant yet (I suspect we aren't) I would love to be able to provide a statement with the 5.2 release saying how compliant we are, and listing what's left to be fixed to make us compliant. See also [Bug 1785941](https://bugzilla.mozilla.org/show_bug.cgi?id=1785941).

### Ongoing Help Wanted

There's also a few things not specifically related to the above release that we'd love to get help with on an ongoing basis:

- **Bug Triage!** As you probably noticed from the lack of updates around here in a while, the bug list hasn't been getting paid much attention to, either. Part of getting this project moving again means re-triaging the existing bug reports. Some of them are really ancient and may not even apply to the current code-base anymore. I'm going to have another blog post coming in the next day or two with information on this topic (specifics for how to help with it), so keep an eye out for that post!
- **Paid Developer Time**. If you are a business that makes use of Bugzilla, and has a staff person responsible for maintaining your Bugzilla installation, and that person is willing, please consider officially sponsoring that person to help with upstream Bugzilla development for at least a few hours per week. Most of our lack of development lately has happened because the last few companies that used to do that stopped providing developer time during the economic downturn a few years back (either laid off said person or pulled them away to work on other things), and they haven't returned. The developers we have currently are all volunteer, and most of them are struggling to find time to work on it.

### **In Conclusion...**

If you can help with any of these things, visit us on IRC or Matrix (links to both can be found in the left sidebar on [https://bugzilla.org/](https://bugzilla.org/) ), join the [developer mailing list](https://lists.bugzilla.org/listinfo/developers) and post there, or add comments to the above-listed bugs.

\-\-

[Dave Miller](https://twitter.com/justdavemiller)

Bugzilla Project Lead

