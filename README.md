footnote-extra
==============

Footnote plugin for Octopress (Jekyll).

This plugin requires parser which has an extension of
[PHP Markdown Extra](http://michelf.ca/projects/php-markdown/),
such [Kramdown](http://kramdown.rubyforge.org/)
or [RDiscount (>=2.0.7)](http://dafoster.net/articles/2013/02/02/rdiscount-2.0.7-released/).

:warning: If you use persers which doesn't support PHP Markdown Extra,
you can use `footnote_inline.rb`. See [below](https://github.com/rcmdnk/footnote-extra#for-non-php-markdown-extra-users-inline).

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

In the post you want to use footnote-extra,
do not use any footnote-octopress tags or PHP Markdown Extra's
footnote syntax itself.


Finally, add a following line in the end of the post:

    {%footnotes_extra%}

or

    {%footnotes_list_extra%}

It is useful to add

    post.puts "{%footnotes_extra%}"

to the end of `new_post` task in Rake file.

`{%footnotes_extra%}` does nothing if there is no
`{%fnex%}`(`{%footnote_extra%}`)
in the post.
In this case, it is no probrem even if there is footnote-octopress tag 
or PHP Markdown Exra footnote syntax in the post.

# For non PHP Markdown Extra users

Copy `plugins/footnote_inline.rb` instead of `footnote_extra.rb` to your `plugins` directory.

If you are using persers other than Kramdown, please modify
around line 15 of `footnote_inline.rb` for `to_html` function.
For RDiscount, just change the comment line:

``` diff
-#note = RDiscount.new(super).to_html
-note = Kramdown::Document.new(super).to_html
+note = RDiscount.new(super).to_html
+#note = Kramdown::Document.new(super).to_html
```

An usage is similar as `footntoe_extra`.

Use `{%fnin%}`-`{%endfnin%}` or `{%footnote_inline%}`-`{%endfootnote_inline%}`
instead of `fnex` or `footnote_extra`.

And use `{%footnotes_inline%}` or `{%footnotes_list_inline%}`
instead of `{%footnotes_extra%}` or `{%footnotes_list_extra%}`.


# Options
Change footnote styles in `sass/plugins/_footnote.scss` as you like.
footnote-extra's `_footnote.scss` may be useful
even if you already have `_footnote.scss` from footnote-octopress.

