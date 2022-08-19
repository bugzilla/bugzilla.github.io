---
title: "Query Cookbook"
---

As a bugzilla administrator, sometimes the queries I need to do are too
specialized for the standard bugzilla query page and I have to do them
in SQL. I want to record some of these queries here for later reference
to save me from re-inventing the wheel. Hopefully others will find this
useful as well.

  - Search for bug owners who seem to have not used bugzilla in a while.
    Send these people mail and disable the accounts of those that
    bounce. Use the date that they last commented on a bug to decide
    whether they're active. This isn't perfect, but its good enough
    since most bug operations require a comment of some kind and in any
    case, we're not going to do anything to them unless their mail
    bounces.
    ```sql
    SELECT MAX(bug_when) AS last_update,
           profiles.login_name AS email
    FROM longdescs AS ld,
         bugs,
         profiles
    WHERE ld.who = bugs.assigned_to
      AND ld.who = profiles.userid
    GROUP BY email
    HAVING last_update < DATE_SUB(NOW(),INTERVAL 1 YEAR)
    ;
    ```
    
    The above query probably would have done the job but our db is too
    huge to take the direct approach. I made a copy of the bugs db and
    deleted resolved bugs and 'old' comments. From this I created a list
    of owners of open bugs and a list of owners who have commented
    recently. Subtracting one list from the other creates a list of
    people who haven't.
    
    1.  Create a dump of the original database.
        ```
        % mysqldump bugs > ~/bugs.dump
        ```
    
    2.  Create a temporary database to hold your trimmed version of the
        db.
        ```
        % mysql
        mysql> CREATE DATABASE tmp;
        ```
    
    3.  Import the bug database.
        ```
        % mysql tmp < bugs.dump
        ```
    
    4.  Delete old long descriptions.
        ```sql
        DELETE FROM longdescs WHERE bug_when < DATE_SUB(NOW(),INTERVAL 1 YEAR);
        ```
    
    5.  Remove bugs that aren't open.
        ```sql
        DELETE FROM bugs WHERE bug_status IN('RESOLVED', 'VERIFIED', 'CLOSED');
        ```
    
    6.  The only bugs left are open ones. The only comments left are
        recent ones. For each bug, print the owner if you can find a
        comment for them. This is a list of bug owners with recent
        comments.
        ```sql
        SELECT p.login_name
        FROM profiles p
             INNER JOIN bugs ON p.userid = bugs.assigned_to
             INNER JOIN longdescs ON bugs.assigned_to = longdescs.who
        GROUP BY p.login_name
        INTO OUTFILE "/tmp/aliveowners"
        ;
        ```
    
    7.  Make a list of all bug owners.
        ```sql
        SELECT p.login_name
        FROM profiles p
             INNER JOIN bugs ON p.userid = bugs.assigned_to
        GROUP BY p.login_name
        INTO OUTFILE "/tmp/allowners"
        ;
        ```
    
    8.  Subtract the list of alive owners from the list of all owners to
        get a list of owners of open bugs who haven't commented on a bug
        recently.
        ```
        % diff aliveowners allowners > checkonthese
        ```

  - Bugs assigned to people with disabled accounts.
    ```sql
    SELECT bugs.bug_id,
           p.login_name,
           comp.name,
           bugs.short_desc
    FROM bugs
         INNER JOIN profiles p ON bugs.assigned_to = p.userid
         INNER JOIN components comp ON bugs.component_id = comp.id
    WHERE bugs.bug_status IN('UNCONFIRMED', 'NEW', 'CONFIRMED', 'ASSIGNED', 'IN_PROGRESS', 'REOPENED')
      AND p.disabledtext != ""
    ;
    ```

  - Bugs whose QA contact is disabled.
    ```sql
    SELECT bugs.bug_id,
           p.login_name,
           comp.name,
           bugs.short_desc
    FROM bugs
         INNER JOIN profiles p ON bugs.qa_contact = p.userid
         INNER JOIN components comp ON bugs.component_id = comp.id
    WHERE bugs.bug_status IN('UNCONFIRMED', 'NEW', 'CONFIRMED', 'ASSIGNED', 'IN_PROGRESS', 'REOPENED')
      AND p.disabledtext != ""
    ;
    ```

  - Count how many times a bug has been marked FIXED.
    ```sql
    SELECT bug_id,
           COUNT(bug_id) AS my_sum
    FROM bugs_activity
    WHERE added = 'FIXED'
    GROUP BY bug_id
    ORDER BY my_sum
    ;
    ```

  - See who triages the most newly filed bugs by counting the number of
    times each person has changed bugs from the UNCONFIRMED state in the
    bug activity table. This includes confirming bugs and closing bugs
    without confirming them first (e.g. marking as duplicate).
    ```sql
    SELECT COUNT(ba.bug_id) AS confirmsum,
           p.login_name
    FROM profiles p,
         INNER JOIN bugs_activity ba ON p.userid = ba.who
         INNER JOIN fielddefs fd ON ba.fieldid = fd.fieldid
    WHERE fd.name = 'bug_status'
      AND ba.removed = 'UNCONFIRMED'
    GROUP BY p.login_name
    ORDER BY confirmsum
    ;
    ```

  - Count how many bugs each person has confirmed. List the top 20
    people in descending order.
    ```sql
    SELECT profiles.login_name AS email,
           COUNT(bug_id) AS bugcount
    FROM bugs_activity ba,
         INNER JOIN profiles ON ba.who = profiles.userid
         INNER JOIN fielddefs fd ON ba.fieldid = fd.fieldid
    WHERE fd.name = 'everconfirmed'
      AND ba.added = 1
    GROUP BY email
    ORDER BY bugcount DESC
    LIMIT 20
    ;
    ```

  - Count how many unconfirmed bugs people closed as INVALID, DUPLICATE
    or WORKSFORME. Sort in descending order and list only the top ten.
    ```sql
    SELECT profiles.login_name AS email,
           COUNT(ba.bug_id) AS bugcount
    FROM bugs_activity ba
         INNER JOIN profiles ON ba.who = profiles.userid
         INNER JOIN bugs ON ba.bug_id = bugs.bug_id
         INNER JOIN fielddefs fd ON ba.fieldid = fd.fieldid
    WHERE fd.name = 'resolution'
      AND ba.added IN('INVALID', 'DUPLICATE', 'WORKSFORME')
      AND bugs.everconfirmed = 0
    GROUP BY email
    ORDER BY bugcount DESC
    LIMIT 10
    ;
    ```

  - Count how many bugs each person has verified as INVALID.
    ```sql
    SELECT profiles.login_name AS email,
           COUNT(bugs.bug_id) AS bugcount
    FROM profiles
         INNER JOIN bugs_activity ba ON profiles.userid = ba.who
         INNER JOIN bugs ON ba.bug_id = bugs.bug_id
         INNER JOIN fielddefs fd ON ba.fieldid = fd.fieldid
    WHERE fd.name = 'bug_status'
      AND ba.added = 'VERIFIED'
      AND bugs.resolution = 'INVALID'
    GROUP BY email
    ORDER BY bugcount
    ;
    ```

  - Count how many bugs each person has added attachments to.
    ```sql
    SELECT p.login_name AS email,
           COUNT(a.bug_id) AS bugcount
    FROM profiles p,
         INNER JOIN attachments a ON p.userid = a.submitter_id
    GROUP BY email
    ORDER BY bugcount
    ;
    ```

  - List the top 100 bug reporters.
    ```sql
    SELECT profiles.login_name AS email,
           COUNT(bugs.bug_id) AS bugcount
    FROM bugs
         INNER JOIN profiles ON bugs.reporter = profiles.userid
    GROUP BY email
    ORDER BY bugcount DESC
    LIMIT 100
    ;
    ```

  - List people who have reported more than 500 bugs.
    ```sql
    SELECT profiles.login_name AS email,
           COUNT(bugs.bug_id) AS bugcount
    FROM bugs
         INNER JOIN profiles ON bugs.reporter = profiles.userid
    GROUP BY email
    HAVING bugcount > 500
    ORDER BY bugcount
    ;
    ```

  - List the top ten largest attachments.
    ```sql
    SELECT p.login_name,
           attach_id,
           bug_id,
           LENGTH(thedata) datalength,
           ispatch,
           description
    FROM attachments a
         INNER JOIN profiles p ON a.submitter_id = p.userid
    ORDER BY datalength DESC
    LIMIT 10
    ;
    ```

  - List all of the people who have granted or denied a review in the
    Bugzilla product in the last 6 months.
    ```sql
    SELECT profiles.login_name,
           MAX(act.bug_when) AS last_review,
           COUNT(act.added) AS review_count
    FROM bugs_activity AS act
         INNER JOIN profiles ON act.who = profiles.userid
         INNER JOIN bugs ON act.bug_id = bugs.bug_id
         INNER JOIN products ON bugs.product_id = products.id
    WHERE DATE_SUB(NOW(),INTERVAL 6 MONTH) < act.bug_when
      AND (act.added = 'review+' OR act.added = 'review-')
      AND products.name = 'Bugzilla'
    GROUP BY profiles.login_name
    ORDER BY review_count DESC
    ;
    ```

