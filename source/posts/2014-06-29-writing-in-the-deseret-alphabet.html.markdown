---
published: true
layout: post
title: Writing in the Deseret Alphabet with Web Fonts
date: 2014-06-29 09:08
tags: utah, languages, deseret, sass, fonts
---
<style>
    @font-face {
        font-family: 'HuneyBee';
        src: url('/fonts/Huneybee.eot'); /* IE9 Compat Modes */
        src: url('/fonts/Huneybee.eot?#iefix') format('embedded-opentype'), /* IE6-IE8 */
        url('/fonts/Huneybee.woff') format('woff'), /* Modern Browsers */
        url('/fonts/Huneybee.ttf')  format('truetype'), /* Safari, Android, iOS */
        url('/fonts/Huneybee.svg') format('svg'); /* Legacy iOS */

        font-style:   normal;
        font-weight:  400;
    }

    @font-face {
        font-family: 'AdamicBee';
        src: url('/fonts/AdamicBee.eot'); /* IE9 Compat Modes */
        src: url('/fonts/AdamicBee.eot?#iefix') format('embedded-opentype'), /* IE6-IE8 */
        url('/fonts/AdamicBee.woff') format('woff'), /* Modern Browsers */
        url('/fonts/AdamicBee.ttf')  format('truetype'), /* Safari, Android, iOS */
        url('/fonts/AdamicBee.svg') format('svg'); /* Legacy iOS */

        font-style:   normal;
        font-weight:  400;
    }

    @font-face {
        font-family: 'Deseret-sans';
        src: url('/fonts/deseret.eot'); /* IE9 Compat Modes */
        src: url('/fonts/deseret.eot?#iefix') format('embedded-opentype'), /* IE6-IE8 */
        url('/fonts/deseret.woff') format('woff'), /* Modern Browsers */
        url('/fonts/deseret.ttf')  format('truetype'), /* Safari, Android, iOS */
        url('/fonts/deseret.svg') format('svg'); /* Legacy iOS */

        font-style:   normal;
        font-weight:  400;
    }

    .huney {
        font-family: "HuneyBee";
    }
    .deseret-sans {
        font-family: "deseret";
    }
    .adamic {
        font-family: "AdamicBee";
    }
</style>

*If you're here for the code and want to skip most of the history and linguistics, <a href="#code">click here</a>.*

## The State of Deseret

This past weekend I went camping in the [San Rafael Swell](https://en.wikipedia.org/wiki/San_Rafael_Swell) and became interested in my native state of Utah's history and unique culture.

Evidence of humans is found in Utah for as far back as 12,000 years ago. Various Native American tribes and cultures (Freemont, Puebloan, etc.) occupied the land until the first of the Mormon pioneers arrived with their leader [Brigham Young](https://en.wikipedia.org/wiki/Brigham_Young) in 1847.

They settled in by vastly changing the desert environment into a habitable landscape with amazing feats of industry including irrigation and agriculture, timber and mining, and constructing communities from the resources around them. They created a society from scratch.

The settlers were very isolated and in a political and territorial limbo that went from technically belonging to Mexico, to a near immediate statehood proposal ([The State of Deseret](https://en.wikipedia.org/wiki/State_of_Deseret)), and then remaining a U.S. territory - all the while settling most of the western United States including cities like Las Vegas, San Bernardino, most of Idaho and Nevada, a good chunk of Arizona and many other western states.

Brigham Young and the Mormons were the de facto government throughout this time (some say they still are) and as such were providing public necessities like schooling, and founded the precursor to the University of Utah, the University of Deseret.

## The Deseret Alphabet

This was a time when there were several efforts to reform the traditional Latin English alphabet into something phonetic, more easily taught to immigrants and children, and optimized for handwriting. Brigham Young and the board of regents of the University of Deseret saw their position as an opportunity to get in on this action.

In addition to the aforementioned reasons for alphabet reform, the Mormon leadership believed a new writing system would benefit them in other ways such as more unification, solidifying their unique identity, and some speculate that there was a bit of a secret-keeping draw to it as well, though that claim has been refuted by several scholars.

[The Deseret Alphabet](https://en.wikipedia.org/wiki/Deseret_alphabet) was developed over the course of several years and iterations beginning before the pioneers made their way across the plains, and finally had its first printing in 1859 by the [Deseret News](https://en.wikipedia.org/wiki/Deseret_News). Periodic sample prints of the alphabet came in the newspaper until the first books were published in the late 1860's which sold very poorly. The alphabet died with Brigham Young in 1877.

It is amazing how much research there is on the Deseret Alphabet, with how few people seem to know about it. There has even been [an effort to print many classic literary masterpieces](http://www.deseretalphabet.info/classics/) in the alphabet. It was introduced in Unicode in 2001, allowing for hobbyists, linguists, and historians to use the alphabet more easily.

## Learning the alphabet

Here's a pronunciation table:



| Glyph | IPA  | Sound | Glyph | IPA | Sound |
|-------|------|-------------|-------|-----|-------------|
|<i class="adamic"> 𐐀</i>    | /iː/ |  "e" in me   | <i class="adamic">𐐊</i>    | /ʌ/|  "u" in luck |
| <i class="adamic">𐐁</i>    | /eɪ/ | "ay" in day  | <i class="adamic">𐐋</i>    | /ʊ/ |  "u" in pull |
| <i class="adamic">𐐂</i>    | /ɑː/ | "a" in cart | <i class="adamic">𐐌</i>    | /aɪ/|  "y" in my |
| <i class="adamic">𐐃</i>    | /ɔː/ | "au" in caught | <i class="adamic">𐐍 </i>| /aʊ/ | "ow" in cow |
| <i class="adamic">𐐄</i>    | /oʊ/ |  "o" in go  | <i class="adamic">𐐎</i>    | /w/ |  "w" in wow |
| <i class="adamic">𐐅 </i>   | /uː/ | "oo" in do | <i class="adamic">𐐏 </i>   | /j/ |  "y" in yes |
| <i class="adamic">𐐆</i>    | /ɪ/  |  "i" in sit | <i class="adamic">𐐐</i>    | /h/ |  "h" in hi |
| <i class="adamic">𐐇 </i>   | /ɛ/  |  "e" in bet | <i class="adamic">𐐑</i>  | /p/ | "p" in pet  |
| <i class="adamic">𐐈 </i>   | /æ/  | "a" in cat   | <i class="adamic">𐐒</i>  | /b/ | "b" in boy |
| <i class="adamic">𐐉 </i>   | /ɒ/  |  "o" in lot | <i class="adamic">𐐓</i>   | /t/ |  "t" in tank |

| Glyph | IPA  | Sound | Glyph | IPA | Sound |
|-------|------|-------------|-------|-----|-------------|
| <i class="adamic">𐐔</i>    | /d/ |  "d" in dog  | <i class="adamic">𐐞  </i>  | /z/ | "z" in zoo |
| <i class="adamic">𐐕</i>    | /tʃ/ |"ch" in church| <i class="adamic">𐐟</i>    | /ʃ/ | "sh" in ship |
| <i class="adamic">𐐖 </i>   | /dʒ/ | "j" in jump  | <i class="adamic">𐐠</i>    | /ʒ/ | "s" in measure |
| <i class="adamic">𐐗 </i>   | /k/ | "k" in kite  | <i class="adamic">𐐡</i>    | /r/ |  "r" in red |
| <i class="adamic">𐐘</i>    | /ɡ/ |  "g" in girl | <i class="adamic">𐐢</i>    | /l/ | "l" in love |
| <i class="adamic">𐐙</i>    | /f/ |  "f" in food | <i class="adamic">𐐣 </i>   | /m/ |  "m" in mom |
| <i class="adamic">𐐚</i>    | /v/  | "v" in voice | <i class="adamic">𐐤 </i>   | /n/ | "n" in night  |
| <i class="adamic">𐐛</i>    | /θ/  | "th" in think | <i class="adamic">𐐥 </i>   | /ŋ/ | "ng" in sing |
| <i class="adamic">𐐜 </i>   | /ð/  | "th" in that | <i class="adamic">𐐦</i>    | /ɔɪ/|  "oy" in boy  |
| <i class="adamic">𐐝 </i>   | /s/  | "s" in sun  | <i class="adamic">𐐧 </i>   | /juː/ | "yew" in yew  |


So, ostensibly thats kind of a lot. 40 new unique characters and sounds to replace a very well known system seems a bit daunting, which may be part of the reason it had a hard time getting adopted by the intended users and audience.

In my opinion, other than the glyphs looking nothing at all like their Latin counterparts, the alphabet is rather easy to learn since you are just reassigning a symbol to a sound in English. There is no grammar or syntax change, it's really just like mind-mapping 40 pictures to 40 words for which a few hours of flash card study would be quite sufficient. (Though, this isn't the first time I've learned a dead script for no reason. I once became fluent in the ancient [Baybayin Tagalog script](https://en.wikipedia.org/wiki/Baybayin) in a strange bout of manic overachievement.)

## Limitations of the alphabet

The alphabet in its official form was created to emulate the pronunciation of the settlers, who came primarily from New England. This means when you read out loud a publication in the Deseret Alphabet, it's going to sound like you're talking with the accent of a North Easterner in the 1860's.

A good example of change is <i class="adamic">"𐐃"</i>, which in present-day Utah essentially doesn't exist. Think of a Long Island native saying something like "I thought you caught it when you fought it," or something along those lines. You know what I mean about the vowels in those words being non-existent and replaced simply with "ah" in the western United States.

Another limitation is the lack of a schwa (/ə/) vowel. It sounds like the "e" in "the." Historically the schwa has been written as <i class="adamic">𐐊</i>, which I find odd since the symbol <i class="adamic">𐐋</i> is much closer in my opinion. My blog, my rules, so I'll use <i class="adamic">𐐋</i> as the schwa from now on. Also, Deseret is cased, but the capital letters are just bigger versions of the lower case ones. So I'm going to skip using the lower case for readability and ease of use.

<a class="anchor" id="code"></a>
## Now for the fun part

 I went about scouring the web for better Deseret fonts. I had a lot of trouble finding a good sans-serif font. The primary resource for these and the serif fonts I found were by [Joshua Erickson](http://www.copper.chem.ucla.edu/~jericks/index.html), but alas, the entire sans-serif collection has been disabled. Bummer. At least I could use some of his serif fonts that were less harsh on the eyes than the default, and there were a few sans-serif fonts his site led me to. Here are a few font samples:



<p class="adamic">1. 𐐈𐐔𐐈𐐣𐐆𐐗𐐒𐐀： 𐐀𐐁𐐂𐐃𐐄𐐅𐐆𐐇𐐈𐐉𐐊𐐋𐐌𐐍𐐎𐐏𐐐𐐑𐐒𐐓𐐔𐐕𐐖𐐗𐐘𐐙𐐚𐐛𐐜𐐝𐐞𐐠𐐡𐐢𐐣𐐤𐐥𐐦𐐧𐐟 </p>

<p class="huney">2. H_NIBI：ABCDEFGHIJKLMNOPQRSTUVWXYZŽÀÁÂÃÊÎÐÑÔÕÛÞ </p>

<p class="deseret-sans">3. DEZÒRET: ABCDEFGHIJKLMNOPQRSTUVWXYZÅÆÈÊÌÍÒØÛŒˉ </p>

Unfortunately 2 and 3 (the two sans-serif) are mapped to two separate and seemingly arbitrary encodings rather than the proper Deseret Unicode characters like the serif font at the top of that list. So even though 2 (HuneyBee) is my favorite of the three, its nowhere near as easy to implement as 1 (AdamicBee).

Here is the HTML source of those example fonts:

```html
<p class="adamic">1. 𐐈𐐔𐐈𐐣𐐆𐐗𐐒𐐀： 𐐀𐐁𐐂𐐃𐐄𐐅𐐆𐐇𐐈𐐉𐐊𐐋𐐌𐐍𐐎𐐏𐐐𐐑𐐒𐐓𐐔𐐕𐐖𐐗𐐘𐐙𐐚𐐛𐐜𐐝𐐞𐐠𐐡𐐢𐐣𐐤𐐥𐐦𐐧𐐟</p>

<p class="huney">2. H_NIBI：ABCDEFGHIJKLMNOPQRSTUVWXYZŽÀÁÂÃÊÎÐÑÔÕÛÞ</p>

<p class="deseret-sans">3. DEZÒRET: ABCDEFGHIJKLMNOPQRSTUVWXYZÅÆÈÊÌÍÒØÛŒˉ</p>

```

As you can see, 1 is in the proper Deseret Unicode, and 2 and 3... aren't. Maybe they are relics of the pre-Unicode days of Deseret, but either way I'll be leaving them out when trying to write in it.

Almost all of the fonts I tried were one .ttf file and I needed to convert them to web fonts. This was ridiculously easy with [FontPrep](http://fontprep.com/). All I had to do was drag the .ttf file onto the app, and it generated a whole package of web font formats with the corresponding CSS. I highly recommend that app if you ever need to generate custom web fonts.

While I'm at it, I may as well explain how I got these custom fonts to work in the asset pipeline using Sass.

First, I created a /fonts directory where the rest of my asset directories are:

```unix
(Middleman)
-source
  -fonts
  -images
  -javascripts
  -stylesheets
  ...etc

(Rails)
-app
  -assets
    -fonts
    -images
    -javascripts
    -stylesheets
```

Next, FontPrep generates four files when it receives a .ttf- .eot, .svg, .woff, and another .ttf. I put these files in the /fonts directory for all three fonts I'm using:

```unix
-source
  -fonts
    -AdamicBee.eot
    -AdamicBee.svg
    -AdamicBee.woff
    -AdamicBee.ttf
    -Huneybee.eot
    -Huneybee.svg
    -Huneybee.woff
    -Huneybee.ttf
    -deseret.eot
    -deseret.svg
    -deseret.woff
    -deseret.ttf
```

Since I'm using [Bourbon](https://www.bourbon.io), I can use the magnificent [font-face mixin](http://www.bourbon.io/docs/latest) (I'm also using [Bitters](https://bitters.bourbon.io), so I placed these 3 lines at the bottom of the _typography.scss partial):

```scss
// /bitters/_typography.scss
@include font-face('Huneybee', '/fonts/Huneybee');
@include font-face('AdamicBee', '/fonts/AdamicBee');
@include font-face('deseret', '/fonts/deseret');
```
This compiles the following CSS:

```css
@font-face {
  font-family: 'HuneyBee';
  src: url('/fonts/Huneybee.eot'); /* IE9 Compat Modes */
  src: url('/fonts/Huneybee.eot?#iefix') format('embedded-opentype'), /* IE6-IE8 */
       url('/fonts/Huneybee.woff') format('woff'), /* Modern Browsers */
       url('/fonts/Huneybee.ttf')  format('truetype'), /* Safari, Android, iOS */
       url('/fonts/Huneybee.svg#aa041304602ddc161943388b95e8c94f') format('svg'); /* Legacy iOS */

  font-style:   normal;
  font-weight:  400;
}

@font-face {
  font-family: 'AdamicBee';
  src: url('/fonts/AdamicBee.eot'); /* IE9 Compat Modes */
  src: url('/fonts/AdamicBee.eot?#iefix') format('embedded-opentype'), /* IE6-IE8 */
       url('/fonts/AdamicBee.woff') format('woff'), /* Modern Browsers */
       url('/fonts/AdamicBee.ttf')  format('truetype'), /* Safari, Android, iOS */
       url('/fonts/AdamicBee.svg#159e7fbb74bf1cefffafc0996ebf38fb') format('svg'); /* Legacy iOS */

  font-style:   normal;
  font-weight:  400;
}

@font-face {
  font-family: 'Deseret-sans';
  src: url('/fonts/deseret.eot'); /* IE9 Compat Modes */
  src: url('/fonts/deseret.eot?#iefix') format('embedded-opentype'), /* IE6-IE8 */
       url('/fonts/deseret.woff') format('woff'), /* Modern Browsers */
       url('/fonts/deseret.ttf')  format('truetype'), /* Safari, Android, iOS */
       url('/fonts/deseret.svg#c44a3474510e076f453a95eeee3a1178') format('svg'); /* Legacy iOS */

  font-style:   normal;
  font-weight:  400;
}
```
Thats about as bullet-proof cross-browser compatible as you can get. A good example for why I think Sass is indispensable in modern web development. 3 simple scss lines compile to 34 lines of css with the best of the best practices.

Finally, I just gave each separate font its own class in the scss that I could apply to any HTML element:

```scss
// /posts.scss
  .huney {
    font-family: "HuneyBee";
  }
  .deseret-sans {
    font-family: "deseret";
  }
  .adamic {
    font-family: "AdamicBee";
  }
```

It should also be noted that I'm using Markdown for these posts, which means in this special case I just used the HTML you saw above in the Markdown file to apply those classes to the unique font examples.

## And finally, a real writing sample

<blockquote class="adamic">𐐁 𐐐𐐧𐐣𐐊𐐤 𐐒𐐀𐐏𐐀𐐥 𐐟𐐋𐐔 𐐒𐐀 𐐁𐐒𐐋𐐢 𐐓𐐅 𐐕𐐁𐐤𐐖 𐐊 𐐔𐐌𐐑𐐋𐐡, 𐐑𐐢𐐈𐐤 𐐊𐐤 𐐆𐐤𐐚𐐁𐐠𐐊𐐤, 𐐒𐐋𐐕𐐋𐐡 𐐊 𐐐𐐉𐐘, 𐐗𐐂𐐤 𐐊 𐐟𐐆𐐑, 𐐔𐐆𐐞𐐌𐐤 𐐊 𐐒𐐆𐐢𐐔𐐀𐐥, 𐐡𐐌𐐓 𐐊 𐐝𐐂𐐤𐐆𐐓, 𐐒𐐈𐐢𐐈𐐤𐐝 𐐊𐐗𐐍𐐤𐐓𐐝, 𐐒𐐆𐐢𐐔 𐐊 𐐎𐐉𐐢, 𐐝𐐇𐐓 𐐊 𐐒𐐄𐐤, 𐐗𐐊𐐣𐐙𐐋𐐡𐐓 𐐜𐐋 𐐔𐐌𐐀𐐥, 𐐓𐐁𐐗 𐐃𐐡𐐔𐐋𐐡𐐝, 𐐘𐐆𐐚 𐐃𐐡𐐔𐐋𐐡𐐝, 𐐗𐐄𐐂𐐑𐐋𐐡𐐁𐐓, 𐐈𐐗𐐓 𐐊𐐢𐐄𐐤, 𐐝𐐂𐐢𐐚 𐐀𐐗𐐎𐐁𐐠𐐊𐐤𐐝, 𐐈𐐤𐐊𐐢𐐌𐐞 𐐊 𐐤𐐅 𐐑𐐡𐐂𐐒𐐢𐐆𐐣, 𐐑𐐆𐐕 𐐣𐐊𐐤𐐧𐐡, 𐐑𐐡𐐄𐐘𐐡𐐈𐐣 𐐊 𐐗𐐊𐐣𐐑𐐧𐐓𐐋𐐡, 𐐗𐐋𐐗 𐐊 𐐓𐐁𐐝𐐓𐐀 𐐣𐐀𐐢, 𐐙𐐌𐐓 𐐀𐐙𐐆𐐟𐐆𐐤𐐓𐐢𐐀, 𐐔𐐌 𐐘𐐈𐐢𐐈𐐤𐐓𐐢𐐀. 𐐝𐐑𐐇𐐟𐐋𐐢𐐌𐐞𐐁𐐟𐐊𐐤 𐐆𐐞 𐐙𐐄𐐡 𐐆𐐤𐐝𐐇𐐗𐐓𐐝.<br><br>－ 𐐡𐐉𐐒𐐋𐐡𐐓 𐐐𐐌𐐤𐐢𐐌𐐤</blockquote>

That says:
>A human being should be able to change a diaper, plan an invasion, butcher a hog, conn a ship, design a building, write a sonnet, balance accounts, build a wall, set a bone, comfort the dying, take orders, give orders, cooperate, act alone, solve equations, analyze a new problem, pitch manure, program a computer, cook a tasty meal, fight efficiently, die gallantly. Specialization is for insects.<br><br>
- Robert Heinlein

You might not notice, but the Deseret version of this quote uses 48 fewer characters than our alphabet. There's a real argument for efficiency there. You're never doubling characters or organizing odd vowels into diphthongs, saving lots of space.

<blockquote class="adamic">𐐎𐐀 𐐂𐐡 𐐖𐐋𐐝𐐓 𐐊𐐤 𐐈𐐔𐐚𐐈𐐤𐐝𐐓 𐐒𐐡𐐀𐐔 𐐊𐐚 𐐣𐐊𐐥𐐗𐐀𐐞 𐐂𐐤 𐐊 𐐣𐐌𐐤𐐋𐐡 𐐑𐐢𐐈𐐤𐐆𐐓 𐐊𐐚 𐐊 𐐚𐐇𐐡𐐀 𐐈𐐚𐐋𐐡𐐆𐐖 𐐝𐐓𐐂𐐡.   𐐒𐐊𐐓 𐐎𐐀 𐐗𐐈𐐤 𐐊𐐤𐐔𐐊𐐡𐐝𐐓𐐈𐐤𐐔 𐐜 𐐏𐐅𐐤𐐊𐐚𐐊𐐡𐐝. 𐐜𐐈𐐓 𐐣𐐁𐐗𐐝 𐐊𐐝 𐐝𐐊𐐣𐐛𐐀𐐥 𐐚𐐇𐐡𐐀 𐐝𐐑𐐇𐐟𐐋𐐢.<b<br><br>－𐐝𐐓𐐀𐐚𐐆𐐤 𐐐𐐃𐐗𐐀𐐥</blockquote>

>We are just an advanced breed of monkeys on a minor planet of a very average star. But we can understand the Universe. That makes us something very special.<br><br>
- Steven Hawking

This is very tedious to type, however. I mapped my keys to each of the Deseret characters using [Better Touch Tool](https://folivora.ai/), a handy tool for lots of things, but it totally wasn't worth it as I ended up being faster by just copy/pasting the characters from the chart in order.

I thought about writing little sticky note characters and putting them on their corresponding keys, but I figured I already spent this much time learning a dead alphabet and my use of it will most likely die with the end of this post.

Alright, one more thing. This is the logo of one of my favorite bars in Salt Lake City, the [Bourbon House](https://www.bourbonhouseslc.com/). I'm using it without permission so if they ask me to take it down I will.

<img src="../images/bourbon.png">

It's a characature of Brigham Young holding a glass of bourbon,something he ironically was known to do (he even built the first whiskey distillery in Utah, go figure). It might be hard to see, but the Deseret there says: <blockquote class="adamic">𐐒𐐁𐐁𐐡 𐐀𐐝 𐐑𐐡𐐄𐐄𐐙 𐐓𐐐𐐂𐐓 𐐘𐐄𐐔 𐐢𐐄𐐚𐐁𐐝 𐐋𐐝</blockquote>

To a native Deseret reader, that would be utter nonsense. It sounds something like:

>Be-eer eess proh-ohff t-haut gohd lohveeess oooss

It's safe to assume that it's trying to say "Beer is proof that God loves us."

So a more proper translation would be along the lines of:

<blockquote class="adamic">𐐒𐐁𐐡 𐐆𐐞 𐐑𐐡𐐅𐐙 𐐜𐐈𐐓 𐐘𐐉𐐔 𐐢𐐊𐐚𐐞 𐐊𐐝</blockquote>

I don't blame them for not getting a dead script kinda wrong, especially because it's funny and I like them a lot.

If you want to learn more about the Deseret Alphabet, here are some resources I used:

*Update: A new, far superior [Deseret Translator](http://2deseret.com) has been created by Nathan Hadfield. He referenced this article as a resource that helped him build it. Please check it out!*

- [The quasi-official Deseret Alphabet site](http://www.deseretalphabet.org//) *This site had almost all the resources I used neatly in one place, and seems to be maintained quite frequently.*

- [Deseret Alphabet Blog](http://deseretalphabet.blogspot.com/) *The owner of this blog has translated over [50% of the XKCD comics](http://www.deseretalphabet.info/XKCD/1385.html) into Deseret, an impressive feat no matter how pointless.*

- [The Deseret Alphabet Translator](http://2deseret.com/)

Anyway, thats enough of that. I probably should've spent this time learning a new programming language or something, but I learned a ton about my homeland's history, web fonts, typography, linguistics, and encoding so there was no lack of intellectual stimulation.

Hope you learned something too.

-Mike
