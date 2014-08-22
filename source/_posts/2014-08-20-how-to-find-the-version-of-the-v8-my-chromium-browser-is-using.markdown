---
layout: post
title: "how to find the version of the V8 my Chromium browser is using"
date: 2014-08-22 21:58
comments: true
categories:    [ nodejs   development , V8 ]
---
## how to find the version of the V8 my Chromium browser is using ?

### if you want to find the V8 engine of the version of chrome you are currently running

1. visit the chrome://version/ page
2. get the version of the "javascript" engine.

###### if don't have a instance of Chrome running with the version you want to investigate

1. check the version of Chrome using the "About" command.
   For instance, let say it's '36.0.1985.143' .
1. navigate to:
	```http://src.chromium.org/viewvc/chrome/releases/[VERSION]/DEPS``` 
	( replace [VERSION] with the actual string you found at step 1).
	In our example, this will be  
	[http://src.chromium.org/viewvc/chrome/releases/36.0.1985.143/DEPS](http://src.chromium.org/viewvc/chrome/releases/36.0.1985.143/DEPS).
This file,  maintained by the Chrome development team contains the description of all the dependencies and components used by Chrome, their location and their version number.
1. Inside this file, search for the line containing ```Var("v8")```.
It will look like:
 ```language
 Var("v8") + '/branches/3.26@22818',
 ```
1. That's it ! the corresponding V8 engine version is 3.26

 |-| Chromium Version  | V8 version |
 |-----|-------------------|------------|
 |     |36.0.1985.143 Windows     | v3.26@22818      |
 |     |36.0.1985.125 Ubuntu 14.04 (283153) | v3.26@21981 |
 |     |36.0.1985.57  IPhone    | v3.26@21367 |

This is explained in greater details in [this post](http://ariya.ofilabs.com/2012/02/find-v8-version-of-certain-chrome-release.html)
