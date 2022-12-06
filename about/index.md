---
title: "About"
redirect_from:
- /status/changes
- /status/roadmap
---

## What is Bugzilla?

Bugzilla is a robust, featureful and mature defect-tracking system, or bug-tracking system. Defect-tracking systems allow teams of developers to keep track of outstanding bugs, problems, issues, enhancement and other change requests in their products effectively. Simple defect-tracking capabilities are often built into integrated source code management environments such as GitHub or other web-based or locally-installed equivalents. We find organizations turning to Bugzilla when they outgrow the capabilities of those systems - for example, because they want workflow management, or bug visibility control (security), or custom fields.

Bugzilla is both free as in freedom and free as in price. Most commercial defect-tracking software vendors charge enormous licensing fees. Despite being free, Bugzilla has [many features](/about/features) which are lacking in both its expensive and its free counterparts. Consequently, Bugzilla is used by [hundreds or thousands of organizations](/about/installation-list) across the globe.

Bugzilla is a web-based system but needs to be installed on your server for you to use it. However, installation is not complex.

### Bugzilla is...

*   Under active development
*   Used in high-volume, high-complexity environments by [Mozilla](https://bugzilla.mozilla.org/) and others
*   Supported by [a dedicated team](/developers/)
*   Packed with [features](/about/features) that many expensive solutions lack
*   Trusted by [world leaders in technology](/about/installation-list)
*   Installable on [many operating systems](https://bugzilla.readthedocs.io/en/latest/installing/index.html), including Windows, Mac and Linux

## A Brief History of Bugzilla

When mozilla.org first came online in 1998, one of the first products that was released was Bugzilla, a bug system implemented using freely available open source tools. Bugzilla was originally written in [TCL](http://www.tcl.tk/scripting/) by Terry Weissman for use at mozilla.org to replace the in-house system then in use at Netscape. The initial installation of Bugzilla was deployed to the public on a mozilla.org server on [April 6, 1998](https://www-archive.mozilla.org/news.html#p17).

After a few months of testing and fixing on a public deployment, Bugzilla was finally released as open source via anonymous CVS and available for others to use on [August 26, 1998](https://www-archive.mozilla.org/news.html#p44). At this point. Terry decided to port Bugzilla to [Perl](http://www.perl.org), with the hopes that more people would be able to contribute to it, since Perl seemed to be a more popular language. The completion of the port to Perl was announced on [September 15, 1998](https://www-archive.mozilla.org/news.html#p51), and committed to CVS [later that night](https://github.com/bugzilla/bugzilla/commit/4727e6c09f88e63f02e6c8f359862d0c0942ed36).

After a few days of bake time, this was released as Bugzilla 2.0 on September 19, 1998\. Since then a large number of projects, both commercial and free have adapted it as their primary method of tracking software defects. In April of 2000, Terry handed off control of the Bugzilla project to Tara Hernandez. Under Tara's leadership, some of the regular contributors were coerced into taking more responsibility, and Bugzilla began to truly become a group effort. In July of 2001, facing lots of distraction from her "real job," Tara handed off control to Dave Miller, who is still in charge as of this writing.

Additional release history after version 2.0 can be viewed on the [releases](/releases/) page.

## Where We're Going

Bugzilla has been installed in enough places that Bugzilla's focus has changed from being a mozilla.org centered tool to a more generalized bug tracking system. As such, we need to make installation of Bugzilla easier, have it support more databases and make it easier to optionally enable and disable features. It also needs modularity in terms of features and in the UI so that forking of the code base at individual installations will no longer be a necessity to fit the local engineering culture. We also need to allow customization of other previously hardcoded features, like resolutions and statuses.

## Design Principles

Bugzilla's development should concentrate on being a bug system. While the potential exists in the code to turn Bugzilla into a technical support ticket system, task management tool, or project management tool, we should focus on the task of designing a system to track software defects. While development occurs, we should stick to the following design principles:

*   Bugzilla must run on freely available, open source tools. Bugzilla support should be widened to support commercial databases, tools, and operating systems, but not at the expense of open source ones.
*   Speed and efficiency should be maintained at all costs. One of Bugzilla's major attractions is its lightweight implementation and speed. Minimize calls into the database whenever possible, don't generate speed sucking HTML, don't fetch more data than you need to, etc, etc.
*   ANSI SQL calls and data types must be used in all new queries and tables. Avoid database specific calls and datatypes whenever possible. Existing SQL calls and data types should be converted to ANSI SQL.
*   This should be obvious, but we should be browser agnostic in our HTML and form generation, which means cleaning up the HTML output of Bugzilla, and following all applicable standards.

## Milestone plans

The Milestone plans portion of our roadmap is now maintained on the [Bugzilla Wiki](https://wiki.mozilla.org/Bugzilla:Roadmap).
