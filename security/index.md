---
title: "Security Advisories"
meta:
- type: link
  tags: rel="alternate" href="https://www.bugzilla.org/security/atom.xml" type="application/atom+xml"
---

The Bugzilla team makes every effort to seal up any security holes as soon
as possible after they are found, and follow that up with a security release
and advisory. The following is a list of the security advisories that were
issued with each of our releases that included security-related fixes.
It's a very long list because Bugzilla is a mature project which has had
a long life, and has a development team which pays attention to security
vulnerabilities. As you will note, the frequency of security releases
has declined markedly in recent years, a fact about which we are very
happy.

<ul>
  {% assign sorted = site.security | reverse %}
  {% for advisory in sorted %}
  <li><a href="{{ advisory.url }}">[{{ advisory.date | date: '%Y-%0m-%0d' }}] Security advisory for versions
    prior to {{ advisory.versions | array_to_sentence_string }}</a></li>
  {% endfor %}
</ul>

