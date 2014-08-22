---
layout: post
title: "how to find the version of the V8 my nodejs engine is using "
date: 2014-08-22 21:58
comments: true
categories:    [ nodejs   development , v8  ]
---

## how to find the version of the V8 my nodejs engine is using "?


* if you can run nodejs, you can simple execute the following command
 ``` 
  $ node -e "console.log(process.versions['node'],process.versions['v8'])"
 ``` 

* if you cannot run nodejs

  1. read the nodejs Release note at http://nodejs.org/changelog.html
  2. scan the file to detect when the V8 engine was upgrade and note the corresponding node version.


### nodejs versions and the matching V8 version  
  
|date       | nodejs            | V8 version |
|-----------|-------------------|------------|
|2014.08.19 | 0.10.31           | 3.14.5.9  |
|2013.05.24 | 0.10.8 (stable)   | 3.14.5.9  |
|13.03.11 | 0.10.0 (stable)   | 3.14.5  |
|2013.03.01 | 0.9.11            | downgraded to v3.14.5    |
|2013.02.19 | 0.9.10            | 3.15.11.15|
|2013.01.24 | 0.9.8             | 3.15.11.10|
|2013.01.18 | 0.9.7             | 3.15.11.7 |
|2013.01.11 | 0.9.6             | 3.15.11.5 |
|2012.10.24 | 0.9.3(unstable)             | 3.13.7.4  |
|2012.10.25 | 0.8.13            | 3.11.10.25|
|2012.09.11 | 0.8.9			    | 3.11.10.22|
|2012.08.22 | 0.8.8             | 3.11.10.19|
|2012.07.25 | 0.8.4				| 3.11.10.17|
|2012.07.19 | 0.8.3				| 3.11.10.15|
|2012.06.29 | 0.8.1				| 3.11.10.12|
|2012.06.25 | 0.8.0(stable)			| 3.11.10.10|
|2012.05.28 | 0.7.9			    | 3.11.1|
|2012.01.23 | 0.7.1		        | 3.8.8 |
|2012.01.07 | 0.7 (unstable)    | 3.8.6 |
|2012.04.30 | 0.6.16            | 3.6.6.25  |
|2012.03.02 | 0.6.12           | 3.6.6.24  |

Finding the V8 engine of the current unstable release (V0.11) requires that you investigate the specific changelog file. For instance, looking at http://nodejs.org/dist/v0.11.13/docs/changelog.html 
 
 * here are the extracted versions: 	
   
   
|date       | nodejs            | V8 version |
|-----------|-------------------|------------|
| 2014.05.01 | 0.11.13 (Unstable) |[3.24.35.22](http://upstream-tracker.org/changelogs/v8/3.24.35.22/changelog.html) |
| 2014.01.09 | 0.11.11 (Unstable) |3.22.24.19 |
| 2013.12.31 | 0.11.10 (Unstable) |3.22.24.10 |
| 2013.08.21 | 0.11.7             |3.20.17|
| 2013.08.21 | 0.11.6			  |3.20.14.1|
| 2013.08.06 | 0.11.5             |3.20.11|
| 2013.07.12 | 0.11.4             |3.20.2|
| 2013.06.26 | 0.11.3             |3.19.13|
| 2013.05.13 | 0.11.2             |3.19.0|
| 2013.04.19 | 0.11.1	          |3.18.0|
| 2013.04.19 | 0.11.0	          |3.17.13|
