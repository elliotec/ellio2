---
title: Building a non-boring 404 page with CSS animations
date: 2018-10-12 11:17 MDT
tags: 404, CSS, animations
published: true
---

# [Check out the 404 page in action](https://elliotec.com/floatin-in-space)

## Every site should have a custom 404 page

Don't you hate it when you hit a dead end on a website and you get the ugly and menacing default 404 page? Well I do.
I wanted to make a 404 page that wasn't boring but also not too gimmicky. There are [a bunch of clever ideas for these error pages](https://blog.hubspot.com/blog/tabid/6307/bid/33766/10-clever-website-error-messages-from-creative-companies.aspx), so I thought I'd throw in my own take.

## CSS animations are hard

I'd been a front end developer for a while, but hadn't spent much time with CSS animations and they always seemed like a good skill to have at least a baseline knowledge of. Most of the applications I've developed haven't needed much animation aside from a little transition here and there or using a JS library so I wanted to learn how they worked in raw CSS. The 404 page was the perfect opportunity. Turns out they're more complex than I expected!

I didn't really have any ideas on what I wanted to do, so I just started drawing a face in CSS. Another thing I hadn't done before was create "art" with just HTML and CSS so this was really interesting to me if still very rudimentary. After drawing the face, I wanted to see how I could animate it making facial expressions. That was not easy. I had big ambitions to make the face smile and frown and laugh and cry, but I ended up keeping it simple and having them open and close their mouth in the form of saying "wow," while shifting their eyes around.

Then I needed a background. I looked up something like "space CSS animations" and found something to go off of that I could create the illusion of flying through the stars.

Then it all came together and I animated the face bouncing around the screen, flying through space going in and out of view using different transition techniques. It was fun and funny! So here's how I did it.

## The routing

First, I had to make sure that any page that is not found will redirect to this page. It's pretty straight forward with Nginx.

In `/etc/nginx/sites-available/elliotec.com`:

```conf
server {
  # a bunch of other config in here...

  location / {
    try_files $uri $uri/ =404;
  }

  error_page 404 /floatin-in-space/index.html

  location = /floatin-in-space/index.html {
    root /srv/www/elliotec.com/;
    internal;
  }
}
```

## The project code

In `elliotec.com/floatin-in-space/index.html`:

```html
<style>
  body{
    background: black;
  }
  .headwrap {
    padding: 1em;
    -webkit-animation: shrink 8s ease-in-out infinite alternate both;
  }
  .head {
    height: 30em;
    width: 25em;
    border: 1px solid black;
    border-radius: 50%;
    background-color: #ffe0bd;
    -webkit-animation: spin 7s linear infinite;
    margin: 0 auto
  }
  .right-eye, .left-eye {
    height: 3em;
    width: 3.5em;
    border: 1px solid black;
    border-radius: 50%;
    position: relative;
    background-color: white;
    -webkit-animation: bounce .5s ease-in-out infinite Alternate both;
  }
  .right-eye {
    top: 8em;
    left: 6em;
  }
  .left-eye {
    top: 5em;
    left: 15em;
  }
  .left-pupil, .right-pupil{
    height: .6em;
    width: .6em;
    background: black;
    border-radius: 50%;
    position: relative;
    top: 1em;
    left: 1em;
  }
  .nose {
    position: relative;
    margin: auto;
    top: 7em;
    width: 4em;
    height: 3em;
    transform: rotate(95deg);
    -webkit-transform: rotate(95deg);
    border-right: 1px solid black;
    border-bottom: 1px solid black;
  }
  .mouth{
    height: 1em;
    width: 11em;
    border-radius: 50%;
    border: 1px solid black;
    position: relative;
    top: 11em;
    left: 7em;
    background: black;
  }
  @media (min-width: 700px){
      .mouth{
          -webkit-animation: open 2s ease-in infinite Alternate both;
      }
      section {
          -webkit-animation: rise 5s linear infinite alternate;
      }
  }
  @-webkit-keyframes bounce{
    0% {
      transform: scale(.7);
      -webkit-transform: scale(.7);
    }
    50%{
      transform: scale(1.3);
      -webkit-transform: scale(1.3);
    }
    100%{
      transform: scale(1);
      -webkit-transform: scale(1);
    }
  }
  @-webkit-keyframes shrink{
    100%{
      transform: scale(.01);
      -webkit-transform: scale(.01);
    }
  }
  @-webkit-keyframes open{
    0%{
      height: .5em;
    }
    50%{
      height: 5em;
    }
    100%{
      height: 8em;
    }
  }
  @-webkit-keyframes spin{
    100%{
      -webkit-transform: rotate(360deg);
    }
  }
  @-webkit-keyframes rise{
    from {
      margin-top: 0;
      margin-left:-80%;
    }
    to {
      margin-top: 50%;
      margin-left: 80%;
    }
  }

  body, section, .stars {
    overflow: hidden;
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
  }

  .stars {
    background: radial-gradient(2px 2px, #ddd, rgba(0,0,0,0));
    background-size: 200px 200px;
    animation: zoom 4s infinite;
    opacity: 0;
  }

  .stars:nth-child(1) {
    background-position: 50% 50%;
    animation-delay: 0s;
  }
  .stars:nth-child(2) {
    background-position: 20% 60%;
    animation-delay: 1s;
  }
  .stars:nth-child(3) {
    background-position: -20% -30%;
    animation-delay: 2s;
  }
  .stars:nth-child(4) {
    background-position: 40% -80%;
    animation-delay: 3s;
  }
  .stars:nth-child(5) {
    background-position: -20% 35%;
    animation-delay: 4s;
  }

  @keyframes zoom {
    0% {
      opacity: 0;
      transform: scale(0.5);
      animation-timing-function: ease-in;
    }
    85% {
      opacity: 1;
      transform: scale(2.8);
      animation-timing-function: linear;
    }
    100% {
      opacity: 0;
      transform: scale(3.5);
    }
  }
</style>
<body>
  <div class="stars"></div>
  <div class="stars"></div>
  <div class="stars"></div>
  <div class="stars"></div>
  <div class="stars"></div>
  <div class="stars"></div>
  <section>
    <div class="headwrap">
    <div class="head">
      <div class="right-eye">
        <div class="right-pupil"></div>
      </div>
      <div class="left-eye">
        <div class="left-pupil"></div>
      </div>
      <div class="nose"></div>
      <div class="mouth"></div>
    </div>
    </div>
  </section>
</body>
```

And that's it. Good times.
