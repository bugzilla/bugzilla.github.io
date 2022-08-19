---
title: 'The First Bugzilla Users & Administrators Group: August 4, 2010'
date: 2010-08-17
author: ["mkanat"]
categories:
- Updates
---
On Wednesday, August 4, we had the first Bugzilla Users & Administrators
Group meeting, at the Wikimedia Foundation in San Francisco. In
attendance were representatives from the Wikimedia Foundation, NASA,
Yahoo\!, the NTP Project, and the Bugzilla Project.

The event was catered with full meals and drinks (both beer and sodas)
for anybody who wanted to take advantage of them.

Max Kanat-Alexander, one of the lead Bugzilla developers, went over some
of the new features that are coming in Bugzilla 4.0, which spawned some
discussion about WebServices between the attendees, and how best to use
the new and existing features to implement various workflows.

This flowed nicely into a discussion of project management, and how best
to implement project management around Bugzilla. The needs of the
attendees around project management were all quite different, but we all
generally agreed that the most important part of Project Management is
ability to get an overview of the current status of a project at a
glance. The Wikimedia Foundation had a [a list of
requirements](http://www.mediawiki.org/wiki/Tracker/PM_tool) for project
management that more-or-less covered the advanced features that most
organizations would expect from project management.

Yahoo\! pointed out that many people have pre-existing project
management systems that they are already comfortable with, so the most
important thing is for Bugzilla to expose all of the interfaces that
project management systems would need in order to interface with
Bugzilla.

Once we had these requirements sorted out, the question was--how do we
want to implement them?

Well, some things need to be implemented in Bugzilla itself, such as the
ability for project management meetings to do simple mass-triage on a
lot of bugs at once, using a single user interface. (For example, the
ability to edit each field individually on each bug a list of bugs.)

However, most project management features belong in a separate product,
perhaps an extension to Bugzilla, or maybe just a Mediawiki extension
that allows for generating nice reports from Bugzilla. Most likely,
we'll end up with a combination of both--a Bugzilla Extension to add
project management features to Bugzilla, and a Mediawiki extension to
add more reporting and extended project management functionality.

It was universally agreed that the most important thing for us to do is
to improve Bugzilla's WebService interface until it can provide
everything that an external Project Management tool would need, because
even if we develop our own tool, there are still going to be a lot of
people who want to use the tool that they're already most familiar with,
and offering integration points into Bugzilla will let people do that.

Our next meeting will be on [Wednesday, December 8, 2010 at Yahoo\!
Inc.](http://upcoming.yahoo.com/event/6629493/CA/Sunnyvale/Second-Quarterly-Bugzilla-Users-amp-Administrators-Group/Yahoo/?ps=5)
\[alternate link: [Faceook
Event](http://www.facebook.com/event.php?eid=153184864695898)\]. The
focus of the meeting is going to be User Interface. We look forward to
seeing you there\!
