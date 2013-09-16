**README
Assignment 1 - Optimizing Frogger
Created 9/15/13
By AJ Jenkins**

*Performance analysis of my Frogger game before any optimizations*
[Link to game](http://tuftsdev.github.io/comp120-ajenkins/frogger/index.html)

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

*Optimizations Performed*



