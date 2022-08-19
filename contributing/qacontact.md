---
title: "QA Contact Guide"
---

This guide is an introduction on using Bugzilla for carrying out QA
activities. This guide is intended for QA contacts who are new to
Bugzilla. By no intent and purpose should this guide be regarded as a
complete manual for software quality; readers of this guide are assumed
to have adequate background knowledge of software quality.

## What is expected of QA contacts?

QA contacts are responsible for assisting engineers in assuring and
improving source code quality. In general QA contacts are responsible
for the following activities:

1.  [test and discover bugs in his or her department](#discover);
2.  [test, review, and verify bug fixes](#verify);
3.  devise test plans and carrying them out to discover regressions; and
4.  ensuring the product(s) in his or her department is(are) “good to
    go” for the next milestone.

### Discover bugs

QA contacts are responsible for discovering bugs in his or her
department.

When a new bug report is filed against the QA contact's department, the
QA contact should test and verify the bug. The QA contact should ensure
the bug report is **useful** for the responsible engineers. The QA
contact should:

1.  verify the bug exists in the source trunk,
2.  verify that the bug can be reproduced in specific steps,
3.  attach any necessary testcase,
4.  add any necessary additional information,
5.  look for any obvious duplicates and resolve the bug if neccessary,
6.  test whether similar bugs are present in related parts of the
    product or by using different ways of doing the same thing, and set
    the appropriate bug dependencies,
7.  check for platform parity.

If the bug is “good”, the QA contact should:

1.  confirm the bug as new if in UNCONFIRMED state,
2.  reassign the bug to the appropriate owner if necessary,
3.  add other people who should know about the bug to the CC list, and
4.  add appropriate
    [keywords](https://bugzilla.mozilla.org/describekeywords.cgi) (e.g.
    `testcase`).

If the bug is a regression from an older fixed bug, the QA contact
should do one of the following:

1.  resolve the new bug as duplicate of the fixed bug and reopen the
    fixed bug,
2.  add reviewers and writers of the patches checked in from the fixed
    bug that cause the regression to the CC list and add the appropriate
    keywords (e.g. `regression`).

### Verifying bug fixes

A QA contact is responsible for ensuring that any proposed code change
for a bug report would improve source code quality, would fix the bug
and other related bugs, and would not cause any undesireable side
effects.

When a new patch is proposed, the QA contact should either review the
patch him or herself or ask another person to review it.

When patches are checked in, the QA contact should:

1.  test the bug is fixed after the patches are checked in and verify
    the bug as fixed.
2.  read through all the comments on the bug before verifying, see if
    there are any issues that warrant the bug being reopened or residual
    bugs being filed. If the latter occurs, note those bugs' numbers in
    the verification comment.
3.  repeat the previous step for duplicate bugs.
