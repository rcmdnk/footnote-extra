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

Next, change a RDiscount dependence in `plugins/footnote.rb`、

``` diff
-ref_text = RDiscount.new("#{text}<a href='#fnref:#{@current_reference}' rev='footnote'>↩</a>").to_html
+ref_text = Kramdown::Document.new("#{text}<a href='#fnref:#{@current_reference}' rev='footnote'>↩</a>").to_html
```

Now you can use footnote-octopress and footnote-extra with Kramdown!.

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
at RDiscout, while Kramdwon can't distinguish normal lines and code block
if there is no empty line.

If you have written with RDiscount,
there are some places where Kramdown can't recognize correctly.
Please be careful even if you could generate w/o errors.

See [this blog](http://rcmdnk.github.io/blog/2013/10/12/blog-octopress-kramdown/)(Japanese) for more information.


