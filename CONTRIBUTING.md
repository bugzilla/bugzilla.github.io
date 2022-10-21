Hi,
Welcome to the contributing guide for the bugzilla.org website. We are very eager to take any and all contributions from you, and to aid you in successfully contributing to this codebase.

* [About](#about)
  * [Where is the code hosted?](#where-is-the-code-hosted)
  * [What are the technologies used?](#what-are-the-technologies-used)
  * [Get in contact with us!](#get-in-contact-with-us)
  * [Submitting changes](#submitting-changes)
* [Reporting Bugs](#reporting-bugs)
  * [Fixing Bugs](#fixing-bugs)
* [Setting up the development environment](#setting-up-the-development-environment)
* [How to update the data on the site](#how-to-update-the-data-on-the-site)
  * [Blog](#blog)
  * [Releases](#releases)
  * [Security Advisories](#security-advisories)
  * [Developer Profiles](#developer-profiles)
  * [Installation List](#installation-list)
  * [Socials](#socials)
  * [Navigation](#navigation)

# About

## Where is the code hosted?
You can find the canonical git repository here: <https://github.com/bugzilla/bugzilla.github.io/>

## What are the technologies used?
This is a [jekyll](https://jekyllrb.com/) based website, using the [Bugzilla theme](https://github.com/hellcp/jekyll-theme-bugzilla/).

## Get in contact with us!
We are available on various instant messaging platforms, as well as more traditional mailing list, use the links below to get in contact if you need or want to.

* Matrix: <https://matrix.to/#/#bugzilla:mozilla.org>
* IRC: <https://web.libera.chat/#/#bugzilla>
* Discord: <https://discord.gg/ZhN6uBA>
* Mailing Lists: <https://lists.bugzilla.org/listinfo/developers>

## Submitting changes
To submit changes for review, create a pull request on the [site's GitHub](https://github.com/bugzilla/bugzilla.github.io/), if your PR contains UI changes, please include a screenshot before and after, so that it's easier for us to review the changes.

# Reporting Bugs
Bugs in this repo need to be reported to the Mozilla Bugzilla under `Bugzilla` product and `bugzilla.org` component.
You can do so here: https://bugzilla.mozilla.org/enter_bug.cgi?component=bugzilla.org&product=Bugzilla

## Fixing Bugs
The link below lists all the currently reported bugs against the `bugzilla.org` component on Mozilla Bugzilla.
https://bugzilla.mozilla.org/buglist.cgi?product=Bugzilla&resolution=---&component=bugzilla.org&list_id=16192324
Those bugs still need fixing and we would appreciate any pull requests fixing them.

# Setting up the development environment
You will need to install `git`, `ruby`, `gem` and `bundler` first, then, to gather the remaining dependencies, run:

```sh
git clone https://github.com/bugzilla/bugzilla.github.io
cd bugzilla.github.io
bundle config set path 'vendor/bundle'
bundle install
```

To build the site, run
```sh
bundle exec jekyll build
```

To serve the site on your local machine, run:
```sh
bundle exec jekyll serve
```
and visit <http://127.0.0.1:4000/> to see it in your browser

# How to update the data on the site
Various parts of this site are stored as data used for generation of pages. This section of the guide explains how to update those.

## Blog
Pages for the blog are stored under `_posts` directory.

To create a new post, create a file called `yyyy-mm-dd-kebab-case-title.md`, replacing the parts to fit the contents, and fill it out as lined out below:

```yaml
---
title: Title of the post
date: 2022-08-28
author: justdave # Nickname from _developers, or don't include author line at all to make it display "Bugzilla Developers" instead
categories:
- Releases
- Security
---
The post content in __Markdown__
```

## Releases
Pages for the release information are stored under `_releases` directory.

To create a new release, create a file called `x.y.z.html`, replacing the parts to fit the contents, and fill it out as lined out below:

```yaml
---
version: # Release tag name in vcs
branch: # Branch in the vcs
date: # Date of release tag in vcs
advisory:
- version: # Version in the branch for which the advisory was released
  url: # Filename version for advisory in _security
mode: # {trunk,current,old} currently maintained branch (remove the line from the unmaintained releases!)
rc: # {True,False} You can also just remove the line when unused
---
Contents of the Release Notes
```

## Security Advisories
Pages for the security advisories are stored under `_security` directory.

To create a new release, create a file called `x.y.z.md`, replacing the parts to fit the contents, and fill it out as lined out below:

```yaml
---
title: "x.x.x, y.y.y and zzz Security Advisory" # vulnerable versions
versions: ["x.x.x+1", "y.y.y+1", "z.z.z+1"] # array of fixed versions
date: yyyy-mm-dd
bugs:
- summary: |-
    A short summary
  class: Type of a security vulnerability
  affected: Bugzilla x.x.x, y.y.y and zzz
  fixed-in: x.x.x+1, y.y.y+1 and zzz+1
  description: |-
    A long description
  references: https://bugzilla.mozilla.org/show_bug.cgi?id=xxx
  cve: CVE-yyyy-xxxx
  reported-by: Reporter
  fixed-by: Fixer
---
```

## Developer Profiles
Pages for the developer profiles are stored under `_developers` directory.

```yaml
---
nickname: # Nickname
firstname: # First name
lastname: # Last name
image: # File located under /assets/img/developers/
irc: # IRC nickname
location: # City, State (if applicable), Country
dayjob: # Current dayjob
role: # Role within Bugzilla
former: # Shows up to note that they are no longer doing their function and labels them as former developers
---
```

## Installation List
Installation list is stored in `_data/installation-list.csv`.

```csv
"name","orgurl","bzurl","cat","logo"
"Organization Name","URL for the main page of the organization","URL for the Bugzilla of the organization","Optional category","Optional logo to show up on the homepage (_includes/free-software-logos/*.svg)"
```

## Socials
Social media and contact list is stored in `_data/socials.csv`.

```csv
"name","icon","url"
"Name of the social media","Icon for the social media (_includes/icons/)","URL for the social media"
```

## Navigation
Navigation is stored in `_data/nav.yml`.

```yaml
- link: # URL for the page
  title: # Display more info on hover
  name: # Display name
  links: # An array of subitems
  - link: # URL for the subitem
    title: # Display more info on hover on the subitem
    name: # Display name for the subitem

```

## Thank you for considering contributing!