---
title: "Donate to Bugzilla"
redirect_from:
- /funding/
- /contributing/funding/
- /contributing/funding.html
- /donations/
- /give/
addons:
- type: css
  link: /assets/css/funding.css
monthly_goal: 113
monthly_balance: 113
devfund_goal: 4000
devfund_balance: 146
general_balance: 467
b52rel_goal: 1000
b52rel_balance: 1000
b6rel_goal: 4000
b6rel_balance: 4000
last_update: "2026/06/11"
---

<h2>Why your $10 matters this month</h2>

<p>Historically, Bugzilla grew because companies that used it let their
developers contribute improvements upstream.</p>

<p>That is much less common now. Many teams customize private copies for
short-term speed and never contribute those changes back, which leaves the
public project with less ongoing development capacity. (If your company uses
Bugzilla and can spare a few developer hours each week, we would love that
help, too.)</p>

<p>That is why we are raising recurring funding to support a part-time
developer and keep core Bugzilla work moving forward.</p>

<h2>Thanks to our Sponsors!</h2>
{% include sponsor-grid.html %}

<h2>Where does your money get spent?</h2>

<p>All monetary amounts listed on this page are in US Dollars (USD).</p>
<p>Amounts last updated {{ page.last_update }}.</p>

<h3>Keeping the Lights On</h3>

<p>The project currently has a number of operational expenses before we
even get to funding developers. This includes hosting 3 servers in Linode,
our annual filing fees both with the IRS and with the State of Michigan,
domain registrations, and non-profit corporation liability insurance.</p>

<p>This currently averages ${{ page.monthly_goal }} per month, and is
funded first from recurring donations before that money can be used
towards development.</p>

<h3>Funding Development</h3>

<h4>Permanent developer</h4>

<p>Our pie-in-the-sky goal right now is to have a permanent part-time
developer to work around 20 hours per per week on Bugzilla on whatever needs
doing, such as triaging bug reports, reviewing patches from volunteer
contributors, and coding of high priority patches, and not just one-off
projects. To do this, we anticipate needing about $4000 per month in
recurring donations. <b>Until this goal is met, the balance will be
contributed to the general project fund each month (see below).</b> Once the
permanant developer goal is hit, then a permanent developer will be hired,
instead.</p>

<p>Recurring donations exceeding the above "keeping the lights on" expenses:</p>

<div class="fundwrapper">
<p>Fund a permanent half-time developer on a monthly basis</p>
<div class="fundprogress">
<div><span class="fundprogressbar_current">${{ page.devfund_balance }}</span><br>raised</div>
<div class="fundprogressbar_wrap">
<progress class="fundprogressbar" max="{{ page.devfund_goal }}" value="{{ page.devfund_balance }}"></progress>
<span class="fundprogressbar_percent">{{ page.devfund_balance | times: 100.0 | divided_by: page.devfund_goal | round }}%</span>
</div>
<div><span class="fundprogressbar_total">${{ page.devfund_goal }}</span><br>needed</div>
</div>
</div>

<p>
<a href="https://github.com/sponsors/bugzilla" class="button primary">Sponsor Us</a> with a monthly contribution towards this goal at GitHub Sponsors (GitHub account required).
</p>

<p>
<a href="https://liberapay.com/bugzilla/" class="button primary">Sponsor Us</a> with a monthly contribution towards this goal at Liberapay using any payment type Stripe will accept (credit, debit, etc). Stripe will deduct 2.9% + 30¢ from your contribution each month as a transaction fee.
</p>

<h4>General project fund</h4>

<p>Any money contributed to this fund will be used towards hiring a developer
to work on code or review submitted patches for one-off projects. Once enough
money collects to be worth funding a project, we'll have someone work on it.</p>

<p>Current projects we want to fund:</p>

<div class="fundwrapper">
<p>Fund a developer for 20 hours to work on release blockers for Bugzilla 5.2.1, 5.0.4.2, and 5.9.2</p>
<div class="fundprogress">
<div><span class="fundprogressbar_current">${{ page.b52rel_balance }}</span><br>raised</div>
<div class="fundprogressbar_wrap">
<progress class="fundprogressbar" max="{{ page.b52rel_goal }}" value="{{ page.b52rel_balance }}"></progress>
<span class="fundprogressbar_percent">{{ page.b52rel_balance | times: 100.0 | divided_by: page.b52rel_goal | round }}%</span>
</div>
<div><span class="fundprogressbar_total">${{ page.b52rel_goal }}</span><br>needed</div>
</div>
<p><b>This goal is funded, thank you!</b> A developer has been hired for this, look for progress soon!</p>
</div>

<div class="fundwrapper">
<p>Fund a developer for 80 hours to work on release blockers for Bugzilla 6</p>
<div class="fundprogress">
<div><span class="fundprogressbar_current">${{ page.b6rel_balance }}</span><br>raised</div>
<div class="fundprogressbar_wrap">
<progress class="fundprogressbar" max="{{ page.b6rel_goal }}" value="{{ page.b6rel_balance }}"></progress>
<span class="fundprogressbar_percent">{{ page.b6rel_balance | times: 100.0 | divided_by: page.b6rel_goal | round }}%</span>
</div>
<div><span class="fundprogressbar_total">${{ page.b6rel_goal }}</span><br>needed</div>
</div>
<p><b>This goal is funded, thank you!</b> This project will commence after the project for Bugzilla 5.2.1 et al completes.</p>
</div>

<p>Future projects will be decided once we get Bugzilla 6 released. There is also a possibility that Bugzilla 6 will require additional grants to complete.</p>

<p>Money currently available towards our next project (TBD) :</p>
<div class="fundprogress"><span class="fundprogressbar_current">${{ page.general_balance }}</span></div>

<p>
<a href="https://github.com/sponsors/bugzilla" class="button primary">Contribute</a> towards this goal at GitHub Sponsors (GitHub account required).
</p>
<p>
<a href="https://donate.stripe.com/eVadTl5xa53RcIEeUV" class="button primary">Contribute</a> towards this goal via Stripe (credit, debit, Apple Pay, CashApp). Stripe will deduct 2.9% + 30¢ from your contribution as a transaction fee.
</p>
<p>If you give via Stripe and want to cover the fee (completely optional), here's the formula: Take the amount you want us to get, add 30¢, then divide by 0.971.  For example, if you want us to get $100, add 30¢ to make 100.30, then divide by 0.971 and round it to two places after the decimal, which gives you $103.30. To verify it, subtract 2.9% to get 100.3043, round to two digits after the decimal to get 100.30, then subtract 30¢ to get $100.</p>

<h2>The Legal Stuff</h2>

<p>In mid-2023, a group of the core developers formed <a
href="/about/zarroboogs.html">Zarro Boogs Corporation</a> (ZBC) in order to be
a legal entity which could hold the license to the Bugzilla Trademark and raise
money on behalf of the project. ZBC is a non-charitable non-profit organization
(US Internal Revenue Code §501(c)(4) status), and registered as a
Non-Profit Corporation in the State of Michigan, which means we are required to
spend all money raised on the needs of the project, and not make a profit on
it. However, since we are not a charity, your donations will not be tax
deductible. The Bugzilla trademarks are used under license from the Mozilla
Foundation. ZBC is not affiliated with or owned by the Mozilla Foundation.</p>

