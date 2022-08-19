---
title: "Download"
permalink: /download/
intro: "Learn how to download, maintain, install and upgrade Bugzilla"
---

* Table of Contents
{:toc}

## How To Get Bugzilla

**By far best way to get, maintain and upgrade Bugzilla is as a checkout from the appropriate branch of our source code control system.** This is true of both stable and development versions. Instructions on how to do this are in the [Installation and Maintenance Guide](https://bugzilla.readthedocs.org/en/latest/installing/). That document also explains how to upgrade Bugzilla to a new version, move a Bugzilla installation between machines, and migrate from other bug-tracking systems.

{% assign current = site.releases | where: "mode", "current" | first %}

If you are installing a new Bugzilla, the latest stable release series (and so the one you should choose unless you have a good reason for doing otherwise) is the **{{ current.branch }}** series. You will need this information when following the installation instructions.

If you are upgrading, note that you can upgrade directly from _any_ old Bugzilla version to any new release—you do not have to go via the releases in between. You should upgrade to the latest stable series, **{{ current.branch }}**, and read the [Release Notes]({{ current.url }}#release-notes). If you want to know exactly what's changed from one version to the next, you can [view checkin logs]({{ current.url }}).

Bugzilla is licensed under the [Mozilla Public License 2.0](https://www.mozilla.org/MPL/2.0), and is thus both [free](http://www.gnu.org/philosophy/free-sw.html) and [open source](http://opensource.org/osd) software.

## Bugzilla Addons

For a list of programs that can enhance and interact with Bugzilla in various ways, see our [Addons list](https://wiki.mozilla.org/Bugzilla:Addons).

## Localized Versions

Bugzilla uses a template system and those templates can be translated into other languages. This is a list of currently-known localizations of the Bugzilla UI. These are third-party contributions, so if you need help with any of them, please contact the maintainer of the particular localization.

The short version of how to install/use these is at the end of the [Localization Guide](https://bugzilla.readthedocs.org/en/latest/localizing/index.html).

|Tag  |Language                      |4.4   |5.0  |6.0  |Maintainer|
|---  |---                           |---   |---  |---  |---       |
|bg   |Български език / Bulgarian    |4.4.13|5.0.6|     |Георги Д. Сотиров (Georgi D. Sotirov)|
|cs   |Čeština/Czech                 |4.4.x |5.0.x|     |Norbert Volf|
|de   |Deutsch / German              |4.4.11|5.0.2|     |Marc Schumann|
|es   |Español / Spanish             |      |     |     |Oscar Manuel Gómez Senovilla|
|fr   |Français / French             |4.4.12|5.0.3|5.1.1|Cédric Corazza|
|ja   |日本語 / Japanese              |4.4.11|5.0.2|     |Atsushi Shimono|
|pl   |Polski / Polish               |      |     |     |Aviary.pl team|
|ru   |Русский / Russian             |4.4.4 |     |     |Виталий Федрушков (Vitaly Fedrushkov), Alexander L. Slovesnik, Alexey Gladkov|
|zh_TW|繁體中文/ Chinese (Traditional)|4.4.11|5.0.2|     |Repeat Yang|

If you have additions or corrections for this list, please contact the [Bugzilla l10n team](https://wiki.mozilla.org/Bugzilla:L10n).

If your language is not listed here, do not give up. Look at the [list of all known localization efforts](https://wiki.mozilla.org/Bugzilla:L10n:Localization_Teams). Listed there are works in progress, older releases for unsupported Bugzilla versions, and orphaned projects. We don't advise using unsupported releases, but it may be a good place to start if you want to bring a localization up to date.

## Manual Downloads

Again, the best way to get Bugzilla is to follow the instructions in the [Installation and Maintenance Guide](https://bugzilla.readthedocs.org/en/latest/installing/), which use the 'git' version control system. However, if you do need to download a tarball, here they are:

{% include downloads.html %}

### Archives

If for some reason you need a very old version of Bugzilla, you can download tarballs from the [Bugzilla FTP site](https://ftp.mozilla.org/pub/mozilla.org/webtools/).
