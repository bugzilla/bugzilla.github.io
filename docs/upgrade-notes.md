---
title: "Notes for Upgraders"
---

This is a consolidated list of release note items relevant to those
upgrading Bugzilla. If you are upgrading from version X.X to version
Y.Y, you need to read all the notes for every version between them, plus
those for version Y.Y.

Each new version of Bugzilla has many enhancements and improvements.
Issues are listed here only if they might lead to an admin needing to
pay special attention and possibly take manual steps to update their
installation, its extensions, or code which interacts with their
Bugzilla. So the focus is on backwardly-incompatible changes. This is
not a complete list of changes.

If, when upgrading, you hit an issue which is not documented here and
which was not caused by your own changes or customizations, please file
a bug to get it added to this document.

## 4.4

### Apache Configuration Change

For improved security, Bugzilla now prevents directory browsing by
default. In order to do that, the root
`bugzilla/.htaccess` file now contains the
`Options -Indexes` directive. By default, this
directive is not allowed in `.htaccess` and so
you must configure Apache to allow it. To do that, add
`Options` to the
`AllowOverride` directive in
`httpd.conf`. This means you should now have
something like this:

`AllowOverride Limit FileInfo Indexes Options`

Check the
[documentation](https://www.bugzilla.org/docs/4.4/en/html/configuration.html#http-apache)
for more information about how to configure Apache.

### Code Changes Which May Affect Customizations and Extensions

  - The *usebugaliases* parameter has been removed. Aliases are now
    always available.
  - It is now illegal to have a product with no components and no
    versions. Trying to delete the last component or version of a
    product is now rejected.
  - Trying to set the component, target milestone or version of a bug to
    a disabled value is no longer accepted. The change will be rejected.
  - Quips can no longer exceed 512 characters. Existing quips longer
    than that are automatically truncated when upgrading.
  - The static `bugzilla.dtd` file has been
    replaced by a dynamic one to take custom fields into account. The
    old *\<urlbase\>/bugzilla.dtd* URL is now
    *\<urlbase\>/page.cgi?id=bugzilla.dtd*.
  - There is a new extension located at
    `extensions/MoreBugUrl/` which permits to add
    new classes of URLs in the See Also field. It uses the
    `bug\_url\_sub\_classes` hook mentioned
    above.
  - In the RDF output of `config.cgi`, URIs used
    to identify versions and target milestones have been changed to be
    unique across products.
  - The RDF output of `config.cgi` now also
    returns data about classifications.
  - Rows in the `dependencies`,
    `flaginclusions` and
    `flagexclusions` DB tables are now enforced
    to be unique.
  - The `bugs\_activity` and
    `profiles\_activity` DB tables now have an
    auto-incremented primary key named `id`.
  - A custom `Bugzilla.pm` module has been added
    into `contrib/` to help packagers to package
    Bugzilla in their Linux distros.

### Notable WebService Changes

  - The `User.login` WebService method now also
    returns a `token` argument containing a login
    token which you can use in subsequent calls to authenticate. For
    security reasons, this method no longer generates login cookies.
    ([Bug 893195](https://bugzilla.mozilla.org/show_bug.cgi?id=893195))
  - The `User.get` WebService method now
    correctly takes the `maxusermatches`
    parameter into account when the `match`
    argument is passed. Previously, it was returning all matching
    accounts. To further limit the number of accounts returned by
    `User.get`, you can now pass the
    `limit` argument.
    ([Bug 962060](https://bugzilla.mozilla.org/show_bug.cgi?id=962060))
  - `Bug.add\_attachment` now only returns the ID
    of the newly created attachments instead of all the attachment data.
  - `Bug.comments` now also returns
    `creation\_time` which is exactly the same as
    `time`, but is provided for consistency with
    `Bug.get` and
    `Bug.attachments`. The
    `time` field may be deprecated and removed in
    a future release, so you should use
    `creation\_time` instead.
  - Field names returned in the `field\_name`
    field of the `Bug.history` method have
    changed to be consistent with other methods.
  - The `Bug.search` method was returning all
    visible bugs when called with no arguments, ignoring the
    `max\_search\_results` and
    `search\_allow\_no\_criteria` parameters.
    This has been fixed.

## 4.2

### Code Changes Which May Affect Customizations and Extensions

  - The `email/newchangedmail.txt.tmpl` template
    is now fully templatized, meaning that the diff table displaying
    changes in bug fields is now generated in the template itself. This
    means bugmails are now fully localizable.
  - The bugmail\_recipients hook has been modified to pass
    `diffs` with changes made to the bug as well
    as `users` including recipients of the email
    notification.
  - YUI has been upgraded to 2.9.0.
  - Due to the major code refactor of
    `Bugzilla/Search.pm`, any customization made
    against this file will probably need to be rewritten.
  - The Bugzilla-specific `url\_quote` filter
    used in templates has been removed and replaced by the
    `uri` filter from Template::Toolkit as they
    are now similar.
  - `long\_list.cgi`,
    `showattachment.cgi` and
    `xml.cgi` have been removed from the
    codebase. As [announced](#v40_code_changes) in the release notes of
    Bugzilla 4.0, these scripts were deprecated since Bugzilla 2.19.
  - `sidebar.cgi` has been removed, because
    Gecko-based browsers no longer support remote XUL, and its
    popularity is very low.
  - `contrib/yp\_nomail.sh` has been removed.
    This script is no longer useful since Bugzilla 3.0.
  - `contrib/bugzilla\_ldapsync.rb` has been
    removed. This script didn't work for a long time.

### Notable WebService Changes

  - In `Bug.fields`, the
    `sortkey` attribute used in
    `values` has been renamed to
    `sort\_key`.
  - In `Bug.attachments` and
    `Bug.add\_attachment`, the
    `is\_url` attribute no longer exists.

## 4.0

### Apache Configuration Changes

#### mod\_cgi

If you run Bugzilla under mod\_cgi (this is the most common
configuration, involving a \<Directory\> block in your Apache config
file), you will need to update the configuration of Apache for Bugzilla.
In particular, this line in the Bugzilla
`\<Directory\>` block:

> `AllowOverride Limit`

needs to become:

> `AllowOverride Limit FileInfo Indexes`

For full details on how to configure Apache for Bugzilla, see the
[Configuration](https://www.bugzilla.org/docs/4.4/en/html/configuration.html#http-apache)
section of the Bugzilla Guide.

#### mod\_perl

If your Bugzilla runs under mod\_perl, the required Apache configuration
is now simpler. The line that used to look like:

> `PerlSwitches -w -T -I/var/www/html/bugzilla
> -I/var/www/html/bugzilla/lib`

Now should be only:

> `PerlSwitches -w -T`

The `PerlConfigRequire` line should stay the same, however.

### New .htaccess file

In previous versions of Bugzilla, there was a file in Bugzilla's root
directory called ".htaccess" that was generated by
`checksetup.pl`. This file is now shipped with
Bugzilla instead of being generated during installation.

If you update via CVS, bzr or git, you will get a message that your
existing .htaccess file conflicts with the new one. You must **remove
your existing .htaccess file** and use the new one instead. Continuing
to use your old .htaccess file will cause certain new features of
Bugzilla to not work properly, and may also lead to security issues for
your system in the future.

### Code Changes Which May Affect Customizations and Extensions

  - In Extensions, if you want to serve files to the user via the web,
    they must now be in a `web/` subdirectory of
    your Extension. (For example,
    `extensions/Foo/web/`).
    `checksetup.pl` sets permissions on
    extensions much more strictly now, and files in other locations
    (such as your base `extensions/Foo/`
    directory) will no longer be available to Bugzilla users via the web
    under certain configurations.
  - Previous versions of Bugzilla used to allow putting a single file
    into the "skins" directory and having that be an entire skin. That
    is no longer allowed, and on upgrade,
    `checksetup.pl` will convert any such skins
    into a directory with a single `global.css`
    file in them.
  - When updating bugs, you should now use `$bug->set_all` instead of
    using the individual `set\_` methods. In
    particular, `set\_all` is now the *only* way
    to set the product of a bug. See
    `process\_bug.cgi` for an example of how
    `set\_all` should be used.
  - You should not insert \<script\> tags and \<link\> CSS tags into
    HTML anymore, in Extensions or in your customizations. Instead, you
    should push new values into the `style\_urls`
    or `javascript\_urls` parameters. If you have
    to insert manual tags for some reason, be sure to call "FILTER
    mtime" on the URL. (Search for other uses of "FILTER mtime" in the
    templates to see how it is used.)
  - When calling `Bugzilla::BugMail::Send`, the
    "changer" argument must now be a
    `Bugzilla::User` object, not just a login
    name. The "owner" and "qacontact" arguments are still just login
    names.
  - When creating a new subclass of Bugzilla::Object, you should no
    longer use `UPDATE\_VALIDATORS`. Also, in
    most cases you will no longer need to override
    `run\_create\_validators`. Instead, there is
    a new constant called
    [VALIDATOR\_DEPENDENCIES](https://www.bugzilla.org/docs/4.4/en/html/api/Bugzilla/Object.html#VALIDATOR_DEPENDENCIES),
    that specifies that certain fields have to be validated before other
    fields. Then, all validators receive each already-validated value in
    a hash as their fourth argument, so each validator can know the
    other values that were passed in, while an object is being created.
    For an example of how to use
    `VALIDATOR\_DEPENDENCIES`, see
    `Bugzilla/Field.pm`.
  - In previous versions of Bugzilla, you had to call
    `Bugzilla->template_inner("")` after any time that you called
    `template\_inner` for a specific language. It
    is no longer necessary to do this second
    `template\_inner` call.
  - `post\_bug.cgi` and
    `Bugzilla::Bug-\>create` now take the *names*
    of groups instead of group ids.
  - Bugzilla::Bugmail now uses Bugzilla::Bug objects internally instead
    of a lot of direct SQL.
  - For sending changes about bugs, there is now a method called
    `send\_changes` that you can call on
    Bugzilla::Bug objects. For an example of its use, see
    `process\_bug.cgi`.
  - The `Bugzilla::Search` class has been
    refactored, and should now be easier to customize.
  - The `Bugzilla::Util::lsearch` function is
    gone. Use `firstidx` from
    `List::MoreUtils`, instead.
  - Bugzilla now includes YUI 2.8.2.
  - `long\_list.cgi`,
    `showattachment.cgi` and
    `xml.cgi` are deprecated scripts which are no
    longer actively used since Bugzilla 2.19. These scripts will be
    removed in Bugzilla 4.2.
  - The system for moving bugs between installations has been moved into
    an extension called `OldBugMove`. This system
    was used by very few Bugzilla installations--if you aren't certain
    whether or not you are using it, you're not using it. To enable the
    system, you have to remove the file
    `extensions/OldBugMove/disabled` and then run
    `checksetup.pl`. In a future version of
    Bugzilla, this extension may be moved outside of the core Bugzilla
    code, so if you are interested in maintaining it, please let us
    know.

### Notable WebService Changes

  - The `Bug.create` WebService method now throws
    an error if you pass a group name which doesn't exist. In Bugzilla
    4.0 and 4.0.1, this group name was silently ignored, leaving your
    bug unsecure if no other group applied.
    ([Bug 653341](https://bugzilla.mozilla.org/show_bug.cgi?id=653341))
  - WebServices methods will return undefined bug fields as undefined
    instead of as an empty string. This change is consistent with how
    Bugzilla 4.2 behaves.
    ([Bug 657561](https://bugzilla.mozilla.org/show_bug.cgi?id=657561))
  - The `Bug.get` function now returns all of a
    bug's information other than comments and attachments.
  - `Bug.get` no longer returns the
    `internals` hash.
  - The following functions now support the
    `include\_fields` and
    `exclude\_fields` arguments:
    `Bug.get`,
    `Bug.search`, and
    `Bug.attachments`. Also, server-side
    performance of the WebService is actually increased when using these
    arguments, now, as Bugzilla will no longer get data from the
    database for fields you haven't asked for.
  - You can no longer search using the `votes`
    argument in `Bug.search`.
  - `Bug.attachments` now returns the
    attachment's description using the name "summary" instead of the
    name "description", to be consistent with the fact that bug
    summaries are called "summary". The value is still *also* returned
    as "description", for backwards compatibility, but this backwards
    compatibility will go away in Bugzilla 5.0.
  - In the return values of various `Bug`
    functions, the author of comments, bugs, and attachments is now
    called "creator", instead of sometimes being called "reporter",
    "author", or "attacher". The old names are retained for
    backwards-compatibility, and will stay around until Bugzilla 5.0.

## 3.6

### DB Consistency Check

When upgrading to 3.6, `checksetup.pl` will
create foreign keys for many columns in the database. Before doing this,
it will check the database for consistency. If there are an unresolvable
consistency problems, it will tell you what table and column in the
database contain the bad values, and which values are bad. If you don't
know what else to do, you can always delete the database records which
contain the bad values by logging in to your database and running the
following command:

`DELETE FROM table WHERE column IN (1, 2, 3, 4)`

Just replace "table" and "column" with the name of the table and column
that `checksetup.pl` mentions, and "1, 2, 3, 4"
with the invalid values that `checksetup.pl`
prints out.

Remember that you should always back up your database before doing an
upgrade.

### Code Changes Which May Affect Customizations and Extensions

  - There is no longer a SendBugMail method in the templates, and
    bugmail is no longer sent by processing a template. Instead, it is
    sent by using `Bugzilla::BugMail::Send`.
  - Comments are now represented as a
    [Bugzilla::Comment](https://www.bugzilla.org/docs/3.6/en/html/api/Bugzilla/Comment.html)
    object instead of just being hashes.
  - In previous versions of Bugzilla, the template for displaying a bug
    required a lot of extra variables that are now global template
    variables instead.
  - You can now check if optional modules are installed by using
    `Bugzilla-\>feature` in Perl code or
    `feature\_enabled` in template code.
  - All of the various template header information required to display
    the bug form is now in one template,
    `template/en/default/bug/show-header.html.tmpl`.
  - You should now use `display\_value` instead
    of `get\_status` or
    `get\_resolution` in templates.
    `display\_value` should be used anywhere that
    a \<select\>-type field has its values displayed.

### Notable WebService Changes

  - The WebService now returns all dates and times in the UTC timezone.
    `Bugzilla.time` now acts as though the
    Bugzilla server were in the UTC timezone, always. If you want to
    write clients that are compatible across all Bugzilla versions,
    check the timezone from `Bugzilla.timezone`
    or `Bugzilla.time`, and always input times in
    that timezone and expect times to be returned in that format.
  - In the `Bug.add\_comment` method, the
    "private" parameter has been renamed to "is\_private" (for
    consistency with other methods). You can still use "private",
    though, for backwards-compatibility.
  - The WebService now has Perl's "taint mode" turned on. This means
    that it validates all data passed in before sending it to the
    database. Also, all parameter names are validated, and if you pass
    in a parameter whose name contains anything other than letters,
    numbers, or underscores, that parameter will be ignored. Mostly this
    just affects customizers--Bugzilla's WebService is not functionally
    affected by these changes.
  - In previous versions of Bugzilla, error messages were sent
    word-wrapped to the client, from the WebService. Error messages are
    now sent as one unbroken line.

## 3.4

### DB Consistency Check

When upgrading to 3.4, `checksetup.pl` will
create foreign keys for many columns in the database. Before doing this,
it will check the database for consistency. If there are an unresolvable
consistency problems, it will tell you what table and column in the
database contain the bad values, and which values are bad. If you don't
know what else to do, you can always delete the database records which
contain the bad values by logging in to your database and running the
following command:

`DELETE FROM table WHERE column IN (1, 2, 3, 4)`

Just replace "table" and "column" with the name of the table and column
that `checksetup.pl` mentions, and "1, 2, 3, 4"
with the invalid values that `checksetup.pl`
prints out.

Remember that you should always back up your database before doing an
upgrade.

### Code Changes Which May Affect Customizations and Extensions

  - `checksetup.pl` now re-writes the
    `localconfig` file every time it runs,
    keeping the current values set (if there are any), but moving any
    unexpected variables into a file called
    `localconfig.old`. If you want to continue
    having custom varibles in `localconfig`, you
    will have to add them to the `LOCALCONFIG_VARS` constant in
    `Bugzilla::Install::Localconfig`.
  - `Bugzilla::Object-\>update()` now returns
    something different in list context than it does in scalar context.
  - `Bugzilla::Object-\>check()` now can take
    object ids in addition to names. Just pass in `{ id => $some_value
    }`.
  - Instead of being defined in `buglist.cgi`,
    columns for search results are now defined in a subroutine called
    `COLUMNS` in `Bugzilla::Search`. The data now
    mostly comes from the `fielddefs` table in
    the database. Search.pm now takes a list of column names from
    fielddefs for its `fields` argument instead
    of literal SQL columns.
  - `Bugzilla::Field-\>legal\_values` now returns
    an array of
    [Bugzilla::Field::Choice](https://www.bugzilla.org/docs/3.6/en/html/api/Bugzilla/Field/Choice.html)
    objects instead of an array of strings. Bugzilla::Field::Choice will
    be used in more places, in the future.
  - We now use `Bugzilla::Bug-\>check()` instead
    of `ValidateBugId`.
  - The `groups` and
    `bless\_groups` methods in
    `Bugzilla::User` now return an arrayref of
    `Bugzilla::Group` objects instead of a
    hashref with group ids and group names.
  - Standard Bugzilla drop-down fields now have their type set to
    `FIELD\_TYPE\_SINGLE\_SELECT` in the
    fielddefs table.
  - `Bugzilla-\>usage\_mode` now defaults to
    `USAGE\_MODE\_CMDLINE` if we are not running
    inside a web server.
  - We no longer delete environment variables like
    `$ENV{PATH}` automatically unless we're
    actually running in taint mode.
  - We are now using YUI 2.6.0.
  - In [the RDF format of config.cgi](config.cgi?ctype=rdf), the
    "resource" attribute for flags now contains "flag.cgi" instead of
    "flags.cgi".

#### Notable WebService Changes

  - `Bugzilla.timezone` is now deprecated.
  - Many WebService function parameters now take individual values in
    addition to arrays.
  - The WebService now validates input types--it makes sure that dates
    are in the right format, that ints are actually ints, etc. It will
    throw an error if you send it invalid data. It also accepts empty
    ints, doubles, and dateTimes, and translates them to
    `undef`.

## 3.2

  - If you upgrade by CVS, the `extensions` and
    `skins/contrib` directories are now in CVS
    instead of being created by `checksetup.pl`
    If you do a `cvs update` from 3.0, you will
    be told that your directories are "in the way" and you should delete
    (or move) them and then do `cvs update`
    again. Also, the `docs` directory has been
    restructured and after you `cvs update` you
    can delete the `docs/html`,
    `docs/pdf`,
    `docs/txt`, and
    `docs/xml` directories.
  - If you are using MySQL, you should know that Bugzilla now uses
    InnoDB for all tables. `checksetup.pl` will
    convert your tables automatically, but if you have InnoDB disabled,
    the upgrade will not be able to complete (and
    `checksetup.pl` will tell you so).

### Code Changes Which May Affect Customizations

  - You should now be using `get_status('NEW')` instead of
    `status_descs.NEW` in templates.

## 3.0

### Code Changes Which May Affect Customizations

  - The old `SendSQL` function and all of its
    companions are **gone**. Instead, we now use DBI for all database
    interaction. For more information about how to use
    [DBI](http://search.cpan.org/perldoc?DBI) with Bugzilla, see the
    [Developer's Guide Section About
    DBI](https://www.bugzilla.org/contributing/developer.html#sql-sendreceive).
  - Instead of `UserInGroup()`, all of Bugzilla
    now uses `Bugzilla-\>user-\>in\_group`
  - Parameters are accessed through
    `Bugzilla-\>params` instead of using the
    `Param()` function, now.
  - The variables from the `localconfig` file are
    accessed through the `Bugzilla->localconfig` hash instead of through
    `Bugzilla::Config`.
  - `Bugzilla::BugMail::MessageToMTA()` has moved
    into its own module, along with other mail-handling code, called
    `Bugzilla::Mailer`
  - The `CheckCanChangeField()` subroutine in
    `process\_bug.cgi` has been moved to
    `Bugzilla::Bug`, and is now a method of a bug
    object.
  - The code that used to be in the
    `global/banner.html.tmpl` template is now in
    `global/header.html.tmpl`. The banner still
    exists, but the file is empty.

## Older Releases

If you are upgrading from a release even older than 2.22 (which was the
release before 3.0), you will need to do the release note archaeology
yourself. Start [here](../releases/2.22.7/).
