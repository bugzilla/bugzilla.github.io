---
title: "Reviewers' Guide"
---

The following is a guide for reviewers of code submitted for Bugzilla.
The review process is designed to remove problems from a patch before it
is checked into the Bugzilla tree, to improve the quality of Bugzilla.

## Becoming a Reviewer

Reviewers are blessed by the project leader as reviewers. If you wish to
become one, email the project leader.

Before becoming a reviewer, you will generally need to have a
demonstrated experience of providing reasonable Bugzilla patches. You
should also understand the contents of this guide and the [Developers'
Guide](developer.html), and be able to demonstrate this if necessary.

Although Bugzilla has a project leader with ultimate authority, the
project mostly operates on consensus. The reviewers drive the project -
they are the primary developers, the discussers, and the decision
makers. They are generally also the "core" developers of Bugzilla, each
with their own strengths and weaknesses.

As such, reviewers are emissaries for the project, and should act
reasonably to those who are not reviewers, even when those people are
not acting reasonably themselves. Unfortunately, people can take the
opinion of one person as that of the entire project, and that is not in
anyone's best interest. In particular, this means trying to be civil, as
well as trying to have a thick skin. If someone is to be given the
proverbial finger, that should be on the consensus of the reviewers.

## Review Process

### Beginning The Process

When a patch is ready to be reviewed, a "review" request is raised,
usually by the patch author.

### Review

At some stage, the first review will be done. The review will either be
positive (meaning the reviewer is happy with the patch) or negative
(meaning they aren't). Typically a negative review will be accompanied
by reason(s).

A negative review is generally the end of the process, and a new patch
will generally be expected which takes into account the reasons for the
negative review. Occasionally, a negative review might be rescinded and
turned into a positive one, if the negative review reasons were judged
to be incorrect.

Upon a positive review, the reviewer may elect to ask for a subsequent
review, by raising a further review request on another person, if they
feel the patch is complex or significant enough to warrant special
attention.

In particular, a security issue must have at least two reviews. It is
expected, however, that most patches won't need a second review.

Reviews should only be done by blessed reviewers. Reviewers may not
review a patch they wrote or cowrote. An exception to this is if the
patch is a backport to a stable branch, in which case the original
author should be a reviewer if they wasn't the backporter.

If the reviewer feels unqualified to review a part of a patch, they can
delegate part of the review to another party who need not be a blessed
reviewer.

If the reviewer feels unqualified to review any of the patch, and feels
there is a better blessed reviewer, they should attempt to notify a
better reviewer.

If the reviewer feels unqualified to review any of the patch, but feels
there is no better blessed reviewer, they should review as well as
possible, and can delegate a full review to another party who need not
be a blessed reviewer.

When delegating, the responsibility for updating the request statuses is
in the blessed reviewer's hands.

### Overriding Reviews

Normally, you may not override the review of another reviewer. That is,
you can't clear their review flag and add your own. You are free to add
your review flag as an *additional* flag, though.

There are two exceptions ot this:

  - A module owner can override a review in their module.
  - The Project Leader can override any review.

Those two exceptions should be used **extremely sparingly**, though.
Reviewers *are* the authority on reviews.

### Approval

Once reviewing is complete, the patch needs to be approved. The final
reviewer should raise an "approval" request.

Approval is done by the project leader or blessed delegate. The purpose
of approval is for the project leader to be able to keep control of the
entire Bugzilla product, to ensure similar, bad or conflicting features
aren't introduced. Approval does not usually involve in depth review of
code, although nothing prohibits this.

If approval isn't granted, the approver might decide to ask for a
rereview, a new patch, or resolve the bug entirely without checkin.

### Checking In

Once the patch is reviewed and approved, it needs to be checked in. If
the bug owner has checkin authority, they should check the patch in,
otherwise any other reviewer should.

## Documentation Review

The review process above is for changes that can break Bugzilla.  Things
that can't, ie documentation changes, follow different rules.

## Checking In & Out

If you are a reviewer and wish to have checkin access, then you need to
follow the instructions on the [mozilla.org checkin authority
page](https://www.mozilla.org/hacking/getting-cvs-write-access.html).
 When you file a bug, CC the project leader who will decide whether to
vouch for you.  Be sure to specify when filing the bug that you are
applying for Webtools access only, and so do not need a
super-reviewer.  
  
Once you have checkin access, you need git software to check in and out.
See your git documentation for more information about using git.  
  
To get a copy of the Bugzilla source code, run this command:  
  
`git clone https://git.mozilla.org/bugzilla/bugzilla.git bugzilla`  
  
However, if you want to be able to check in, you must instead use a
different path. Git's authentication is based on your ssh key, so as
long as your account has an ssh key on file, it will know who you are.
Everyone uses the same username.  
  
Your command would be:  
`git clone ssh://gitolite3@git.mozilla.org/bugzilla/bugzilla.git
bugzilla`  

## How To Review

Reviewers should test the patch as well as visually review it.  
  
Although some aspects of reviewing a patch are formulaic, the process is
by no means completely so.  Reviewers should consider all aspects of the
patch.  
  
The next sections are checklists that detail some of the things
reviewers should look for.  Because they are by no means a complete list
of things to check, it is recommended they are not consulted until after
the review is otherwise complete.

## General Review Checklist

  - check the testing suite passes
  - check any new files have an appropriate file name
  - check any new files have the MPL 2.0 license headers
  - are there any other places where this occurs?
  - how could the problem be prevented from reoccurring?
  - what might this regress?

## CGI Review Checklist

  - check Perl style
      - 4 space indenting
      - braces
  - check any new Perl files have appropriate switches (-wT)
  - check any new Perl files have "use 5.10.1" and "use strict"
  - check variable names are appropriate
  - check there are no unquoted variables in regular expressions
  - check disallowed MySQL features are not used directly:
      - enumerations
      - encrypt
      - bit arithmetic
      - timestamp fields
      - REPLACE INTO
      - double quotes
  - check schema changes are properly reflected in sanitycheck and
    checksetup
  - check detainting is done properly
  - check new tables use IDs where appropriate
  - check CGI standard output is properly templatised
  - check cookies is not compulsory
  - check non-obvious pieces of code are commented
  - check proper SQL capitalisation

## Template Review Checklist

  - check for valid HTML5
  - check for \<label\> tag on checkboxes and radio buttons
  - check for cross-browser compatibility
  - check template style
      - 2 space indenting
      - indentation for readable HTML
      - file name
      - file location
  - check templates use parameterised blocks where appropriate
  - check templates use supplied filters
  - check Javascript are not compulsory
  - check template comments are used rather than HTML/JS/etc ones
  - check for excessively long lines (80 characters)
  - check "global/header" and "global/footer" are present
  - check for unescaped HTML, URLs
