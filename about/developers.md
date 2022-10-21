---
title: "Developer Profiles"
permalink: /about/developers/
redirect_from:
- /developers/profiles
---

Bugzilla's development team consists or has consisted of the following
individuals. If you feel that
you should be on this list but aren't or have any additions/corrections, please
[file a request](https://bugzilla.mozilla.org/enter_bug.cgi?bug_file_loc=http%3A%2F%2Fwww.bugzilla.org%2Fdevelopers%2Fprofiles.html&bug_severity=normal&comment=Erase%20this%20and%20enter%20your%20changes%20or%20information%20here.%20%20You%20can%20upload%20your%20photo%20as%20an%20attachment%20if%20you%27re%20adding%2Fchanging%20a%20photo.%20%20Don%27t%20forget%20to%20update%20the%20summary%20above%21&component=bugzilla.org&op_sys=All&product=Bugzilla&rep_platform=All&short_desc=Add%2FUpdate%20info%20for%20%3Cchange%20this%20to%20your%20name%3E%20on%20the%20Developer%20Profiles&target_milestone=---&version=unspecified)
or a direct
[pull request](https://github.com/bugzilla/bugzilla.github.io).

## Current Developers

<ul>
{% for profile in site.developers %}
  {% if profile.former == False %}
  <li><a href="{{ profile.url }}">{{ profile.firstname }} {{ profile.lastname }} ({{ profile.nickname }})</a></li>
  {% endif %}
{% endfor %}
</ul>

## Former Developers

<ul>
{% for profile in site.developers %}
  {% if profile.former != False %}
  <li><a href="{{ profile.url }}">{{ profile.firstname }} {{ profile.lastname }} ({{ profile.nickname }})</a></li>
  {% endif %}
{% endfor %}
</ul>

We'd also like to thank [Dave Shea](http://mezzoblue.com/) for designing the Bugzilla logo.
