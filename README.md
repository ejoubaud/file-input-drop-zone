File Input Drop Zone
====================

A simple jQuery plugin that adds drag'n'drop support to a file input.

It applies to a container (`div` or whatever) that contains :

* a file input (`<input type='type' />`)
* optionnaly an `img` tag for image preview

That container is your drop zone. When you drop a file inside, it assigns it to the file input and, optionnaly if it's an image, displays an preview.

When you change the selected file via the input, the preview is uploaded too.

Features
========

* **No AJAX :** No need for extra server-side code, whatever handled your regular file input will do the job
* **Supports old browsers :** Your user can still use the input field in browsers that don't enable drag'n'drop
* **Very light :** Less than 1kb for the minified js
* **No scripting required :** Just include jQuery, `file-input-drop-zone.js` and add a `file-input-drop-zone` class to the div containing your input, and you're ready to go
* **No stylesheet needed :** Style your zone and preview image however you want
* **Customizable :** Disable preview or assign whatever preview zone/input field you want through options (see source)

Browser Support
===============

Works fully with :

* Chrome
* IE10 ? (not tested yet but should work)

Works partly (no drag n drop but preview update is Ok) with :

* Firefox - will work fully once `files` property is not readonly anymore, so please [vote up the issue](https://bugzilla.mozilla.org/show_bug.cgi?id=757664)
* Safari

Degrades gracefully (the file input still does its job) with :

* IE9-

Demo
====

Clone this repo and play with the `demo.html`, or fork [this jsFiddle](http://jsfiddle.net/ejoubaud/PdNvd/last/).