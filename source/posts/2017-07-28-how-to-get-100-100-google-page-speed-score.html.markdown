---
title: How to Get 100/100 Google Page Speed Score
date: 2017-07-28 12:26 MDT
tags: performance, speed, blogging, google, seo
published: false

---
### Everyone hates slow websites. Everyone likes fast websites.

Lately I've had to work on a Google AMP (Accelerated Mobile Pages) project, which was supposedly created to mitigate bloated websites from being at the top of Google results on their mobile web index. I personally think AMP is one of the [worst](https://danielmiessler.com/blog/google-amp-not-good-thing/#gs.co7smnc) [things](https://www.theregister.co.uk/2017/05/19open_source_insider_google_amp_bad_bad_bad/) [to happen](https://daringfireball.net/linked/2017/01/17/schreiber-amp) to the internet, but that's beside the point of this article.

The point of this article is that you can get a better user experience by just building websites that are fast, and you don't need to use AMP. But if you wanted to (for SEO or whatever), the methods in this post could be a good starting point for getting your pages into AMP with minimal effort.

### Google PageSpeed Insights

[Google PageSpeed Insights](https://developers.google.com/speed/pagespeed/insights/) is a tool Google provides to score the speed of a website based on some specific metrics including:

1. Avoid landing page redirects
2. Eliminate render-blocking JavaScript and CSS in above-the-fold content
 - Solved by inlining all of a pages styles with build tools.
3. Enable compression
  - Solved by enabling gzip on the server and using build tools to gzip the files
4. Leverage browser caching
  - Solved by setting cache expirations on the server.
5. Minify CSS
  - Build tools
6. Minify HTML
  - Build tools
7. Minify JavaScript
  - Build tools
8. Optimize images
  - scale and shrink sizes here, but use image optimizers too, ezpz
9. Prioritize visible content
  - this one is some bullshit but uh just make it fast
10. Reduce server response time
  - have a fast server?

Before getting into any of these rules in particular, lets talk about page size in general.
Make your site small.
