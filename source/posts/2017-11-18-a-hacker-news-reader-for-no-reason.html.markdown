---
title: A Hacker News Reader For No Reason - In 5K of Vanilla JS, HTML, & CSS
date: 2017-11-18 13:23 MST
tags: javascript, hacker news, css, performance
published: true
---


The title is only half true.

The other night I was thinking about how my experience being fully entrenched in React and the modern JavaScript ecosystem lately might have influenced how I'd write an app by hand in vanilla HTML, CSS, and JS with no libraries or anything.

Within the same hour I was looking at [Hacker News](https://news.ycombinator.com/) and some of it's reader clients, noting how they all kind of sucked as far as UX (including HN itself - only recently adding comment collapsing and mobile support), and discovered [the Hacker News API](https://github.com/HackerNews/API).

Clearly this presented an opportunity to build my own HN reader in the lightest way I could - fully client side, no libraries, totally vanilla.

So I did it in 2 files, 99 lines of JavaScript, and 99 lines of HTML/CSS.

The files will automatically go through my build script since they're hosted on this site ([as explained here](https://elliotec.com/how-to-get-100-google-page-speed-score/)). The JS is only 4.4 KB in the first place, but minifying it and gzipping it brought it down to 1.5 KB which is pretty significant. The HTML file is 3.5 KB minified and gzipped.

I'll save you the arithmetic, that's a grand total of _5 KB_ on the initial load.

<a href="/hn-no-reason/" target='_blank'>
    <h2>Go to A Hacker News Reader For No Reason!</h2>
    <img src="../images/hn-no-reason.png" alt='HN App Image' />
</a>

### Features

- Gets the top 30 stories in order with their points, just like the front page of HN.
- If the story has a URL, the title will take you to a new tab with the URL, otherwise it will toggle the text content of the story (like Ask, Show, Jobs, etc.).
- If the story has comments, there's a link to toggle the comments.
- Each comment and their children are collapsible.
- There's a link to the original story on HN, and to the user that submitted the story or comments.
- Looks decent on all devices.
- Super tiny and pretty fast.

### Limitations

- Since I'm using modern ECMAScript features, only more modern browsers will support it, but most of my audience is probably fine with that.
- It only shows the top stories - no support for New, Ask, Jobs, etc. unless they're on the front page. This is not a limitation to me personally since I spend 99% of my HN time just on the front page.
- No login, upvote/downvote, or posting functionality. Unfortunately the HN API doesn't support this yet, but if/when it does, maybe I'll try to get all that in with another 99 lines :D
- I'm not a designer. This was styled with my typical aesthetic of a minimal dark theme with green all over. Probably not everyone's favorite but certainly mine, and it's mine, so whatever.

### The Code

I wrote the styles in a `<style>` tag in `index.html`. Since one of the goals I had with this was to keep it super small and light, I characteristically set an arbitrary limit of lines for myself at a number I figured seemed reasonable to finish it within.

I fudged some of my usual code style guidelines and there were a few times I disrespected the 80-character line rule I prefer to abide by in order to hit the 99 line mark in both files, but nothing too crazy and I'm not crossing any hard bad-practice lines.

[You can check out the repo here](https://github.com/elliotec/hn-no-reason) -
but since it's only 99 lines, I've posted the contents of JS file below.

Note the use of several ES6+ features and the resemblance to React and JSX with the templating. Of course, there's no fancy Virtual DOM or anything here and it's simply manipulating the DOM as needed. I'm using functional and immutable patterns where applicable, in the parlance of our time.

```javascript

const hnBaseUrl = 'https://hacker-news.firebaseio.com/v0'
const state = {}
function fetchTopStories() {
  const topStoriesUrl = `${hnBaseUrl}/topstories.json`
  return fetch(topStoriesUrl).then(response => response.json())
    .then((data) => fetchStories(data))
}
function fetchStories(data) {
  const topStories = data.slice(0, 29)
  const storyIds = topStories.map((storyId) => {
    const storyUrl = `${hnBaseUrl}/item/${storyId}.json`
    return fetch(storyUrl).then((response) => response.json())
      .then((story) => story)
  })
  return Promise.all(storyIds).then((stories) => {
    state.stories = stories
    renderStories(stories)
  })
}
function renderStories(stories) {
  return stories.map((story) => {
    const userUrl = `https://news.ycombinator.com/user?id=${story.by}`
    const storyItemUrl = `https://news.ycombinator.com/item?id=${story.id}`
    const html = `
      <div class='story' id='${story.id}'>
        <h3 class='title'>
          ${story.url ? `<a href='${story.url}' target='_blank'>${story.title}</a>`
            : `<a href='javascript:void(0)' onclick="toggleStoryText('${story.id}')" >${story.title}</a>`}
        </h3>
        <span class='score'> ${story.score} </span> points by
        <a href='${userUrl}' target='_blank' class='story-by'> ${story.by}</a>
        <div class='toggle-view'>
          ${story.kids ? `
            <span
              onclick="fetchOrToggleComments('${story.kids}','${story.id}')"
              class='comments'
            > [toggle ${story.descendants} comments] </span>`
          : '' }
          <a href='${storyItemUrl}' target='_blank' class='hnLink'>[view on HN]</a>
        </div>
        ${story.text ?
          `<div class='storyText' id='storyText-${story.id}' style='display:none;'>
            ${story.text} </div>` : '' }
        <div id='comments-${story.id}' style='display: block;'></div>
      </div> `
    document.getElementById('hn').insertAdjacentHTML('beforeend', html)
  })
}
function toggleStoryText(storyId) {
  const storyText = document.getElementById(`storyText-${storyId}`)
  storyText.style.display = (storyText.style.display === 'block') ? 'none' : 'block'
}
function fetchComments(kids, storyId) {
  const commentIds = kids.split(',')
  const allComments = commentIds.map((commentId) => {
    const commentUrl = `${hnBaseUrl}/item/${commentId}.json`
    return fetch(commentUrl).then((response) => response.json()).then((comment) => comment)
  })
  return Promise.all(allComments).then((comments) => {
    state[storyId] = comments
    renderComments(comments, storyId)
  })
}
function fetchOrToggleComments(kids, storyId) {
  function toggleAllComments(storyId) {
    const allComments = document.getElementById(`comments-${storyId}`)
    allComments.style.display = (allComments.style.display === 'block') ? 'none' : 'block'
  }
  state[storyId] ? toggleAllComments(storyId) : fetchComments(kids, storyId)
}
function toggleComment(commentId) {
  const comment = document.getElementById(commentId)
  const toggle = document.getElementById(`toggle-${commentId}`)
  comment.style.display = (comment.style.display === 'block') ? 'none' : 'block'
  toggle.innerHTML = (toggle.innerHTML === '[ - ]') ? '[ + ]' : '[ - ]'
}
function renderComments(comments, storyId) {
  return comments.map((comment) => {
    const userUrl = `https://news.ycombinator.com/user?id=${comment.by}`
    const html = comment.deleted || comment.dead ? '' : `
      <div class='comment'>
        <span
          onclick='toggleComment("${comment.id}")'
          href='javascript:void(0)'
          id='toggle-${comment.id}'
          class='toggle-comment'
        >[ - ]</span>
        <a href='${userUrl}' class='comment-by'> ${comment.by}</a>
        <div id=${comment.id} class='comment-text' style='display:block;'>
          ${comment.text}
        </div>
      </div> `
    comment.parent == storyId ?
      document.getElementById(`comments-${storyId}`).insertAdjacentHTML('beforeend', html)
      : document.getElementById(comment.parent).insertAdjacentHTML('beforeend', html)
    if (comment.kids) return fetchComments(comment.kids.toString(), storyId)
  })
}
fetchTopStories()
```

There you have it. Maybe someone else will also find a reason to use [A Hacker News Reader For No Reason](https://elliotec.com/hn-no-reason/).

_Update 2018-03-04_: This post has been translated into Russian at [clipartmag.com](http://clipartmag.com/ru-a-hacker-news-reader-for-no-reason)
