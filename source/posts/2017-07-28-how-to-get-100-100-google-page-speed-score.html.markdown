---
title: How to Get 100/100 Google Page Speed Score
date: 2017-07-28 12:26 MDT
tags: performance, speed, blogging, google, seo
published: false

---
### Everyone hates slow websites. Everyone likes fast websites.

I recently had to work on a Google AMP (Accelerated Mobile Pages) project, which was supposedly created to mitigate bloated websites from being at the top of Google results on their mobile web index. I personally think AMP is a [bad](https://danielmiessler.com/blog/google-amp-not-good-thing/#gs.co7smnc) [thing](https://www.theregister.co.uk/2017/05/19open_source_insider_google_amp_bad_bad_bad/) [to happen](https://daringfireball.net/linked/2017/01/17/schreiber-amp) to the internet, but that's beside the point of this article.

The point of this article is that you can get a better user experience by just building websites that are fast, and you don't need to use AMP. But if you wanted to (for SEO or whatever), the methods in this post could also be a good starting point for getting your pages into AMP with minimal effort.

I use the static site generator Middleman for the front end of the website you're currently reading, and host it on Digital Ocean on an Nginx server, so I'll give some examples of how I achieved the perfect score in the context of this blog and its stack.

### Google PageSpeed Insights

[Google PageSpeed Insights](https://developers.google.com/speed/pagespeed/insights/) is a tool Google provides to score the speed of a website based on specific metrics including:

1. Avoid landing page redirects
2. Eliminate render-blocking JavaScript and CSS in above-the-fold content
 - Solved by inlining all of a pages styles with build tools.
3. Enable compression
  - Solved by enabling gzip on the server and using build tools to gzip the files
4. Leverage browser caching
  - Solved by setting cache expirations on the server.
5. Minify CSS
  - Build tools, middleman or grunt or webpack
6. Minify HTML
  - Build tools, middleman or grunt or webpack
7. Minify JavaScript
  - Build tools, middleman or grunt or webpack
8. Optimize images
  - scale and shrink sizes here, but use image optimizers too, ezpz
9. Prioritize visible content
  - this one is some bullshit but uh just make it fast
10. Reduce server response time
  - have a fast server? do https

### Page size

Before getting into any of these rules in particular, lets talk about page size in general.
Make your codebase small. If you don't need all of Bootstrap's enormous CSS codebase loading on all your pages, use something lighter and customize up. If you don't need a bunch of JavaScript on your page, like for a blog, then don't put it on there. Having a few little fancy animations at the expense of hundreds of milliseconds is usually not worth it to a user. That said, if a core part of the brand or requirements put you in a place where heavy JavaScript is necessary, there are still strategies you can use to keep it slim and fast.

### Client and Server Control

One thing you'll need to get the 100/100 score is direct control of the front end assets and build tools around them. I used the static site generator Middleman to build this site with my configurations to increase the performance as much as possible. This website has virtually no JavaScript (other than the Squaresend plugin for email), but if I needed it I'd be handling it like the rest of my assets.

Additionally, you'll need full control of the server hosting your files. I use nginx on Digital Ocean when I want full control of my servers, and since it's just static files I don't actually have to setup a database or backend other than the nginx piece which is where a good chunk of the work here is.

### Breaking down the metrics

Let's get into some details now.

#### 1. Avoid landing page redirects
This first item is mostly self explanatory. You don't want to land on a page and redirect a user as much as possible. This is relatively common when a desktop site redirects to mobile, and it is very expensive in terms of performance. If possible, build a site that is mobile-first and responsive to prevent necessity of redirects to mobile versions of the site.

#### 2. Enable Compression
Here we already need control of the server.
