---
title: "Developer's Guide" 
intro: "Document describing coding standards of Bugzilla"
---

* Table of Contents
{:toc}

## Introduction

This document describes the code standards for Bugzilla, and gives tips
for Bugzilla developers.

Code is most likely to be integrated into Bugzilla if it follows these
guidelines. Sometimes reviewers will allow you to bend the rules, but
there must be a very good reason for doing so.

It is always better to contribute **some** code rather than **no** code.
If your code isn't perfect, a reviewer will tell you what you need to
change in order for us to accept it. Usually, the reviewer will just
tell you things that are already in this document.

Existing Bugzilla code does not necessarily conform to these guidelines,
but we are working towards them. If you're only changing 1 or 2 lines,
there's no need to fix up the entire file to make the file conform to
these guidelines.

## General Guidelines

We have a certain set of "basic principles" that this entire Developer's
Guide is based on:

  - These guidelines exist because they **reduce bugs** and **make it
    easier to change things in the future**.
  - Making it easier to change things in the future is important,
    because an important law of code is: **All Code Will Change**.
  - Code should be **as simple as possible**. When you write code, one
    of your primary goals should be: **make it easy for other
    programmers to use and read your code**.
  - **Readable** code is more important than **clever** code.
  - If you're trying to be clever instead of trying to be readable, then
    maybe you're trying to make things "faster?" If so, just remember:
    **don't solve a problem before you *know it exists***. If you don't
    *know* (by actual, detailed tests) that your code is slow, don't
    worry about making it "faster." This isn't just limited to
    optimization--many programmers are constantly solving problems that
    nobody has ever experienced. Don't do that.
  - **You cannot introduce new bugs unless you change code.** That
    should be obvious. :-) This means:
      - **The more code you change, the more bugs you *will* create.**
        There are no "perfect" programmers. Everybody makes a few
        mistakes now and then.
      - **The number of bugs introduced by a patch is proportional to
        the size of the patch.**
      - Thus, **patches should be as small as possible**, and should
        change only what they need to change.
  - An easy way to check if your code is readable, is to ask yourself,
    "Will another programmer understand this line *instantly* when they
    look at it?" If not, that line either needs to be re-written or
    needs a comment.

## Bug Fixing

When you fix a bug, ask yourself:

  - Where else in the codebase might this bug occur? Search for other
    places, and either fix these or file them as new bug reports.
  - How could you, or the Bugzilla team in general, prevent this problem
    in future? Consider reusable subroutines that could be introduced,
    rearchitecture that could be done, or tests that could be added to
    the testing suite. File new bug reports on these.
  - Could this have regressed anything?

## Test Suite

Nothing will get checked into Bugzilla that doesn't pass the test suite.
The test suite is automatically executed on each commit by the [Travis
CI](https://travis-ci.org/bugzilla/bugzilla) system to warn us of bad
code. It is using Bugzilla's [github
mirror](https://github.com/bugzilla/bugzilla). Anything that fails to
pass the testing suite will be backed out immediately.

The test suite continues to expand to detect more problems as the
Bugzilla architecture matures and our understanding of potential
problems improves. If you add new code, consider adding a new test.

Currently, it primarily diagnoses problems in code similar to a “lint”
like tool. However, it does do some tests on the small but growing “back
end” of Bugzilla.

In order to run the tests, you must have the
`Test::More` and
`Test::Harness` Perl modules installed.
You can then `./runtests.pl` or
`./runtests.pl --verbose` from your
Bugzilla main directory.

## All Files

  - The testing suite will check files have no tab characters. Tabs are
    not reliable for positioning because different editors interpret
    them differently.
  - The testing suite will check files for some common or past
    misspellings.
  - File names should be legal across multiple platforms. `\` `/` `:`
    `*` `?` `"` `<` `>` and `|` are all illegal characters for filenames
    on various platforms. Also, file names should not have spaces in
    them as they can cause confusion in CVS and other mozilla.org
    utilities. You may assume long filename support is present.

## Perl Code

### General

  - The testing suite will check all Perl files have no errors. This is
    done by using the `perl -c` command to
    compile the files.

  - The testing suite will check that all Perl files have the
    appropriate shebang switches (-w plus -T where required), and that
    `use strict` is present.

  - **Variable Names** - Do not use global variables (like
    `$::variable`). They make the code harder to use and prone to errors
    as they can be altered at unexpected places. Use local variables
    instead. Their name must be understandable and descriptive. For
    example, `$product` could be used as a variable referencing a
    product.

  - **Variables In Regular Expressions** - One common bug is mis-using
    variables inside of regular expressions. When the variable contains
    regular expression operators such as `?`, `*` and `+`, bugs occur.
    This typically occurs with `grep` or `=~`. You should use:
    
    `grep ($_ eq $value, @array);`
    
    instead of this:
    
    `grep (/$value/, @array);`
    
    If you need to use a variable inside of an expression, be sure to
    quote it properly (using `\Q..\E`), like:
    
    `grep (/blah\Q$value\Eblah/, @array);`
    
    If your variable is actually *supposed* to contain a regular
    expression, then you don't have to escape it. In this case, it is a
    good idea to include "regexp" in the *name of the variable*, for
    readability purposes. For example, `$search_regexp`.

  - CGIs should call `Bugzilla->login` before determining user identity,
    as this will perform the proper verifications against impersonation.

  - All non-obvious pieces of code should have comments explaining what
    they do, and why they are needed. This means in particular "hacky
    kludges" and "workarounds."

### Throwing Errors

Normally, when an error occurs because of user action, you call
`ThrowUserError`, eg:

`ThrowUserError("user_made_mistake");`

whereas when an error occurs because of a situation that should never
happen (indicating a bug), call `ThrowCodeError`, eg:

`ThrowCodeError("bugzilla_is_broken");`

However, when it comes to throwing errors, there are a few important
rules:

1.  Don't blame the user if there's doubt whether it's the user's fault.
2.  Don't tell the user to email the admin if the error doesn't mean
    Bugzilla is broken.

That means: use `ThrowUserError` every time that Bugzilla isn't
*broken*, even if you're not sure it's a user error. This rule overrides
the general recommendations at the top of this section.

### Taint Mode

All new CGIs should run in Perl's taint mode, and existing CGIs which
run in taint mode must not have taint mode turned off.

Taint mode works by marking untrusted data as "tainted", and not
allowing tainted data to be passed to various places. This ensures a
multitude of security holes cannot occur.

For example, the values of `$cgi->param` variables and data from browser
cookies are tainted, and tainted data may not be passed in to the
database. Doing so will cause the CGI to generate an error and
terminate.

Instead you must first "detaint" the data. The only way to do this
directly is to get the untrusted data to match a regular expression and
extract parts from it. So for example, to detaint a positive integer in
the variable `$foo`:

```perl
if ($foo =~ /^(\d+)$/) {
    $foo = $1;
}
else {
    # ERROR!
}
```

Afterwards `$foo` will be detainted.

Note that there are a few convenience functions you should use to make
life easier:

  - `detaint_natural` detaints a non-negative integer as in the example
    above.
  - `detaint_signed` detaints a signed (negative or positive) integer,
    similar to how `detaint_natural` works.
  - `trick_taint` will detaint a piece of data unconditionally, but this
    should only be used when you really know this is OK (as opposed to
    because you're lazy), because it bypasses the taint mode security
    system. If you use `trick_taint`, add a comment explaining why it's
    safe to use it.

For more information on extracting from regular expressions, see [perl's
documentation on regular
expressions](http://search.cpan.org/dist/perl/pod/perlre.pod). For more
information on taint mode, see [perl's security
documentation](http://search.cpan.org/dist/perl/pod/perlsec.pod).

Note that Bugzilla does NOT use DBI "taint-out" mode, so data *returned*
from the database will not be tainted.

### Style

  - The Bugzilla development team has decided to adopt the Perl style
    guide as published by Larry Wall. This guide can be found in
    `Programming Perl` (the camel book), by
    typing `man perlstyle` at your
    favourite shell prompt, or by reading [the latest
    version](http://search.cpan.org/dist/perl/pod/perlstyle.pod) online.
    
    This style is only for Perl. For template style, see the template
    section.

  - Indentation - Perl code should have 4-space indent.

  - Curly Braces - The opening brace of a block should be on the same
    line as the statement that is causing the block and the closing
    brace should be at the same indentation level as that statement, for
    example:
    
    ```perl
    if ($var) {
        print "The variable is true";
    }
    else {
        print "Try again";
    }
    ```
    
    instead of this:
    
    ```perl
    if ($var) {
        print "The variable is true";
    } else {
        print "Try again";
    }
    ```

  - Please refer to the perl style guide above if you don't see your
    question covered here.

### Cross-Platform Compatibility

  - Bugzilla supports \*nix platforms, and both ActiveState Perl and
    cygwin on Win32 platforms.

  - For this reason, \*nix-specific features should either be avoided,
    or only done if you have ensured the platform is Unix, and the code
    behaves reasonably if not.
    
    Some examples of \*nixisms: chown, chmod, getgrnam, $\< et al, stty
    and signal handling.

  - Similarly, some features are supported on cygwin, but not
    ActiveState Perl. You should only use these if you have ensured the
    platform isn't ActiveState.
    
    Some examples of non-ActiveState features: fork, pipe open syntax
    (eg `open (DOT, '-|')`).

## API Documentation

  - Recently many Bugzilla modules have been introduced. Some of these
    even include
    [documentation](https://www.bugzilla.org/docs/tip/html/api/). Some
    of these files are still empty, though.

Want to help out with documenting our code? Use the following Perl
Documentation example to help you get started:

```perl
# Perl code can go here.

=head1 NAME

Bugzilla::FlagType - A module to deal with Bugzilla flag types.

=head1 SYNOPSIS

  my $flaginfo = get($flag_id);
  my $count= count($criteria);
  my $inc_hash = get_inclusions($flag_id);
  my $exc_hash = get_exclusions($flag_id);

=head1 DESCRIPTION

FlagType.pm provides an interface to flag types as stored in Bugzilla.
See below for more information.

=head1 NOTES

=over

=item *

Prior to calling routines in this module, it's assumed that you have
already done a C<require CGI.pl>.

=item *

Use of private functions/variables outside this module may lead to
unexpected results after an upgrade.  Please avoid using private
functions in other files/modules.

=back

=cut

# More perl code can go here.
```

For those that are not familiar with writing POD, here are a few things
to be aware of:

  - Some documentation is nearly always better than nothing.

  - POD commands and blocks always start with an equals (=) sign.

  - POD commands must be followed by a blank line to be interpreted
    properly.

  - To end an inline POD block, use the POD command =cut.

  - **If you forget your =cut at the end of your POD section, Perl will
    ignore any code that follows until it sees an =cut, or the end of
    the file - whichever comes first.** Many editors like Emacs and VIM
    have syntax higlighting that understand POD. If you forget your =cut
    in these editors, you'll see the POD color continue beyond where you
    expected your POD to end.

  - Bugzilla PODs should have most (if not all) of the following head1
    sections:
    
      - `NAME`
      - `SYNOPSIS`
      - `DESCRIPTION`
      - `METHODS`
      - `CLASS FUNCTIONS`
      - `NOTES`
      - `SEE ALSO`

  - If your module contains private functions and/or variables, use
    `=begin private` and `=end private` to hide those functions from POD
    output, but follow the POD style required for those sections. This
    allows us to keep the documentation in the module in a consistent
    format without telling the whole world all our "trade secrets."

  - Function descriptions should generally follow the format of:\<
    ```
    C<function_name($var1, $var2, $var3 ...)> Description: Function
    Description Params: Variable Descriptions Returns: Return Value
    ``` 
    And might look something like this:  
    ```perl
    =item C<GiveHelp($fun, [$color])>
    
    
    Description: GiveHelp sends the help string for the $fun function.
    Params:      C<$fun> - The name of the function to be documented.
                 C<$color> (optional) - A string. The name of the 
                   color of the output.
    Returns:     A string containing HTML-formatted help for C<$fun>.
    ```

For an example of this POD style, see `Bugzilla/DB.pm`

To learn more about inline Perl Documentation, see the manual pages:

  - [Basic POD
    Overview](http://search.cpan.org/dist/perl/pod/perlpod.pod)
  - [Detailed POD Format
    Specification](http://search.cpan.org/dist/perl/pod/perlpodspec.pod)

## SQL

### General

  - **ANSI SQL** - There are three standards for SQL,
    [SQL 92](http://savage.net.au/SQL/sql-92.bnf.html),
    [SQL 99](http://savage.net.au/SQL/sql-99.bnf.html), and
    [SQL 2003](http://savage.net.au/SQL/sql-2003-2.bnf.html). Bugzilla
    generally tries to conform to SQL 99, where possible.
  - If a feature isn't ANSI-standard, but is supported by all databases
    we support, you can go ahead and use it. You can see all the
    databases we support by looking in the
    `Bugzilla/DB/` directory in a Bugzilla
    installation. (Every `.pm` file except
    `Schema.pm` is a database we support.)
  - Many databases have features that are not ANSI-standard, and are
    only supported by that one database. These should only be used
    inside of the `Bugzilla::DB` structure. For example, MySQL-specific
    code should only be used inside of `Bugzilla::DB::Mysql` and
    `Bugzilla::DB::Schema::Mysql`.
  - You shouldn't accept arbitrary SQL from the user, it can easily be a
    security hole. Short of fully parsing the SQL, use some other
    method.
  - Regular expression searches done by the database (with
    $dbh-\>sql\_regexp) use a subset of the regexp language of Perl, and
    not all features that work in Perl will work with the database
    regexps. When in doubt, keep it simple.
  - Databases are (almost) always more clever than you at sorting and
    searching data quickly. For this reason, it is typically faster to
    do processing in just one statement than multiple, if you can. If
    you split your statement up, you will reduce the database's
    opportunities to perform the query quickly.
  - Never use `SELECT *` -- always specify the exact columns you want.
    Frequently, the order the columns are returned in is important, and
    if the database schema changes it will be very hard to locate and
    change your code to deal with the change.
  - Using Numeric IDs - Tables should use integers rather than string
    names in primary keys. This makes renaming a lot easier and saves
    database space.
  - Tables should have *singular* names. For example, "user" instead of
    "users."
  - It is usually clearer to have your primary key column be named
    `table`\_id rather than just "id." For example, "bug\_id" for the
    `bugs` table instead of just "id."
  - Similar to perl style, it is better to use underscores to separate
    different words in column names. "default\_qa\_contact" is easier to
    read than "defaultqacontact."

### Schema Changes

If you make schema changes, you should modify:

  - `Bugzilla/DB/Schema.pm`, the
    `ABSTRACT_SCHEMA` variable. Documentation on the format is inside of
    the file itself.
  - `Bugzilla::Install::DB` to
    automatically convert old installations. Search for the last
    occurrence of `--TABLE--` in the file and put your new code *above*
    that comment.
  - (Pre-4.0) `sanitycheck.cgi` to properly
    check the new schema. This includes updating the "cross checks"
    (referential checks).

If you're changing the definition of a column, your checksetup code
needs to only run *if the column has the old definition*. That is, it
needs to do something like this:

```perl
# If bugs.qa_contact is currently defined as NOT NULL, re-define it without that.
if ($dbh->bz_column_info('bugs', 'qa_contact')->{NOTNULL}) {
    $dbh->bz_alter_column('bugs', 'qa_contact', {TYPE => 'INT3'});
    ## ... do other stuff here to fix up the new column ... ##
}
```

#### How Schema Updates Work

When Bugzilla updates the on-disk database schema, it also updates a
Bugzilla::DB::Schema object in the `bz_schema` table. This is in
`Data::Dumper` format, and shows what Bugzilla *thinks* the on-disk
structure is.

Why do we do this? Well, because *Bugzilla* has one idea of what a
field's type is, and the underlying database frequently has a
*different* idea. For example, in MySQL, `bugs.bug_id` has the following
definition:

`bug_id MEDIUMINT AUTO_INCREMENT NOT NULL PRIMARY KEY`

In PostgreSQL, that same field has the following definition:

`bug_id SERIAL UNIQUE NOT NULL PRIMARY KEY`

See how different those are? And yet, to Bugzilla, both of these are
represented with the following code:

`bug_id => {TYPE => 'MEDIUMSERIAL', NOTNULL => 1, PRIMARYKEY => 1}`

Later, if we want to change bug\_id to say, a string (which I hope we
never do, but who knows), in `checksetup.pl` we need to only do that
change if it's currently *not* already done. That is, we need to check
if bug\_id is a "MEDIUMSERIAL" and if so, change it to a string.

But guess what? The underlying database has no idea if it's a
MEDIUMSERIAL. But the schema we stored in the `bz_schema` table, when we
first installed Bugzilla--it knows\!

This becomes even more important when you think about the fact that on
PostgreSQL, `INT1, INT2, INT3,` and `INT4` are *all* represented as
`INTEGER` on the disk. So sometimes Bugzilla needs to know whether
something is an INT3 or an INT2, and it can't just ask the database
itself. It has to use the information stored in the bz\_schema table.

### How to Send And Receive Information From/To the Database

Bugzilla is using standard DBI functions to interact with the database,
through `Bugzilla->dbh`. The current recommended method for creating a
query is as follows:

```perl
use Bugzilla;
my $dbh = Bugzilla->dbh; # Connects if not already connected.
                         # Also handles db, user, password...
my $data = $dbh->selectall_arrayref("SELECT foo, bar FROM bath WHERE log = ?",
                                     undef, "foobar");

foreach my $row (@$data) {
    my ($foo, $bar) = @$row;
    # do whatever with $foo and $bar
}
```

For more information, see the [DBI
documentation](http://search.cpan.org/dist/DBI/DBI.pm) or the
[Bugzilla::DB documentation](tip/html/api/Bugzilla/DB.html).

#### Placeholders

Note that in the above example we use a question mark instead of
inserting the string "foobar" directly into the SQL. That question mark
is called a "placeholder." This is the recommended method for passing in
*all* variables into SQL statements.

Here's an example of some SQL with a placeholder:

`SELECT short_desc FROM bugs WHERE bug_id = ?`

Then, your perl code looks something like this:

    my $bug_id = 2;
    my ($short_desc) = 
        $dbh->selectrow_array("SELECT short_desc FROM bugs WHERE bug_id = ?",
                                 undef, $bug_id);

### JOIN Statements and SELECTing From Multiple Tables

Frequently when using SQL you want data from more than one table at a
time. You do this by "joining" the tables in various ways.

For this section, we will be using two tables in our examples, called
`a` and `b`. Here is what they look like:

| user\_id | user\_name |
| -------- | ---------- |
| 1        | jdoe       |
| 2        | bsmith     |
| 3        | mkanat     |

| user\_id | email              |
| -------- | ------------------ |
| 1        | jdoe@example.com   |
| 2        | bsmith@example.com |
| 2        | bsmith@e2.com      |

Note that in the below examples we use `SELECT *` for simplicity, but
[`SELECT *`should never be used in Bugzilla code](#sql-general).

#### CROSS JOIN

The *least* common (but also least understood) type of JOIN is the
"cross join," also called the "cross-product join."

A cross join means, "return all possible combinations of rows in these
two tables."

In SQL, there are two ways to do a cross join of tables `a` and `b`:

`SELECT * FROM a, b` or `SELECT * FROM a CROSS JOIN b`

The two pieces of code above are identical. The first one is called an
"implicit" join (because the database just "figures out" that we mean
CROSS JOIN, from the comma), and the second is called an "explicit" join
(because we specified exactly what we want).

If we run the SQL above with our `a` and `b` tables, the result looks
like:

| a.user\_id | a.user\_name | b.user\_id | b.email            |
| ---------- | ------------ | ---------- | ------------------ |
| 1          | jdoe         | 1          | jdoe@example.com   |
| 1          | jdoe         | 2          | bsmith@example.com |
| 1          | jdoe         | 2          | bsmith@e2.com      |
| 2          | bsmith       | 1          | jdoe@example.com   |
| 2          | bsmith       | 2          | bsmith@example.com |
| 2          | bsmith       | 2          | bsmith@e2.com      |
| 3          | mkanat       | 1          | jdoe@example.com   |
| 3          | mkanat       | 2          | bsmith@example.com |
| 3          | mkanat       | 2          | bsmith@e2.com      |

In general, you want to avoid cross joins unless you are certain they
are exactly what you need.

#### INNER JOIN

An INNER JOIN is one where you try to actually join two tables together
based on a column that they have in common. This is the most common type
of join.

For our `a` and `b` tables, we have two ways of writing an INNER JOIN:

`SELECT * FROM a INNER JOIN b ON a.user_id = b.user_id` or `SELECT *
FROM a, b WHERE a.user_id = b.user_id`

Just like with the cross join, the first version is an "explicit" join,
and the second one is an "implicit" join.

The inner join above looks like this:

| user\_id | user\_name | email              |
| -------- | ---------- | ------------------ |
| 1        | jdoe       | jdoe@example.com   |
| 2        | bsmith     | bsmith@example.com |
| 2        | bsmith     | bsmith@e2.com      |

Note that "mkanat" (with user\_id 3) is left out, because he doesn't
have an entry in both tables.

#### LEFT JOIN

A LEFT JOIN is like an INNER JOIN, but it *includes* records that have
an entry in `a` but no corresponding entry in `b`. That is, where
"mkanat" was left out in our INNER JOIN above, he would be included in
our LEFT JOIN.

A LEFT JOIN is normally only done one way:

`SELECT * FROM a LEFT JOIN b ON a.user_id = b.user_id`

The result of that code looks like this:

| user\_id | user\_name | email              |
| -------- | ---------- | ------------------ |
| 1        | jdoe       | jdoe@example.com   |
| 2        | bsmith     | bsmith@example.com |
| 2        | bsmith     | bsmith@e2.com      |
| 3        | mkanat     | `NULL`             |

There was no "email" for "mkanat," so the database returns `NULL` there.

It's called a "left" join because we include entries from the table on
the *left* (table `a`, note that it's on the left side of the words
"LEFT JOIN") that don't have a match in the table on the right side.

**Warning**: If we add a `WHERE email = ?` to the above SQL statement,
*the row containing mkanat will **never** be returned*. This is because
**NULL is never *equal* to anything**.

### Indexes

#### Simple Description of Indexes

Indexes speed up SELECT statements.

Normally, if you have a table of 10,000 rows, and you want row number
8000, the database has to go through all 10,000 rows to find your row.
That's called a "table scan," and it's usually slow.

With an index, you ask it for "row 8000" and it gives it to you
instantly.

#### More Details

OK, so in reality you wouldn't be asking for "row 8000," you'd be doing
something like `WHERE bugs.bug_id = 8000` in your SQL.

In order for the database to do that quickly, it needs an index on the
`bugs` table, on the `bug_id` column.

#### When To Add An Index

Generally, you should add an index any time you plan to use a column in
a WHERE clause, or in the "ON" part of a JOIN statement.

Adding too many indexes to a table will slow down INSERT and UPDATE
statements, so don't add indexes you don't need.

#### Multi-Column Indexes

Many databases (MySQL in particular) will only use *one index per table
per query*.

That is, imagine that we do: `SELECT * FROM bugs WHERE priority = 'P1'
OR op_sys = 'Windows'`. We have two indexes on the bugs table, one for
"priority" and one for "op\_sys." **Only one of them will be used.** The
one that's used is up to the database, it will try to pick the "best"
one to use, and then do a table scan for the other one.

If we want that to be fast, we can create a *single* index that contains
the values for *both* `priority` and `op_sys`. That is called a
multi-column index.

Multi-column indexes are always in a certain order. For example, either
"op\_sys, priority" or "priority, op\_sys." For your purposes, those two
indexes are *totally identical*, with one exception: **The first column
of a multi-column index can be used like it's a single-column index.**
So, for example, having an index on both "priority, op\_sys" and
"priority" would be redundant. Don't do it.

#### Write Queries With Indexes In Mind

When writing a query, give a brief thought to how it will use indexes.
Don't try to solve performance problems before you know they exist
(remember our rules from the top of the Developer's Guide), but do give
a brief thought to it, particularly the fact that only one index will be
used per table, per query, by common databases.

### Cross-Database Query Compatibility

Different databases support different things, and different databases
use different syntax for similar features. `Bugzilla->dbh` provides many
functions that will generate correct SQL for the database that Bugzilla
is using. These functions all have names that start with `sql_`.

Here are the MySQL constructs that must be replaced with Bugzilla::DB
`sql_` functions:

  - `BEGIN/START [TRANSACTION] / COMMIT [TRANSACTION]`
  - `REGEXP / NOT REGEXP`
  - `LIMIT`
  - `TO_DAYS`
  - `DATE_FORMAT`
  - `INTERVAL`
  - `CONCAT`
  - `INSTR / POSITION`
  - `GROUP BY`
  - `MATCH` or anything having to do with "fulltext" indexes.

Also, if you absolutely need to do a case-insensitive string comparison,
use `sql_istrcmp` instead of `=` or other operators.

The following SQL constructs should *never* be used. Replace them with
something else instead:

  - `ENCRYPT()` - use Perl's `bz_crypt` function instead.
  - bit arithmetic (`AND`, `OR` and `NOT` on numbers)
  - `REPLACE INTO` - instead use a check if the row is there, and then
    either an INSERT or an UPDATE.
  - double quotes (") for string literals - instead use single quotes or
    `$dbh->quote()`.
  - `IFNULL` (use `COALESCE`)
  - Columns of MySQL type `ENUM` or `TIMESTAMP`.
  - Any boolean comparison that is *inside the fields of a SELECT
    statement*. For example `SELECT (column IS NOT NULL) FROM b` will
    *not* work. (Use `CASE WHEN column IS NOT NULL THEN 1 ELSE 0 END`
    instead.)
  - `WHERE` statements without an operator. For example, `SELECT column
    FROM b WHERE a` will *not* work. That needs to have: `WHERE a = 1`.
  - `IF` - use `CASE WHEN` instead.
  - `INSERT` statements with multiple groups of parentheses after
    VALUES. Instead, just call INSERT multiple times.

The following query features are not currently available in all
databases that Bugzilla supports, and so should be avoided:

  - Transactions (`START TRANSACTION` or `COMMIT`)
  - Subselects (`SELECT * FROM (SELECT * FROM b)`)

#### A Note About INNER JOIN

In general, *implicit* INNER JOINs (`FROM a, b WHERE a.user_id =
b.user_id`) are faster than *explicit* INNER JOINs (`FROM a INNER JOIN b
ON a.user_id = b.user_id`). This is because explicit INNER JOINs bypass
the query optimizer on some databases and specify that the database
*must* use that table order.

However, you can't mix explicit and implicit joins. It works on older
MySQL versions (before 5.0), but that's it. So, if you have any LEFT
JOIN statements in your SQL, you cannot have any "comma" joins.

In general, the performance penalty for explicit INNER JOINs should only
happen on older databases (PostgreSQL before 7.4, for example), so don't
worry about it too much. When in doubt, do an explicit join.

### Style

  - Bugzilla uses a capitalisation convention for SQL. SQL keywords such
    as `SELECT`, `WHERE` and `AND` should be all upper case. Even
    function names like `NOW()` should be upper-case. Database, table
    and field names should be all lower case, for example:
    
    `SELECT fieldname1 FROM tablename WHERE fieldname2 = 2 AND
    fieldname3 = 'HELLO' AND time = NOW()`

  - **Indentation:** For short SQL statements, you can indent them in
    whichever way you like. However, for long SQL statements, the
    recommended formatting is like this:
    
    ```sql
    SELECT DISTINCT groups.id, groups.name, groups.description
               FROM groups 
                    CROSS JOIN user_group_map
                    CROSS JOIN group_group_map AS ggm
              WHERE user_group_map.user_id = ?
                    AND ((user_group_map.isbless = 1
                          AND groups.id = user_group_map.group_id)
                         OR (groups.id = ggm.grantor_id
                             AND ggm.grant_type = ?
                             AND ggm.member_id IN(1, 2, 3))))
           ORDER BY groups.id
    ```
    
    Note how all the major keywords are right-aligned. This makes it
    very easy to scan through the statement. Also, look at how the WHERE
    clause is aligned--in such a way as to show the logical groupings,
    but without a lot of extra spacing.
    
    Also, because it was such a complex query, we put the table name at
    the beginning of each column name. This makes it much easier to see
    where data is coming from, even if it's not always necessary. (For
    simple queries that query only one table, don't do that. It's
    obvious where the data is coming from.)

## Templates

### General

  - Bugzilla uses the Template Toolkit (TT) (module name
    `Template`) to allow administrators
    to easily customise output and more importantly to allow Bugzilla to
    be fully localized. To learn more about TT, try
    `man Template::Manual` or go to
    <http://www.template-toolkit.org/>.

  - The testing suite will check that templates have no errors. This is
    done by running the template with the normal filters and no input.
    While this won't produce a sensible page, it will find many errors.
    Occasionally having no input can produce an error where none would
    have otherwise occurred, but this can generally be worked around by
    changing the template.

  - The testing suite will make sure you don't use the term “bug” or
    similar terms in templates. This term is customisable by the
    administrator in Bugzilla and you need to ensure your template uses
    the correct setting.
    
    Instead, you should use the terms hash, for example:
    
    `  [% terms.bug %]  `
    
    The terms hash is defined in the
    `global/variables.none.tmpl` file.

  - You should use the supplied filters where available. See
    `man Template::Manual::Filters` for
    information on filters and list of the standard TT filters, and also
    see the template handling code in
    `Bugzilla/Template.pm` for information
    on the extra filters defined by Bugzilla.

  - If in doubt as to whether something should be done in a template or
    code, a good rule of thumb is “Code is for computing data, whereas
    templates are for presentation of that data.”.

  - If you find that you need to do a presentation task that can't be
    easily done in TT, and needs Perl, then introduction of a new filter
    would likely be the appropriate solution.

  - See the current templates for ideas on how to do stuff.

  - The testing suite will make sure every variable you insert into a
    template is filtered, except for text templates. This is to avoid
    bugs caused by forgetting to filter variables, especially cross-site
    scripting security holes.
    
    If you really don't need to filter a variable, add it to the
    appropriate
    `template/\<lang\>/default/filterexceptions.pl`
    file. This is generally not a good idea and should be avoided.
    
    See the section on HTML templates for more information about
    appropriate filtering practices in HTML templates.

  - For repeated code, you should use blocks, including parameterised
    blocks. This means directives such as `PROCESS` and `INCLUDE`.

  - `PROCESS` is preferred for performance reasons over `INCLUDE`. Only
    use `INCLUDE` when you need the template fragment to be able to
    change your variables.

  - To set up a template, make sure this code is near the start of your
    script:
    
    `my $template = Bugzilla->template; my $vars = {};`
    
    and then you need to populate the `$vars` variable, for example:
    
    `  $vars->{'id'} = 3; $vars->{'array'} = [ 'g', 'o' ];  `
    
    See the appropriate sections below for information on how to output
    the template.

### Filenames and Paths

  - CGIs can use templates with the same interface of different
    "formats". These templates are called multiple format templates.
    Full multiple-format templates should be named
    `stubname-formatname.contentshortname.tmpl`,
    eg `foo-traditional.html.tmpl`.
  - Template "fragments" (files which are used by other files and are
    not intended to be used by themselves) and full single format
    templates should be named
    `stubname.contentshortname.tmpl`, eg
    `bar.html.tmpl`.
  - All English templates should go in the
    `template/en/default` hierachy. If you
    are introducing a new template, especially if you are introducing a
    new directory, please seek advice from the Bugzilla team for the
    proper exact location of the template.
  - Stubnames should not use spaces or underscores, instead they should
    use hyphens to separate words.
  - When choosing an appropriate stubname, you often want to use a
    verb-object name, eg
    `destroy-widget.html.tmpl`. When the
    object is obvious from the directory, you can omit it, eg
    `widget/destroy.html.tmpl`.
  - The terminology create/list/edit/created/delete is generally used in
    stubnames. See the existing templates for stubname guidance.

### HTML Templates

  - To output an HTML template to the browser, you can use this code:
    
    `  use Bugzilla; ... my $cgi = Bugzilla->cgi; ... print
    $cgi->header(); $template->process("file-name.html.tmpl", $vars)
      || ThrowTemplateError($template->error());  `
    
    where `file-name.html.tmpl` is replaced by the appropriate filename.
    You can also pass a parameter to `header()` specifying the MIME type
    if it's not text/html.

  - Template Comments - You should generally use template comments
    rather than Javascript or HTML comments, so they don't bloat the
    output.

  - Indentation - HTML and XML Templates should have a 2-space indent.
    
        <fred>
        [% IF foo %]
          <bar>
          [% FOREACH x = barney %]
            <tr>
              <td>
                [% x %]
              </td>
            <tr>
          [% END %]
        [% END %]
        </fred> 
    
      
    If you use VIm, then you can enter the following into `.vimrc` to
    help avoid tab symbols:
    
    ``` 
      au BufNewFile,BufRead *.tmpl set et ts=2 sw=2 tw=80
    ```

  - Line Length - You shouldn't extend lines past 80 characters -
    instead, break lines, in the middle of multi-attributed HTML tags if
    necessary.

  - Header/Footer - Full HTML Templates should use the
    `global/header.html.tmpl` and
    `global/footer.html.tmpl` templates.

  - You probably want to use the `html` filter on most variables, to
    ensure characters which have special meaning to HTML (like like \<,
    \> and &), will be interpreted as normal characters. For example:
    
    `[% myvar FILTER html %]`
    
    instead of:
    
    `[% myvar %]`
    
    So if myvar was "\<b\>hello\</b\>", after filtering that string
    would appear as is on the page, rather than as bold text.
    
    If in doubt as to whether to use the `html` filter on a variable,
    because the variable probably never contains special characters, but
    should be filtered if it did, you should generally err on the side
    of caution and filter it anyway.

  - When URIs appear in HTML, the `html` filter is not enough to
    properly escape strings into the format that can appear in a URI.
    
    TT provides a filter called `uri` that escapes characters such as
    spaces that are invalid in URIs. For example:
    
    `<a href="hello.cgi?name=[% myvar FILTER uri %]">`
    
    This will escape most non-alphanumeric characters, even those that
    are valid and have no special meaning in URIs. In particular, it
    will encode all the HTML special characters (such as \< and \>), so
    you do not need to call the `html` filter as well afterwards.
    
    For example, consider the variable `myuri` containing the string
    "hello &":
    
      - When not filtered:
        
        `<a href="hello.cgi?name=[% mytext %]">`
        
        would become:
        
        `<a href="hello.cgi?name=hello &">`
        
        which is not valid HTML as the ampersand is not allowed raw in
        an attribute.
    
      - When `html` filtered:
        
        `<a href="hello.cgi?name=[% mytext FILTER html %]">`
        
        would become:
        
        `<a href="hello.cgi?name=hello &amp;">`
        
        which would be valid HTML but an invalid URI:
        
        `hello.cgi?name=hello &`
        
        as it contains a space.
    
      - When `uri` filtered:
        
        `<a href="hello.cgi?name=[% mytext FILTER uri %]">`
        
        would become:
        
        `<a href="hello.cgi?name=hello%20%26">`
        
        which is valid HTML and a valid URI:
        
        `hello.cgi?name=hello%20%26`
        
        and has the desired result of passing the whole `mytext`
        variable as the "name" parameter.

### Web Technologies

  - HTML output should be valid [HTML 5](http://www.w3.org/TR/html5/).
    You can test the output of a Bugzilla page by using the [W3C's HTML
    validator](http://validator.w3.org/).
  - In addition, the HTML should use a style that makes them as XHTML
    compatible as is possible without failing to validate or causing
    compatibility problems. This means in particular using lower case
    tags and double quoting all attributes.
  - Use the `<label>` tag on checkboxes and radio buttons where
    appropriate. This will also help with accessibility.
  - Bugzilla should work reasonably on all browsers.
  - While Bugzilla uses Javascript and cookies to make the user
    experience easier, no patch to Bugzilla should *require* either. The
    only exception is that the administrative interfaces (the edit\*
    CGIs) may require JavaScript, as we expect the administrator to have
    a JavaScript-capable browser.

## Security

Please consider the security implications of your code. In particular,
thoroughly check user permissions, and thoroughly check data is in the
right format.

Perl is a reasonably secure language. Buffer overflow and format string
attacks are believed to not be possible.

Furthermore, Perl's taint mode can catch a wide range of
failure-to-validate errors and transform them from potential security
holes into mere errors.

But there will always be security problems (see below), as no language
can prevent all types of problem.

### Don't Trust URL Parameters And Cookies\!

URL parameters and cookies are under the control of the user, and hence
should not be trusted. Make sure they are in the correct format before
using them, and don't trust anything they say about the user's authority
or identity, other than through the standard Bugzilla authentication
mechanisms.

To find a user's identity, examine the properties of the User object
returned by `Bugzilla->user` after the appropriate call to
`Bugzilla->login`. See [Bugzilla::User](tip/html/api/Bugzilla/User.html)
for details.

### Confidential Information Leakage

Bugzilla has various facilities to restrict products and bugs to users
in certain groups. When users can bypass this mechanism, it is a
security hole.

This can occur when you fail to check appropriate permissions before
doing something. Please consider this in your code.

Also, arbitrary user-passed SQL can be used in bug lists to return
unexpected bugs, so you shouldn't allow it.

Note that even the name of a product can be confidential. Whenever
possible, don't inform the user that something exists, if they can't
access it.

### Unauthorised Access to Perform an Action

This is allowing a user to do something they shouldn't be able to do,
like edit a bug they don't have access to. Similar to confidential
information leakage, this also often occurs when you fail to do an
appropriate check.

### Arbitrary Code Execution

This is a very serious hole, as it often has the potential to let the
attacker do a wide range of things with a system. It occurs when a user
can pass code that then runs, including Perl, HTML, shell-script or SQL.

Generally this isn't intentional, but instead occurs when you fail to
properly validate or escape a string you pass as a part of some code.

Some instances of this should be picked up by taint mode:

  - Passing untrusted strings to SQL. Use placeholders instead of
    passing strings directly into SQL, and remember to [detaint the
    data](#perl-taint) before passing it into the placeholder.
  - Passing untrusted numbers to code. Use `detaint_natural` to validate
    and detaint the number.

Some aren't, but will probably be picked up by the testing suite:

  - Using the multiple parameter form of `system` or `exec`.
  - Passing untrusted strings to HTML. Use the `html` filter in TT.
