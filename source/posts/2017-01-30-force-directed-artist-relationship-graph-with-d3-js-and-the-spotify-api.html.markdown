---
title: Force-directed relationship graph with D3.js and the Spotify Web API
date: 2017-01-30 22:13 MST
tags: D3, graph, charting, js, spotify, api
layout: post
published: true
---
I've always loved data visualization done well and admired interactive graphs and maps seen on [The New York Times](https://www.nytimes.com/interactive/2016/12/21/upshot/Mapping-the-Shadows-of-New-York-City.html) and elsewhere.

[D3.js](https://d3js.org/) is a powerful data visualization library in JavaScript written by the former editor of the New York Times graphics department. It uses a jQuery-like syntax to create and manipulate interactive charts on the web.

I finally made an excuse for myself to take a couple days and learn what D3 is all about in the form of a web app that maps a [force-directed graph](https://en.wikipedia.org/wiki/Force-directed_graph_drawing) of related artists to the artist the user inputs.

<a href="https://elliotec.com/visuify">
    <img src="../images/visuify.png"/>
    <h2>PLAY WITH VISUIFY</h2>
</a>

Click the link above to play around with it. Open the artist page in Spotify by clicking the artist name above the chart and hovering, clicking, and dragging the nodes and links do stuff too.

The flow of the program is:

1. User inputs and submits the name of an artist
2. A query for the artist is made to the [Spotify Web API](https://developer.spotify.com/web-api/)
3. The artist is stored, and another request is made for that artist's related artists
4. Each related artist to the original query is stored along with their relationships, and another request is made for the second degree of related artists to the original - that is, the related artists of each related artist to the original query
5. Nodes and Links are drawn by D3 with specified interactions and styles based on the objects built in the previous step

The most difficult part was structuring the data properly synchronously before executing D3 to draw the graph from it. I enlisted help from a few friends and my buddy Michal Scienski helped me get the promise chain to work properly, so kudos to him.

After the data structure was sorted out, it was pretty fast and fun to get D3 to do what I wanted with it. Between the excellent documentation and the [creator's examples](https://gist.github.com/mbostock), I was able to build most of the features and functionality I wanted in a couple spare evenings. It was quickly apparent how powerful D3 can be and how many useful applications it has.

Ideas for its future include routing by artist query and rewriting it in ES-Latest without jQuery or Lodash.

[See the code on Github](https://github.com/elliotec/visuify)

