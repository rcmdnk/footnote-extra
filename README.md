footnote-extra
==============

Footnote plugin for Octopress (Jekyll).

This plugin requires parser which has an extension of
[PHP Markdown Extra](http://michelf.ca/projects/php-markdown/),
such [Kramdown](http://kramdown.rubyforge.org/)
or [RDiscount (>=2.0.7)](http://dafoster.net/articles/2013/02/02/rdiscount-2.0.7-released/).

This plugin can live with
[footnote-octopress](https://github.com/fcy/footnote-octopress).
JavaScript was forked from this plugin.

Although you can't use footnote-octopress and footnote-extra
in the same post,
you can use each plugin in different posts in the same blog.

# Installation at Octopress

1. Copy `plugins/footnote_extra.rb`
   to your `plugins` directory.

1. Install JavaScript.
   If you have already installed footnote-octopress,
   you may already have `source/javascripts/footnote.js`.

   Otherwise, copy `source/javascripts/footnote.js` to your
   `source/javascripts/` directory,
   and add a line:

    `<script src="{{root_url}}/javascripts/footnote.js"></script>`

   to `source/_includes/custom/head.html`.

1. Install SCSS.
   As same as JavaScript,
   you may already have `sass/plugins/_footnote.scss`,
   or `source/custom/footnote.js`.

   Otherwise, copy `sass/plugins/_footnote.scss`
   to your `sass/plugins/` directory.

   If you have old octopress
   (if your `sass/screen.scss` doesn't have `@import "plugins/**/*";`),
   you may need to add

    `@import "footnote"`

   to `sass/plugins/_plugins.scss`.

Done!

# Usage
You can use footnote-extra like Latex's `footnote`.

Write `{%fnex%}`-`{%endfnex%}` or `{%footnote_extra%}`-`{%endfootnote_extra%}`
at where you want to add a footnote.

e.g.)

    This is a footnote test{%fnex%}This is footnote.{%endfnex%}.

You can also use code syntax with indent:

    This is a footnote test with code
    {%fnex%}Code test:
    
        This is a code.
    
    This is a normal line.
    
    And `inline code`.
    {%endfnex%}.

:warning: These multi-line descriptions work well with Kramdwon,
while RDiscount may not work well with them.

Reference numbers for each footnote are assigned automatically,
so that you don't need to fix numbers by yourself
when you want to insert new footnote before other footnotes.


Finally, add a following line in the end of the post:

    {%footnotes_extra%}

or

    {%footnotes_list_extra%}



# Options
Change footnote styles in `sass/plugins/_footnote.scss` as you like.
footnote-extra's `_footnote.scss` may be useful
even if you already have `_footnote.scss` from footnote-octopress.

# Tips: RDiscount to Kramdown at Octopress
Kramdwon has many useful extensions,
but it is very preferable especially
if you've met errors of invalid UTF-8 with RDiscount.

If you've not installed Kramdown, add

    gem 'kramdown'

to Gemfile and do `bundle install`.
(If you installed recent `jekyll` with bundler, `kramdown` should also have been installed in the same time.)

Then, update `_config.yml`'s markdown setting:

``` diff
diff --git a/_config.yml b/_config.yml
index 74d35ba..f9c2cee 100644
--- a/_config.yml
+++ b/_config.yml
@@ -33,12 +33,7 @@ destination: public
 plugins: plugins
 code_dir: downloads/code
 category_dir: blog/categories
-markdown: rdiscount
-rdiscount:
-  extensions:
-    - autolink
-    - footnotes
-    - smart
+markdown: kramdown
 pygments: false # default python pygments have been replaced by pygments.rb
```

One of important points is that you can't use Triple-Backtick
Code Block with Kramdown.
But you can use Fenced Code Block of PHP Markdown Extra.

If you used `Table Of Contents`(`generate_toc`) of RDiscount,
you can use Kramdown's TOC like (w/o extensions):

    * Table Of Contents
    {:toc}

Another annoying point is that Kramdown is more sensitive to
the empty line around Markdown syntax than RDiscount.

You need to give an empty line before and after:

* Indented Code Block
* Reference with `>`

and before:

* Headers (`#`, `##`,... especially when `##` is used soon after `#`)
* Horizontal Rules (`---`, `***`, `- - -`... and even `<hr>`)
* List (`*`)

At least such Indented Code Clock can be written w/o empty lines
at RDiscout.

If you have written with RDiscount,
there are some places where Kramdown can't recognize correctly.
Please be careful even if you could generate w/o errors.

See [this blog](http://rcmdnk.github.io/blog/2013/10/12/blog-octopress-kramdown/)(Japanese) for more information.


