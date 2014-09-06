---
layout: post
title: "benchmarking the performance of nodejs"
date: 2014-08-22 22:07
comments: true
categories:  [ V8, nodejs , benchmark , octane , chrome ]
---

During the course of developing [node-opcua](http://node-opcua.github.io/), a javascript framework for OPCUA powered by
[nodejs](http://nodejs.org), I came across the need to measure the performance of nodejs on various hardware including
ARM based nano-computers such as RasberryPi and BeagleBoneBlack.

<!-- more -->

### Understanding the performance of the V8 engine used by nodejs.

Nodejs is using  Google V8 javascript engine which runs inside the Chrome web browser too.

V8 code optimisation can lead to [astonishing good results](http://wingolog.org/archives/2011/06/10/v8-is-faster-than-gcc)
compared with C/C++ program, at least on a x86/x64 processor.

But ...

* Does V8 inside nodejs perform as well as in Chrome ? 
* Is V8 performing well also on ARM CPU ?
* How does nodejs running on a Raspberry compare  with nodejs running on an BeagleBoneBlack ? 
 
Here comes **[Octane 2](https://code.google.com/p/octane-benchmark/)**, a [benchmark to score the performance of a javascript engine running inside a browser](http://thenextweb.com/google/2013/11/06/google-releases-version-2-0-javascript-benchmark-tool-octane-focus-reducing-latency) designed by Google.
 
You can run the benchmark inside your browser by  following this [link](http://octane-benchmark.googlecode.com/svn/latest/index.html) and pressing the START button.
 
 
Here are the results with Chrome and Firefox on my desktop:


| Computer          | environment                     | Score | Javascript Engine   |
|-------------------|---------------------------------|------:|---------------------|
| Core I7 desktop   | Chrome (36.0.1985.143)          | 26008 | V8 v3.26(*)         |
| Core I7 desktop   | Firefox 31                      | 15800 | SpiderMonkey 31     |
| VM Ubuntu 14.04(*)| Chromium  (36.0.1985.125)       | 8178  |  V8 3.26            |
| VM Ubuntu 14.04(*)| Firefox 31                      | 5041  |  SpiderMonkey 31    |


(*) Ubuntu 14.04 running inside a VirtualBox machine on my Core I7 desktop.

However, I needed the same benchmark but running on nodejs , without a GUI.
Fortunately,  octane benches are pure javascript algorithms and can be easily ported to node.
Daishi Kato has published [benchmark-octane](https://github.com/dai-shi/benchmark-octane) a NPM module on github that serves as a very good starting point.

With a few tweaks I created a [forked version of benchmark-octane](https://github.com/erossignon/benchmark-octane) that suites my need.

This version produces the same output as the browser version making results more comparable.

This is the result of running **benchmark-octane** on various version of node:


### Running Octane benchmark for nodejs:

| Computer       | environment   | Score | time   |
|:---------------|:--------------|------:|-------:|
|Core I7 desktop | nodejs 0.10.24| 15800 | 50s    |
|Raspberry       | nodejs 0.10.24|   138 | 2351 s |
|VM Ubuntu 14.04 | nodejs 0.08.21|  5600 | 74s    |
|VM Ubuntu 14.04 | nodejs 0.10.10| 6550| 62s     |
|VM Ubuntu 14.04 | nodejs 0.10.24| 6472| 62s   |
|VM Ubuntu 14.04 | nodejs 0.10.31| (crashed in Mandreel)|     |
|VM Ubuntu 14.04 | nodejs 0.11.13|8050| 50s    |


## running NodeJS Benchmark


Follow this instruction to run [Benchmark-octane](https://github.com/erossignon/benchmark-octane) 
 
```bash
$ git clone https://github.com/erossignon/benchmark-octane
$ cd benchmark-octane
$ npm install
$ node run.js
```
