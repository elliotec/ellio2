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
This first item is mostly self explanatory. You don't want to land on a page and redirect a user as much as possible. This is relatively common when a desktop site redirects to mobile, and it is very expensive in terms of performance. If possible, build a site that is designed mobile-first and responsive to prevent necessity of redirects to mobile versions of the site.

#### 2. Enable Compression
Here we already need control of the server. Since http supports sending compressed files over the network for faster transfers, we should take advantage of Gzipping everything we can before it gets sent to the browser. It's super easy to enable with nginx.

#### My global nginx.conf
```nginx
user www-data;
worker_processes auto;
pid /run/nginx.pid;

events {
	worker_connections 768;
}

http {

	##
	# Basic Settings
	##

	sendfile on;
	tcp_nopush on;
	tcp_nodelay on;
	keepalive_timeout 65;
	types_hash_max_size 2048;

	server_names_hash_bucket_size 128;

	include /etc/nginx/mime.types;
	default_type application/octet-stream;

	##
	# SSL Settings
	##

	ssl_protocols TLSv1 TLSv1.1 TLSv1.2; # Dropping SSLv3, ref: POODLE
	ssl_prefer_server_ciphers on;

	##
	# Logging Settings
	##

	access_log /var/log/nginx/access.log;
	error_log /var/log/nginx/error.log;

	##
	# Gzip Settings
	##

	gzip on;
	gzip_disable "msie6";

	 gzip_vary on;
	 gzip_proxied any;
	 gzip_comp_level 6;
	 gzip_buffers 16 8k;
	 gzip_http_version 1.1;
	 gzip_min_length 256;
	 gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript application/x-font-ttf font/opentype image/svg+xml image/x-icon;

	##
	# Virtual Host Configs
	##

	include /etc/nginx/conf.d/*.conf;
	include /etc/nginx/sites-enabled/*;
}
```
#### My website's nginx server conf
```nginx
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

server {
    # SSL configuration

    listen 443 ssl http2;
    listen [::]:443 ssl http2;
    include snippets/ssl-elliotec.com.conf;
    include snippets/ssl-params.conf;
	server_name elliotec.com www.elliotec.com;
    ssl on;

    location ~ /.well-known {
        allow all;
    }
	index index.html index.js;

    root /srv/www/elliotec.com/;
	location / {
		try_files $uri $uri/ =404;
	}

    error_page 404 /floatin-in-space/index.html;
    location = /floatin-in-space/index.html {
        root /srv/www/elliotec.com/;
        internal;
    }
    expires $expires;
}
```
