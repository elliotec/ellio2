---
layout: post
title:  Building This Site in Middleman
date:   2014-05-17 11:26:11
---

## Blogging platforms vs. static site generators

I had been looking around for a good way to get a portfolio site and blogging platform all in one that suited my tastes.

For a short time I looked into platforms such as [Ghost](https://ghost.org), [Medium](https://medium.com), and [Svbtle](https://svbtle.com).

I really liked the design, simplicity, and content-focus of those, but as a developer, I wanted something I could customize and design myself with minimal third-party interference.

Then I found [Jekyll](https://jekyllrb.com). I quickly realized that what I wanted was a "blog-aware" static site generator rather than a blogging platform alone. This would give me the ability to fully customize every aspect of my site while allowing me a place to write posts.

I had Jekyll installed and running on a development server in a minute or two. I was able to acquaint myself with the directory structure fairly quickly after going through the docs a bit and looking at some example sites - my favorite of which is [quaran.to](https://quaran.to), the personal blog of Nick Quaranto.

It uses the [Liquid Templating Engine](https://liquidmarkup.org/), which is a "Ruby library for rendering safe templates which cannot affect the security of the server they are rendered on." It looks remarkably like erb in Handlebars. It didn't take much getting used to, but I was slightly annoyed that a Ruby-driven framework wasn't just using erb.

In addition to that slight inconvenience, I had to use the pre-release version of Jekyll in order to have Sass and CoffeeScript support - not a huge deal until I found the hard way that if hosting on Github pages (one of Jekyll's major selling points), you are limited to the version they use.

So my options were:

- Write a Rake task that compiles Sass and CoffeeScript
- Use and configure plugins
- Wait for Jekyll 2.0 to be released and then Github Pages to adopt it
- Use a different generator

## Finding Middleman

I had all but given up on Jekyll when 2.0 was released. I was excited, but a bit disillusioned. I found out from [This Hacker News Post](https://news.ycombinator.com/item?id=7708142), and the top comment was the elusive solution to all my static site-generating problems: [Middleman](https://middlemanapp.com).

Middleman's file structure was immediately familiar and it's Rails-like atmosphere sold me instantly. erb instead of Liquid-Ruby-Handlebars? Check. Sass and CoffeeScript support out of the box? Check. Ability to host on Github Pages, Heroku, or any other production environment imaginable with little configuration? Check, check, and check.

Now I could finally get to the fun part and design my site. I came accross these two posts that were immensely helpful:

- [FajitaNachos's post entitled 'Goodbye Jekyll'](https://github.com/andrewholsted/fajitanachos.com/blob/source/source/posts/2013-08-10-Goodbye-jekyll.html.markdown)

- [Thoughtbot's post entitled 'Styling a Middleman Blog with Bourbon, Neat, and Bitters'](https://robots.thoughtbot.com/middleman-bourbon-walkthrough)

What you see here is the result of this process. In a future post, I'll describe some of the methodology I used in the site's creation and give some code samples and tips I found useful in it's development. In the meantime, check out the code on [my Github](https://github.com/elliotec/ellio2) if you wish.
