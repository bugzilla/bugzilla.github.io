---
title: "Features"
intro: "Check out what Bugzilla can do for you"
---

* Table of Contents
{:toc}

## For Users

### Advanced Search Capabilities

Bugzilla offers two forms of search:

*   A basic Google-like bug search that is simple for new users and searches the full text of a bug.
*   A very advanced search system where you can create any search you want, including time-based searches (such as "show me bugs where the priority has changed in the last 3 days") and other very-specific queries.

### Email Notifications Controlled By User Preferences

You can get an email about any change made in Bugzilla, and which notifications you get on which bugs is fully controlled by your personal user preferences.

### Bug Lists in Multiple Formats (Atom, iCal, etc.)

When you search for bugs, you can get the results in many different formats than just the basic HTML layout. Bug lists are available in Atom, if you want to subscribe to a search like it was a feed. They're also available in iCalendar format, so if you're using the time-tracking features of Bugzilla you can see where your bugs fit into your calendar!

There are even more formats available, such as a long, printable report format that contains all the details of every bug, a CSV format for importing into spreadsheets, and various XML formats.

### Scheduled Reports (Daily, Weekly, Hourly, etc.) by Email

Bugzilla has a system that will send you, another user, or a group that you specify the results of a particular search on a schedule that you specify! It can be at any time of day, and it can happen as often as every fifteen minutes.

Access to this system is controlled by Bugzilla's groups system, so you can limit who has access to it, and separately, who is able to send reports to users other than themselves.

### Reports and Charts

Bugzilla has a very advanced reporting systems. If you want to know how your bug database looks right now, you can create a table using any two fields as the X and Y axis, and using any search criteria to limit the bugs you want information on.

For example, you could pick Product as the X axis, and Status as the Y axis, and then you would see [a report of how many bugs were in each Status, in each Product](https://bugzilla-dev.allizom.org/report.cgi?x_axis_field=product&y_axis_field=bug_status&z_axis_field=&query_format=report-table&format=table&action=wrap).

You can also view that same table as a [line graph](https://bugzilla-dev.allizom.org/report.cgi?x_axis_field=product&y_axis_field=bug_status&z_axis_field=&width=600&height=350&action=wrap&format=line), [bar graph](https://bugzilla-dev.allizom.org/report.cgi?x_axis_field=product&y_axis_field=bug_status&z_axis_field=&width=600&height=350&action=wrap&format=bar), or [pie chart](https://bugzilla-dev.allizom.org/report.cgi?z_axis_field=product&format=pie&x_axis_field=bug_status&query_format=report-graph&action=wrap).

You can also specify a "Z axis" to generate multiple tables or graphs.

You can even export these reports as CSV so that you can work with them in a spreadsheet.

Finally, to see how your Bugzilla installation has changed over time, Bugzilla also supports a charting system, which can create [graphs that track changes in the system over time](https://bugzilla-dev.allizom.org/reports.cgi?product=Firefox&datasets=NEW&datasets=RESOLVED).

### Automatic Duplicate Bug Detection

When filing a bug in Bugzilla, as soon as you start typing a short summary for it, Bugzilla will automatically look for similar bugs in the system and allow the user to add themselves to the CC list of one of those bugs instead of filing a new one.

### File/Modify Bugs By Email

In addition to the web interface, you can send Bugzilla an email that will create a new bug, or will modify an existing bug. You can also very easily attach files to bugs this way.

### Time Tracking

You can estimate how many hours a bug will take to fix, and then keep track of the hours you spend working on it. You can also set a deadline that a bug must be complete by.

For installations that don't need time-tracking, you can turn off these fields. You can also control who is able to see them. (Just modify the <kbd>timetrackinggroup</kbd> parameter!)

### Request System

The Request System is a method of asking other users to do something with a particular bug or attachment. That other user can then grant (say "yes" to) your request, or deny (say "no" to) your request, and Bugzilla keeps track of their answer. You can use it for various purposes; whether you need to ask for code review, request information from a specific user, or get a sign-off from a manager, the system is extremely flexible and can do what you need.

### Private Attachments and Comments

If you are in the "insider group," you can mark certain attachments and comments as private, and then they will be invisible to users who are not in the insider group.

Users will know that a comment was hidden (because the comment numbering will look something like "1, 2, 3, 5" to them), but they will not be able to access its contents.

### Automatic Username Completion or Drop-Down User Lists

For small Bugzilla installations, Bugzilla supports showing all users in a drop-down list to select from, when reassigning bugs to another user, adding a user to the CC list, or many other areas.

Administrators can control who appears in these drop-down lists for each user with "user visibility" controls, to prevent certain users from knowing about the existence of other users.

For larger installations, Bugzilla supports "autocomplete" when typing a username for the assignee, CC list, or other field that takes a username. After you type at least three characters into one of these fields, Bugzilla will suggest a list of users who have those letters in their username or their real name.

### Patch Viewer

Patch Viewer gives you a nice, colorful view of any patch attached to a bug. It also integrates with LXR, CVS, and Bonsai to provide you even more information about a patch.

In particular, it makes code review much easier.

### "Watch" Other Users

In Bugzilla, you can say that you want to "watch" another user. Then, you will get every email that user gets from Bugzilla, as though that user was you. This is particularly useful when one developer goes on vacation and another needs to handle that developer's bugs while the other developer is on vacation.

This doesn't allow you to bypass security--if you don't have access to a bug, you won't get notifications about it, no matter what.

### Move Bugs Between Installations

Bugzilla supports the ability to move a bug from one Bugzilla installation to another. This even works across versions--you can move a bug from a Bugzilla 2.16 installation to a Bugzilla 3.0 installation without having to do any manual work.

### Save and Share Searches

Once you have performed a search, you can "save" it so that it appears in the footer of every page and all you have to do to run it again is click the link.

Once you have saved a search, if you have the right permissions you can also share that search with any group that you belong to in Bugzilla. Then they will have the option of displaying your search in their footer along with their searches!

## For Administrators

### Excellent Security

The Bugzilla Project takes security seriously. Bugzilla runs under Perl's "taint" mode to prevent SQL Injection, and has a very careful system in place to prevent Cross-Site Scripting. Bugzilla's history of patching security vulnerabilities is excellent, and the system is designed at every stage with security in mind.

Bugzilla is also very careful about information leaks--if you use Bugzilla's group system to hide something, it is _absolutely hidden_. Nobody will be able to get any information about it whatsoever.

Also, email addresses of users are not available to logged out users, to make life harder to spammers. And if someone tries to abuse your account by guessing your password, this account will be automatically locked after a few attempts to prevent brute force.

### Extension Mechanism for Highly Customizable Installations

All of Bugzilla's User Interface and every email that Bugzilla sends are generated from "templates", files that contain mostly just HTML, CSS, and JavaScript. Depending on how far you want to customize your installation, you don't have to know Perl to customize Bugzilla, you just have to edit the templates!

For more complex tasks, Bugzilla has a very advanced Extensions system that allows you drop files into any Bugzilla installation and change its behavior in various ways. There is a [list of available extensions](https://wiki.mozilla.org/Bugzilla:Addons#Bugzilla_Extensions) that you can install on your Bugzilla, and also very extensive [documentation on how to write your own Extension](https://www.bugzilla.org/docs/tip/en/html/api/Bugzilla/Extension.html). Extensions are a great way to write customizations for Bugzilla that you can maintain with few changes even across major releases of Bugzilla!

### Custom Fields

Bugzilla supports adding custom fields to your bug database, to capture and search data that is unique to your organization! Many different types of custom fields are supported, and you can even display them based on the value of another field, to only use them when they are relevant.

### Custom Workflow

Bugzilla comes with a default list of bug statuses and resolutions, as well as a default workflow. But they can all be edited to better match your needs. This means bug statuses and resolutions can be created or deleted very easily, and the workflow is fully customizable.

### Full Unicode Support

All of Bugzilla fully supports Unicode, including multi-byte languages such as Japanese and Chinese. You can enter data into Bugzilla in Unicode, and you can search and sort all data correctly in Unicode.

### Localization

Bugzilla administrators can configure which languages are supported by their installations and automatically serve correct, localized content to users based on the HTTP 'Accept-Language' header sent from users' browsers.

There are currently localized templates available for:

*   Belarusian
*   Bulgarian
*   Chinese
*   Czech
*   French
*   German
*   Japanese
*   Polish
*   Portuguese (Brazil)
*   Spanish (Spain or Mexico)
*   Russian

These localized template packs are third-party contributions, may only be available for specific versions, and may not be supported in the future. (See the [Localizations Section](https://www.bugzilla.org/download/#localizations) of the Download page.)

It is also possible to translate Bugzilla yourself, by just copying and translating the existing templates. See the [Localizer's Guide](https://www.bugzilla.org/docs/localizer.html) for more information!

### mod_perl Support for Excellent Performance

Bugzilla can be run under Apache's [mod_perl](http://perl.apache.org/), which greatly speeds up individual page loads. Bugzilla pages often load in under a second when running under mod_perl.

Bugzilla also runs in a non-mod_perl environment, so you can run it under Apache's normal mod_cgi, IIS, or the web server of your choice!

### Webservices (XML-RPC and JSON-RPC) Interfaces

Bugzilla can be accessed and modified by an XML-RPC or a JSON-RPC [Webservices interface](https://wiki.mozilla.org/Bugzilla:WebService). This makes it possible to write external tools that interact with Bugzilla easily. The Bugzilla Project works to keep the Webservice interface of Bugzilla stable across releases, so an application written against one version of Bugzilla's XML-RPC or JSON-RPC interface should continue to work against future Bugzilla versions.

### Control Bug Visibility/Editing with Groups

Bugzilla allows you to define which groups of users can edit or see which bugs. These controls are very advanced, and were designed to support small-group needs to full enterprise group systems.

### Impersonate Users

Bugzilla administrators can impersonate any user in the system (except other administrators). This helps for troubleshooting, and also is useful at other times.

### Multiple Authentication Methods

Bugzilla supports authenticating against its built-in user database or against an LDAP server.

It also supports fall-through authentication, so that it can use any authentication method supported by Apache (or your web server).

You can also "stack" these authentication methods, so that, for example, it falls back to the Bugzilla database if the user isn't found in LDAP.

### Support for Multiple Database Engines

Bugzilla can run on MySQL, PostgreSQL and Oracle. MS-SQL is on the road and should be supported in the near future. It's also possible to write a driver for the database of your choice.

### Sanity Check

Bugzilla's Sanity Check scans your database for inconsistencies. It reports errors and either offers to fix them automatically or gives you links to help you fix the problem.
