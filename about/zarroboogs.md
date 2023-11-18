---
title: "Zarro Boogs Corporation"
redirect_from:
- /zbc
- /about/zbc
board_positions:
- President
- Treasurer
- Secretary
- Board Member
---

<p>Zarro Boogs Corporation (ZBC) is a non-charitable non-profit organization
(US Tax Code §501(c)(4) status pending IRS approval), and registered as a
Non-Profit Corporation in the State of Michigan, which means we are required to
spend all money raised on the needs of the project, and not make a profit on
it. However, since we are not a charity, any donations will not be tax
deductible. The Bugzilla trademarks are used under license from the Mozilla
Foundation. ZBC is not owned by or affiliated with the Mozilla Foundation.</p>

<p>The name "Zarro Boogs Corporation" is a shout-out to the phrase returned by
Bugzilla when you run a search which returns no results, “Zarro Boogs found.”
The buggy spelling of “Zero Bugs” being intentional because it’s generally
believed that there’s no such thing as a project with zero bugs in it, only
bugs that haven’t yet been reported, thus, saying “Zero Bugs” is, in itself,
buggy. There’s a nice write-up of this on <a
href="https://en.wikipedia.org/wiki/Bugzilla#Zarro_Boogs">Wikipedia</a>.</p>

<p>ZBC was incorporated on July 19, 2023. The usage of the Bugzilla trademarks
were granted by the Mozilla Foundation on August 1, 2023. The formation of the
corporation was announced to the public on August 26, 2023, which was the 25th
anniversary of Bugzilla's first public release.</p>

## Board of Directors

The board of directors currently consists of the following people:

{% for board_position in page.board_positions %}
  {% assign profiles = site.developers | where_exp: "item", "item.board_position == board_position" %}
  {% include board-card.html list=profiles %}
{% endfor %}
