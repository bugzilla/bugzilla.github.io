---
title: "Installation List"
---

A large number of companies, organizations, and projects use Bugzilla. 
This page showcases a few particularly high-profile or otherwise interesting 
installations, and also contains a list of public Bugzillas.

## Full List

This page lists the {{ list.size }} companies, organizations, and projects
that we know of who are running "public" Bugzilla installations. A public
installation is one whose front or login page can be viewed over the
Internet. This is, of course, only a small fraction of the Bugzilla
installations out there - there are probably at least 10 times as many
private ones. We used to track those too, but we found spammers
were trying to use this page for SEO :-(.

If you or your company are using Bugzilla, your installation is "public" in
the sense defined above, and you would like to be listed, please file a pull
request against [the GitHub repo](https://github.com/bugzilla/bugzilla.github.io/tree/master/installation-list).
If you don't have a GitHub account, you can mail
[Dave](mailto:justdave&#64;bugzilla.org?subject=Bugzilla%20Installation%20List) with your requested listing.

(This list was last updated on September 27th, 2022;
[history](https://github.com/bugzilla/bugzilla.github.io/commits/master/_data/installation-list.csv)).

{% assign list = site.data.installation-list | group_by: "cat" %}

{% for item in list %}
### {% if item.name != "" %}{{ item.name }}{% else %}Others{% endif %}

{% include installation-list.html list=item.items %}

{% endfor %}
