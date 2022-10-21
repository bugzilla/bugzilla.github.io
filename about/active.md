---
title: "Active Instances"
intro: "Tracking how many unique IPs accessed bugzilla-update.xml"
addons:
- type: js
  link: https://updates.bugzilla.org/active/active.js
- type: js
  link: /assets/js/Chart.bundle.min.js
- type: js
  link: /assets/js/active.js
---

<div style="max-height:700px">
  <canvas id="chart"></canvas>
</div>
    
This is actually tracking how many unique IPs accessed
bugzilla-update.xml over a 30-day period, each day. So, for example,
if we're talking about August 1, 2010, then the number that is
displayed for that day is how many unique IPs accessed
bugzilla-update.xml between July 1 and August 1.

Not all Bugzilla installations check bugzilla-update.xml. It's only
checked if an administrator views the home page on their Bugzilla 
installation, and only Bugzilla 3.0 or above do this. Also, "unique IPs"
does not directly translate to unique installations.

This should still give us a fairly good idea of how our installation
count changes over time, though. It's more useful to look at the
trends of the graph than the actual exact numbers.

The real number of active installations at any given time is 
likely **higher** than the numbers here. Most servers don't
change their external IPs, so we wouldn't be getting too many
Bugzilla installations whose IPs change in a 30-day period. On
the other hand, there are probably multiple installations behind
NAT at various organizations, many people are running ancient
installations before 3.0, lots of people probably turn off
the update checker, and there are a lot of Bugzilla installations
that operate in environments where they can't access the remote
bugzilla-update.xml.

NOTE: We lost active installation data from 9. May to 8. Sep 2012 (4
months) due to a bug in the generation script after moving the system
to a new server. Sorry!
{:.alert.alert-primary}
