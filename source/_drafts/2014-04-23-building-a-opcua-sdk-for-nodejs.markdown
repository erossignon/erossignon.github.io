---
layout: post
title: "Building a OPCUA SDK for nodejs"
date: 2014-04-23 21:38
comments: true
published: false
categories: [ OPC/UA, opensource ]
---


I started Node-OPCUA back in January 2014 as a innocent challenge born after a discussion with one of my colleague,
involved in [OPC/UA](http://en.wikipedia.org/wiki/OPC_Unified_Architecture) on his day to day work.

I wanted to assess whether it was possible to build a complete OPC/UA stack from scratch by only using the
[official specification documents](https://opcfoundation.org/developer-tools/specifications-unified-architecture) provided by the [OPC foundation](https://opcfoundation.org/) as a starting point.

To make things funnier, I stated that it should be implemented using a modern language, expecially suited for
client/server operation, for which no implementation of the OPC/UA stack existed yet.


Why NodeJS ?
------------

I wanted to implement the OPC/UA SDK in NodeJS, one of the hottest new trendy technology to date.
NodeJS is a server-side javascript framework based on Google V8 javascript engine.
NodeJS provides a powerful runtime environment that makes it easy to
asynchronous application. By providing asynchronous programming

One solution that came to mind was to reuse the "C" Stack provided by the OPC Foundation.
This is the approach used by Wim at [UAF](http://github.com/uaf/uaf), a python wrapper.
In my case, this would required to wrap the "C" stack into a V8 extension, using a technique I already experienced
a while back when I created [node-occ](http://github.comm/erossignon/node-occ) a solid-modeling module for nodejs that
wraps [OpenCascade](http://opencascade.org).

Why TDD ?
---------


References:
 - [OPC/UA ebook](http://www.commsvr.com/UAModelDesigner/Index.aspx)


