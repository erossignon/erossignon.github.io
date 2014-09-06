---
layout: post
title: "Improve responsiveness of Youtube frames in  Jekyll and Octopress pages"
date: 2012-11-25 00:38
comments: true
categories: [ jekyll , octopress, youtube ]
---

I am now using [octopress](http://octopress.org) hosted in [GitHub](http://github.com) for my blog. 
Octopress is based on [Jekyll](https://github.com/mojombo/jekyll) which is a static site generator written in Ruby.
Jekyll uses a combination of [Liquid](http://liquidmarkup.org/) and [Markdown](http://old-wp.slekx.com/the-markdown-tutorial/)
, two markup engines that allow you to write your post almost in plain ascci without worrying about the HTML syntax.

After installing a [appropriated plugin](http://makokal.github.com/blog/2012/02/24/simple-jekyll-plugin-for-youtube-videos/), I was able to insert youtube video frame using a Liquid sequence
{% raw %}
     {% youtube VIDEO_ID %}
{% endraw %}

<!-- more -->

Internaly the youtube tag triggers a little Liquid script that turns the video ID into the \<iframe\> html element as required by the Youtube API.

{% raw %}
    <iframe width="560" height="315"  
            src="http://www.youtube.com/embed/q_NvDTZIaS4" 
            frameborder="0" allowfullscreen ></iframe>
{% endraw %}

and produces :

<iframe width="560" height="315" src="http://www.youtube.com/embed/q_NvDTZIaS4" frameborder="0" allowfullscreen></iframe>

One of my first post included a lot of embedded youtube video and it was very convenient.


However, with many videos includes the page takes a very long time to load, and the browser even freezes while the \<iframe\> s were beeing installed.
(not suprisingly many article,
[such as this one](http://www.stevesouders.com/blog/2009/06/03/using-iframes-sparingly/) 
recommand to use iframe sparingly for this very reason)

Searching a little bit deeper, I stumbled across an article from [yabtb](http://yabtb.blogspot.fr/2011/12/lazy-load-youtube-videos.html) explaining how overcome this problem, using a technique called *lazy loading*.

In essence, lazy loading consist of replacing the \<iframe\> with a static image  (using the \<img\> tag) and a little bit of javascript to replace the \<img\> tag with the proper \<iframe\> tag at runtime when the reader clicks on the image.

I then decided to improve the *youtube* *Liquid plugin* to use this technique and publish the new plugin  <[code on github : [https://github.com/erossignon/jekyll-youtube-lazyloading](https://github.com/erossignon/jekyll-youtube-lazyloading) 

you can see the result of here :

{% youtube q_NvDTZIaS4 %}


### Credits

- [andmag](http://amobil.se/2011/11/responsive-embeds/)
- [portwaypoint](http://www.portwaypoint.co.uk/jekyll-youtube-liquid-template-tag-gist/)
- [yatb](http://yabtb.blogspot.fr/2011/12/lazy-load-youtube-videos.html)
- [optikfluffel](https://github.com/optikfluffel/octopress-responsive-video-embed)
- [stackoverflow](http://stackoverflow.com/questions/843680/how-to-replace-dom-element-in-place-using-javascript?answertab=active#tab-top)
- http://net.tutsplus.com/tutorials/other/building-static-sites-with-jekyll/
- http://five.squarespace.com/display/ShowHelp?section=Markdown

