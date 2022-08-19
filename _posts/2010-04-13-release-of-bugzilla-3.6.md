---
date: 2010-04-13
title: Release of Bugzilla 3.6!
categories:
- Releases
---

Today the Bugzilla Project is pround to announce the release of the next major version of Bugzilla: 3.6! [Bugzilla 3.6](/releases/3.6/) has a lot of exciting new features for Bugzilla users and administrators, including migration from other bug-tracking systems, a simple "Browse" interface for browsing open bugs in a system, and some usability improvements resulting from a scientific usability study conducted on Bugzilla.

*   [Download 3.6](/download/#v36)
*   [New Features](/releases/3.6/#v36_feat) in 3.6
*   [Release Notes](/releases/3.6/) for 3.6

**Bugzilla Extensions**

One of the most exciting new features of Bugzilla 3.6 is [Extensions](/docs/3.6/en/html/api/Bugzilla/Extension.html). These are self-contained files that you can "drop in" to a Bugzilla installation to add new features or change Bugzilla's behavior, without modifying _any_ existing code! Anybody can write and distribute their own Extension--Bugzilla 3.6 includes [very detailed documentation](/docs/3.6/en/html/api/Bugzilla/Extension.html) on how to write and distribute Extensions, and even includes a script that will set up the framework of a new Extension for you so that you can get right to coding.

Bugzilla 3.6 ships with one simple Extension that you can enable, and there are also already [a few publicly-available Extensions for Bugzilla 3.6](https://wiki.mozilla.org/Bugzilla:Addons#Bugzilla_Extensions), that any Bugzilla 3.6 installation can install to add new functionality to their system.

Some developers have been using pre-release versions of the new Extensions system in Bugzilla 3.6, and here's what they have to say about it:

*   <q>Bugzilla Extensions really help me to do my customizations, giving me flexibility and reducing the impact in the tool's core. Congratulations Bugzilla team!</q> -Tiago Mello, IBM Linux Technology Center.
*   <q>With the new Extensions system, I can change almost any part of the UI without having to worry about upgrades. Plus, the Extension installation directions are super simple! Making usability tweaks for Bugzilla just got a lot easier.</q> -Guy Pyrzak, UI Designer
*   <q>Writing Bugzilla Extensions is some of the most fun I've had programming in years.</q> -Max Kanat-Alexander, Assistant Project Lead, Bugzilla Project.

We look forward to seeing what you do with the new Extensions system!

**End of Life: Bugzilla 3.0.x**

With the release of Bugzilla 3.6, the Bugzilla 3.0.x series has reached End Of Life. This means that there will be no new releases in the 3.0.x series, even if serious security issues are discovered in 3.0.x. Bugzilla 3.0.11 is the last Bugzilla 3.0.x version that will be released. We strongly recommend that any Bugzilla installation still running Bugzilla 3.0.x promptly upgrade to Bugzilla 3.6.

