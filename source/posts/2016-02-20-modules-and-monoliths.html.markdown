---
published: true
title: Modules and Monoliths
layout: post
date: 2016-02-20 20:06 MST
tags: specialization full-stack development rapid modules monoliths opinion
---

_"Jack of all trades, master of none -- though oftentimes better than
master of one." - Someone_

## The Full Stack Developer

Those words are met with controversy in the industry.

 A lot of developers are quite annoyed with the term. They argue that it
 isn't possible to be truly full stack, whatever their definition of
 "truly" might be.

They believe that mastery of a specific skill set within a software
stack is more valuable than being decent at all of it. This can be true,
especially in large corporations and enterprise systems with hundreds of
developers that are assigned specific tasks and siloed by their
specialization.

Mastering one specific language or piece of the stack certainly has many
benefits. Masters of JavaScript have tons of knowledge about the quirks of
the language and clever ways to get complex UIs to do their and the user's
bidding. Likewise with DBAs and data architects on the other side;
structuring huge amounts of data and connecting the data by its
relationships is quite an impressive feat.

But if the JavaScript master had to analyze and structure and join and
relate tables, she feels out of her element and may seize up citing
ignorance in all things non-JavaScript. The DBA might say, "this isn't
SQL." And leave.

Some people take the love and science of the craft very seriously and
aspire to reach sensei-level software mastery, and think this usually
requires a specialization to get anywhere.

But looking at examples like David Hienemer Hansson and
hundreds of other startup founders and programming legends, we can see
that gaining that level of knowledge of the full stack is attainable and
accessible and rewarding.

People can be modules or monoliths. Many choose specialization and corner themselves as "JavaScript Developers" or "Rails Developers." My advice is to stay away from this and keep your options open with something like "software developer," highlighting your experience in your preferred fields without removing yourself from opportunities to grow and gain new technical skills.

[Some of the best career advice I've read came from Scott Adams which says that in order to become extraordinary, you have two paths:](https://dilbertblog.typepad.com/the_dilbert_blog/2007/07/career-advice.html)

1. Become the best at one specific thing.
2. Become very good at two or more things.

The first is almost impossible, so I'll be sticking to the second.

People often tout the "T-shaped" metaphor for one's skill levels,
meaning that they have expertise in a vertical and the horizontal is the
broad but lesser knowledge of other disciplines. I agree with this, and
don't see why it can't be more common for someone to have an engineering
vertical with for example, a strong business/operations/etc. horizontal.
It's definitely a thing, tons of successful founders of companies do
exactly that. So why are the developers in the front end community
isolating themselves into their own little specializations and modules
that they spend lots of time learning and configuring?

## The Full Stack Framework

This is why I still love [Ruby on Rails](https://rubyonrails.org), which turned 10 this year.

Rails created a layer of abstraction that eliminated much of
the monotony, repetition, and difficult integrations that web development
requires. Building, integrating, and distributing packages of
functionality (gems) became a breeze. It made developing rich applications
on the web much more accessible to people with or without programming
skills, and drastically increased the speed of doing so.

I hear a lot of people that don't like Rails give their primary reason for disliking it as "It's just too much magic." What the hell is that supposed to mean!? Who doesn't love magic? Why would you want to waste time configuring things and wiring up stuff under the hood when you can scaffold and ship a product much sooner? Rails was built to remove the repetition of common architecture patterns, and did it very well. It baffles me that people want to redo this because they're afraid of "magic."

You still have to know a bit of HTML, CSS, and JavaScript to get your way
around Rails, but you can take shortcuts with those too, like templating
with ERB, using CSS frameworks like Bootstrap or [Thoughtbot's Refills](https://refills.bourbon.io), and
of course jQuery, which has become startlingly rejected recently by a lot
of the JavaScript community.

Some proponents of the full stack JavaScript world are attracted to the
"one language to rule them all" idea, but most implementations of JS
frameworks lack any structure or standardization or convention and take so
much time to configure that shipping a product is arduous. (If you like
the idea of developing entirely in one language, I recommend looking into
Clojure and Luminus which is fast and expressive and uses some
awesome truly full-stack patterns).

[Ember](https://emberjs.com/) is an outlier here, and deserves credit for taking a lot of the good ideas Rails popularized and put it in a JS framework with an amazing CLI tool. But unfortunately they don't have marketing expert giants like Facebook (for React) or Google (for Angular) pushing the Ember framework, so naturally it gets pushed aside.

Stuff like Ember and [Yeoman](https://yeoman.io) ease the pain a little bit sometimes, but the
fragmentation and the dramatic fiasco that has become of the
JavaScript framework/library/etc world is becoming a defining characteristic of the community. These frameworks inaccessibility often require
that one be an expert just in JavaScript in order to properly implement. Why?

Full stack development is really just combining the concepts of
"standing on the shoulders of giants" and ["strategic laziness."](https://fourhourworkweek.com/2014/08/25/the-art-of-strategic-laziness/) We take what we've learned from the past, and use it to strategically avoid decisions that have already been made and proven by people smarter than us.

## Effort For its Own Sake

Many JavaScript frameworks are implementing patterns like MV-star or MVVM
. They take the solid tried and true MVC pattern that most developers are
familiar with and start scrambling up the acronyms and implementing them
poorly and without conventions (I know MVVM was created before the JS
frameworks, but the creator of the pattern has himself criticized it as
a bad idea for these UI implementations).

Why are we spending time re-inventing the wheel under the guise of
innovation and re-solving solved problems for its own sake?

SQL is another example. The problem of organizing data rationally and querying it
was solved decades ago, and any worthy modern framework can interact with
this data and create rich APIs if need be.

Yet the hot shit these days is NoSQL, which shuns decades of work for [a
markedly worse solution](http://www.sarahmei.com/blog/2013/11/11/why-you-should-never-use-mongodb/). This trend is very limiting, and any SQL DB can produce JSON anyway, so what is the point?

## Servers are our friends

[Single Page Apps are almost never necessary.](https://ponyfoo.com/articles/stop-breaking-the-web)
 Your users don't care about two-way data
binding or one-way data flow. I promise. Neither does your pointy-haired boss.
They care that the data they are getting or posting is getting got or posted.

"Isomorphic" (which is quite a pretentious word for running on the client and server) JavaScript is an idea that removes the logical separation of client and server so that all the code is tightly coupled and stored together in a repo. This is an interesting solution to the problem that we are now having with SPAs bloating up and slowing down the browser by running the code through the server first and templating. This is, on the surface, a trend toward the monolithic architecture I'm touting in this article.

But, really it's roundabout, difficult to implement, and adding complexity when we should be removing it. Like, how about just not using too much JS on the client and minimizing requests? People say it helps with SEO, but Google now crawls pages that are generated with JS, at least supposedly. If you want better SEO, don't render all your content with JavaScript.

Data and content should be submitted and displayed by the client, and manipulated and stored on the server. This has worked well, and will continue to work well for the foreseeable future. Just sprinkle in the JS that is needed to make you're app interactive and pretty and things will move along nicely.

## Over-modularization

The Unix philosophy of "Do one thing and do it well" has been repeated to the point of overuse in the community, especially surrounding the React ecosystem. So React does the view layer well. Redux does the data flow well. Webpack does package management well, and Gulp or NPM scripts do build process well. And so on and so forth.

Well, Rails has many components that do their respective pieces well. Active Record does ORM and data handling _very_ well. ActionMailer does email well. The asset pipeline does asset management well. And so on and so forth.

But guess what? Ruby on Rails does one thing, and one thing well, and that's _full-stack web development_.

It's also important to remember that Unix is a family of operating systems. Operating systems do many things, and do them well. One off the top of my head might be system operation. But each of the components do their own thing well to make the monolith of Unix the magical beast that it is.

Microservices, containers, and "anti-monolithic" approaches to
architecture make sense occasionally, like when you work for Netflix or
Spotify and have teams churning out features at enormous scale that needs
multi-threaded asynchronous load balancing and all the jazz.

But unless you're a specialist in whichever micro piece of the stack and
are sticking to it(or if you're an architect and setting this stuff up is
your specialty), this type of architecture is daunting and will
unquestionably turn into an unmaintainable spaghetti mess.

The fact is we are over-modularizing things. Every time I start a new JS
project, I feel like I just moved into a new house with nothing but
a screwdriver and a few thousand dollars worth of Ikea furniture -I'm
excited so I tear open the boxes and get started but building the couch
seems more fun than the bookcase and I just stripped all the screws of the
wardrobe which was too heavy to lift by myself anyway and I really should
start on my desk so I can build a computer to put on it and now I lost
that screwdriver. Before I know it, I have a room full of shredded
cardboard under a pile of partly-assembled furniture and the rest of the
house is still empty.

What if I had the option of walking into my house totally furnished to my
exact specifications and expectations at no extra cost?

That's what I think of as what some folks like to call "monoliths." I'm
fine with that word. If convention means monolith than I prefer monoliths
over modules, and I think it's odd that so many developers want to be so
contrarian about it. I get the whole rebel spirit of the industry and
engineering culture, but historically it hasn't been such a hodgepodge - it has continually moved towards conventions and layers of abstraction, so
we can be more effective and efficient and get on with innovating (or in
most of our cases, selling something).

I don't want to have containers containing NoSQL interacting with
modularized libraries inside their own containers. It's gonna be slow to
develop, and slow to load. I want a monolith that I can spend more time on
making it do a better job at what it is and ship the damn thing.

Doing a project in React has such a huge learning curve and the sheer
amount of modules and libraries one must connect and configure makes my
head spin. There are seemingly infinite combinations of libraries and
newest things you must know to [actually ship something.](http://mir.aculo.us/2015/08/25/how-to-actually-ship-software-that-actually-works/)

[Some people love this constant stream of new stuff and learning, but even
they are feeling the exhaustion.](https://medium.com/@ericclemmons/javascript-fatigue-48d4011b6fc4#.s12704ins)

My buddy shaine put it well -

<blockquote class="twitter-tweet" lang="en"><p lang="en" dir="ltr">Is there a way to just skip over react/webpack/es6 to the next big thing? I love those things, but theoretically I love the next thing more.</p>&mdash; Shaine Hatch (@ShaineHatch) <a href="https://twitter.com/ShaineHatch/status/643468259375714304">September 14, 2015</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

It's okay to love new things and be hungry for more learning, but I do
believe that the lack of structure, conventions, and opinionated-ness is crippling
the potential of what we can do, especially in the JS community. Not to mention
the insane additions of features in
ES6/ES2018/ES-whatever-we're-calling-it-now.

## Lets go back to convention over configuration.

The chaos of the ultra-modularized JavaScript (and relatives) community could be solved by
coming together to develop some order and re-use, so we can use
conventions that are shared by most instead of connecting and configuring
one library after another to re-solve solved problems. Developers are not
happy with this churn fatigue, and users are getting shittier experiences
from it.

Maybe the full-stack naysayers are saying nay because they have spent so
much time specializing on their thing that they find it impossible to be
as good at doing all the things. If we standardized some conventions, more
of us would be able to specialize on the entire stack, but only because we
are really specializing on the layer of abstraction that does all the
full-stack stuff.

We in the [current state of the JS world](http://www.breck-mckye.com/blog/2014/12/the-state-of-javascript-in-2015/) are lacking the glue that holds the modules that make a magnificent, magical monolith. I'm talking about the ridiculous steps of getting all the moving pieces to work together. Let's come up with ways to fix it.

Undoubtedly a large percentage of you reading this will say, "If you don't like
it fork it, fix it, or make a better one." But not only do I have no desire
whatsoever to do that, I also believe this mentality is possibly the biggest
contributor to the [clusterfuckification of the community](https://xkcd.com/927/).

I'm ranting, but I'm also here to offer solutions. People need to stop making
JS frameworks, and people also need to stop writing self contained libraries
that don't conform to any standard but their own. Follow the examples of Rails
and Django, and SpringMVC and even jQuery. Let's just come together to pick a framework with a high level of abstraction, so we can make the magic happen by piggybacking on the magic the frameworks provide. [It's the future.](https://blog.circleci.com/its-the-future/)

