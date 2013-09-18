###README
###Assignment 1 - Optimizing Frogger
###Created 9/15/13
###By AJ Jenkins


####Performance analysis of my Frogger game before any optimizations
[Link to game](http://tuftsdev.github.io/comp120-ajenkins/frogger/)

- Google PageSpeed Insights -

Mobile: 66/100
Desktop: 83/100

Suggested Optimizations:
!! Eliminate render-blocking Javascript and CSS in above-the-fold content
! Minify Javascript

All other tests passed

- YSLOW(v2) -

Grade (A), Overall performance score 92

The page has a total of 6 HTTP requests and a total weight of 482.5K bytes with empty 
cache

A - Make fewer HTTP requests
D - Use a CDN
A - Avoid empty src or href
E - Add Expires headers
A - Compress components with gzip
A - Put CSS at top
B - Put Javascript at bottom
A - Avoid CSS expressions
n/a - Make Javascript and CSS external
A - Reduce DNS lookups
B - Minify Javascript and CSS
A - Avoid URL redirects
A - Remove duplicate Javascript and CSS
A - Configure entity tags
A - Make AJAX cacheable
A - Use GET for AJAX requests
A - Reduce the number of DOM elements
A - Avoid HTTP 404 (Not Found) error
A - Reduce cookie size
B - Use cookie-free domains
A - Avoid AlphaImageLoader filter
A - Do not scale images in HTML
B - Make favicon small and cacheable

- Chrome Developer Tools (Network) -
DOMContentLoaded event fired - 1.20 s
Load event fired - >1.60 s

jquery.min.map - Not Found (404)

Requests sorted by Time (in milliseconds):
jquery-ui.js = 908
song.ogg = 589
jquery-1.9.1.min.js = 534
game.js = 214
style.css = 183
jquery.min.map (Not Found) = 168
jump.wav = 167
frogger_sprites.png = 162
index.html = 24

####Optimizations Performed

* Removed commented out code from index.html
* Removed empty lines from index.html
* Removed jquery-ui reference
* Moved line that starts game on page load into game.js (i.e., removed inline script from index.html)
* Moved script tags out of head into the bottom of the body
* Switched from jQuery 1.9.1 to 2.0.3, because it's a smaller file
* Minified my Javascript file for game (used jscompress.com)
* Concatenated jQuery and my script into one file, cat_script.js

####Optimizations Not Performed
* I chose not to include the map file for jQuery, because they said it would not affect performance, only developer debugging experience.
* YSLOW said I wasn't using expires headers, but PageSpeed said I was, and Github Pages doesn't let you change it anyway.
* I did not move my CSS file out of the head, because when I did what PageSpeed suggested (put it at below the html tags as noscript), the CSS didn't load at all.
* I also chose not to load Javascript asynchronously because the whole application is Javascript, so the user needs to wait for it to load anyway.

####How I tested the offline application cache
1. Loaded the page online
2. Turned off my wifi
3. Refreshed the page

####Performance analysis of game after optimizations
[Link to game](http://tuftsdev.github.io/comp120-ajenkins/performance/)

- Google PageSpeed Insights -

Mobile: 83/100 (From 63/100)
Desktop: 93/100 (From 83/100)

Suggested Optimizations:
!! Eliminate render-blocking Javascript and CSS in above-the-fold content
~~! Minify Javascript~~

All other tests passed

- YSLOW(v2) -

Grade (A), Overall performance score 96 (From 92)

The page has a total of 4 HTTP requests (from 6) and a total weight of 41.3K bytes (from 482.5K) with empty cache

A - Make fewer HTTP requests
D - Use a CDN
A - Avoid empty src or href
*D (from E) - Add Expires headers*
A - Compress components with gzip
A - Put CSS at top
A (from B) - Put Javascript at bottom
A - Avoid CSS expressions
n/a - Make Javascript and CSS external
A - Reduce DNS lookups
*A (from B) - Minify Javascript and CSS*
A - Avoid URL redirects
A - Remove duplicate Javascript and CSS
A - Configure entity tags
A - Make AJAX cacheable
A - Use GET for AJAX requests
A - Reduce the number of DOM elements
A - Avoid HTTP 404 (Not Found) error
A - Reduce cookie size
*A (from B) - Use cookie-free domains*
A - Avoid AlphaImageLoader filter
A - Do not scale images in HTML
B - Make favicon small and cacheable

- Chrome Developer Tools (Network) -
*When Loading from Cache*
DOMContentLoaded event fired - 370 ms (from 1.20 s)
Load event fired - 330 ms (from >1.60 s)

*Incognito Mode*
DOMContentLoaded event fired - 370 ms (from 1.20 s)
Load event fired - 410 ms (from >1.60 s)

Requests sorted by Time (in milliseconds):
song.ogg = 3 (from 589) - loaded from cache
cat_script.min.js = 68
style.css = 3 (from 183)
jump.wav = 2 (from 167) - loaded from cache
frogger_sprites.png = 21 (from 162)
index.html = 51 (from 24)
