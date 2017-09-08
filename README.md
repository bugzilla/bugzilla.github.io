# www.bugzilla.org #

This is the code for the www.bugzilla.org website. It uses Github Pages,
and so both Jekyll and the Liquid template engine.

## Editing Files ##

Files with a .html extension can be processed by the templating engine but
can't have Markdown syntax. Files with a .md extension can have Markdown
syntax (which also permits embedded HTML).

Jekyll's templating engine is Liquid. Reference:
https://github.com/Shopify/liquid/wiki/Liquid-for-Designers

Here are the available template variables:
https://jekyllrb.com/docs/variables/

Markdown syntax reference:
https://daringfireball.net/projects/markdown/syntax

A file needs to have YAML Front Matter to be processed by the templating
engine (and so to have e.g. the bugzilla.org header, footer and nav applied).
Front Matter looks like this at the top of the file:

```
---
title: "My Page Title"
---
```

Other parameters, or no parameters, can go between the three dashes.
 
## Local Development ##

If you want to test this site locally before deploying it, you will need to
set up a local instance of Jekyll. See:

https://help.github.com/articles/setting-up-your-github-pages-site-locally-with-jekyll/

The magic incantation to run the local server is:

`bundle exec jekyll serve`

Then visit:

`http://127.0.0.1:4000/`
