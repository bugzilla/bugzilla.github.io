---
title: Landfill.bugzilla.org Disclosure
date: 2014-08-27
author: ["mcote"]
categories:
- Updates
- Meta
- Security
---
**UPDATE**: We have reset all passwords on all Landfill test Bugzilla
systems. All users will be required to set a new password the next time
they access the test Bugzilla systems.

One of our developers discovered that, starting on about May 4th, 2014,
for a period of around 3 months, during the migration of our testing
server for test builds of the Bugzilla software, database dump files
containing email addresses and encrypted passwords of roughly 97,000
users of the test build were posted on a publicly accessible server.  As
soon as we became aware, the database dump files were removed from the
server immediately, and we’ve modified the testing process to not
require database dumps.

Generally, developers who use our test builds have told us they
understand that these builds are insecure and may break, so they do not
use passwords they would reuse elsewhere.  However, because it is
possible that some users could have reused their passwords on other
websites or authentication systems, we’ve sent notices to the users who
were affected by this disclosure and recommended that they change any
similar passwords they may be using. It’s important to note that, unless
users reused the password they used on landfill.bugzilla.org, this does
not affect bugzilla.mozilla.org email addresses or passwords.

We are deeply sorry for any inconvenience or concern this incident may
cause you.

Thanks,

Mark Côté

Assistant Project Lead, Bugzilla
