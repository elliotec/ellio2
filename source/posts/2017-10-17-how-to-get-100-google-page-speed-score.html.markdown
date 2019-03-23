---
title: How to Get 100/100 Google Page Speed Score with Middleman and Nginx
date: 2017-10-17 12:01 MDT
tags: performance, speed, blogging, google, seo
published: true
---

### Everyone hates slow websites. Everyone likes fast websites.

I recently worked on a Google AMP (Accelerated Mobile Pages) project, which was created to mitigate bloated websites from being at the top of Google results on their mobile web index. I personally think AMP is a [bad thing](https://danielmiessler.com/blog/google-amp-not-good-thing/) [for us](https://daringfireball.net/linked/2017/01/17/schreiber-amp) but that's beside the point of this article.

The point of this article is that you can get a better user experience by just building websites that are fast, and you don't need to use AMP. But if you wanted to, the methods in this post could also be a good starting point for getting your pages into AMP with minimal effort.

I use the static site generator Middleman for the front end of the website you're currently reading, and host it on a Digital Ocean Droplet in an Nginx server, so I'll give some examples of how I achieved the perfect score in the context of this blog and its stack.

### Google PageSpeed Insights

[Google PageSpeed Insights](https://developers.google.com/speed/pagespeed/insights/) is a tool Google provides to score the speed of a website based on specific metrics including:

- Avoid landing page redirects
- Eliminate render-blocking JavaScript and CSS in above-the-fold content
- Enable compression
- Leverage browser caching
- Minify CSS
- Minify HTML
- Minify JavaScript
- Optimize images
- Prioritize visible content
- Reduce server response time

I wanted a fast website, and I like to get 100% on things occasionally, so I set out on a quest to get elliotec.com the 100/100 score. So I got it. Now I'm going to tell you how to get it.

<a href="https://developers.google.com/speed/pagespeed/insights/?url=https%3A%2F%2Felliotec.com">
    <img src="../images/pagespeed.png"/>
</a>

### Page size

Before getting into any of these rules in particular, lets talk about page size in general.
Make your codebase small. If you don't need all of Bootstrap's enormous CSS codebase loading on all your pages, use something lighter and customize up. If you don't need a bunch of JavaScript on your page, like for a blog, then don't put it on there. Having a few little fancy animations at the expense of hundreds of milliseconds is usually not worth it to a user. That said, if a core part of the brand or requirements put you in a place where heavy JavaScript is necessary, there are still strategies you can use to keep it slim and fast.

### Client and Server Control

One thing you'll need to get the 100/100 score is direct control of the front end assets and build tools around them. I used the static site generator Middleman to build this site with my configurations to increase the performance as much as possible. This website has virtually no JavaScript (other than the Squaresend plugin for email), but if I needed it I'd be handling it like the rest of my assets. [Here's the link to my full Middleman config.rb](https://github.com/elliotec/ellio2/blob/source/config.rb) for your reference.

Additionally, you'll need full control of the server hosting your files. I use Nginx on Digital Ocean when I want full control of my servers, and since it's just static files I don't actually have to setup a database or backend other than the Nginx piece which is where a good chunk of the work here is.

### Breaking down the metrics

Let's get into some details now.

##### Avoid landing page redirects
This first item is mostly self explanatory. You don't want to land on a page and redirect a user as much as possible. This is relatively common when a desktop site redirects to mobile, and it is very expensive in terms of performance. If possible, build a site that is designed mobile-first and responsive to prevent necessity of redirects to mobile versions of the site.

##### Enable Compression
Here we already need control of the server. Since http supports sending compressed files over the network for faster transfers, we should take advantage of gzipping everything we can before it gets sent to the browser. It's super easy to enable with Nginx and Middleman. In my global nginx.conf, I have:

```text
#nginx.conf

http {
    sendfile on;
    types_hash_max_size 2048;
    server_names_hash_bucket_size 128;
    include /etc/nginx/mime.types;
    default_type application/octet-stream;

    gzip on;
    gzip_disable "msie6";
    gzip_vary on;
    gzip_proxied any;
    gzip_comp_level 6;
    gzip_buffers 16 8k;
    gzip_http_version 1.1;
    gzip_min_length 256;
    gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript application/x-font-ttf font/opentype image/svg+xml image/x-icon;
}
```

And in my Middleman config:

```ruby
# config.rb
configure :build do
  activate :gzip
end
```

#### Leverage browser caching
Caching allows the browser to keep downloaded assets for a set period of time so that it doesn't have to keep downloading the same files over and over. This is again quite easy to do with Nginx by setting expirations for different filetypes, like how I have in my local nginx.conf for this website:

```text
#expiry map
map $sent_http_content_type $expires {
    default                     off;
    text/html                   epoch;
    text/css                    max;
    application/javascript      max;
    application/x-font-ttf      max;
    application/x-font-otf      max;
    application/font-woff       max;
    application/font-woff2      max;
    ~image/                     max;
}

server {
	listen 80;
	listen [::]:80;
	server_name elliotec.com www.elliotec.com;
    expires $expires;
    return 301 https://$server_name$request_uri;
}
```
You can also ensure you are caching only files that haven't changed by setting unique asset hashes on the filenames, which is done in Middleman with a simple addition to the build config like so:

```ruby
# config.rb
configure :build do
  activate :asset_hash
end
```

#### Minify assets
One of the more well known and simple page speed strategies is minifying your assets. Having a build step that minifies your HTML, CSS, and JavaScript is essential in modern web development, but it gets skipped a lot. You can drastically decrease your bundle sizes with minification. In Middleman, all you have to do is put a couple lines in your `config.rb` to do the work for you, like this:

```ruby
# config.rb
configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :minify_html
end
```

The CSS and JS minification comes free with Middleman, but you'll have to add `gem middleman-minify-html` for the HTML piece which you definitely want even though it wont be giving you as large of gains as the other assets.

#### Optimize images
Images are usually the most expensive files for a browser to download as far as size and speed, so this is one of the areas that you can get some of the most performance gains for the effort. To start out, you'll usually want to have images at their lowest viable size and quality. Tools like Photoshop have the ability to do a lot of powerful work around this, but you can optimize them even more in a build step using a tool like imageoptim. Of course with Middleman this is pretty effortless. First you'll want to add `gem 'middleman-imageoptim', git: 'https://github.com/plasticine/middleman-imageoptim', branch: 'master'` to your gemfile, then:

```ruby
# config.rb
configure :build do
  activate :imageoptim
end
```
Nice, you just shaved a ton of weight off those heavy images.

#### Reduce server response time
Google has a pretty strict threshold on the acceptable server response time - keep it under 200ms. For a static site like this, that is basically a non-issue. If I were hosting dozens of server blocks on this same Digital Ocean Droplet, they could be fighting for resources and slowing things down so I wouldn't recommend that. If you have a backend doing DB queries and such, there are numerous other reasons why your server could be slower than the 200ms threshold and you'll definitely want to spend time analyzing and improving that.

#### Prioritize visible content
Prioritizing visible content means that the above-the-fold content should be small enough in size to not require additional round trips to the server in order to render. This can be done by doing things like loading third party scripts later, and generally keeping the above-the-fold content small and fast. A lot of the other items in here will help with this, but sometimes it's really difficult to get this one perfect, especially if you have images as the initial visible content.

#### Eliminate render-blocking JavaScript and CSS in above-the-fold content
This is probably the trickiest item on the list, and it's related to the previous one. There are a few strategies I used to get this one to pass. One, if you require third party JavaScripts or add the `async` attribute to all `script` tags like this: `<script async src="main.js">`, so that external JavaScript files aren't blocking the loading and rendering of the other content and load asynchronously.

Then, inline your CSS and JS instead of making external resource calls to them. Doing this by hand would be terrible and ugly, but we have tools to do this for us. There's a couple steps to get all your assets inlined on your pages.

- You'll first need to add sprockets (`gem 'middleman-sprockets'`) to your app because we are hijacking Middleman's asset pipeline.
- Then in your `config.rb` add the `inline: true` hash to each minify build step like this:

```ruby
# config.rb
configure :build do
  activate :minify_css, inline: true
  activate :minify_javascript, inline: true
end
```

- Last, in your layout template where you pull in your CSS (wherever your `<head>` tag is probably):

```html
<style><%= sprockets.find_asset('site').to_s %></style>
```
and likewise for any scripts you want to inline, in `<script>` tags of course.

Finally, I was having a lot of trouble getting the Google Analytics script on my site to not be render-blocking. It was the last thing on the list that I hadn't achieved, and I was pretty annoyed that I wasn't seeing that 100/100 score. Since my real goal was the number, and it was clear that my site was pretty fast already, [I found a silly hack online](https://stackoverflow.com/questions/29162881/pagespeed-insights-99-100-because-of-google-analytics-how-can-i-cache-ga) to trick the Page Speed Insights tool to ignore the Google Analytics script. If they can contradict themselves I figure I can do this, and You Can Too!

```javascript
if(navigator.userAgent.indexOf("Speed Insights") == -1) {
// Your Google Analytics Code Here
}
```

### All done!

There ya go. If you followed the instructions in this post for your own self-hosted static site, you'll get 100/100 score on Google Page Speed.
The speed is what matters and that's good for everyone using your website, and it's also gotta be good for some SEO, right?


Join the discussion [on Hacker News](https://news.ycombinator.com/item?id=15516957).

_Update 2018-01-26_: This post has been translated into Russian at [HowToRecover.me](https://howtorecover.me/kak-polucit-pokazatel-skorosti-google)
_Update 2019-3-23_: This post has also been translated into [Uzbek](https://flyclipart.com/uz-middleman-va-nginx-100-ball) by [Transparent Cliparts](https://flyclipart.com)

