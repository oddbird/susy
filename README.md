Power Tools For The Web
=======================

[![npm version](https://badge.fury.io/js/susy.svg)](https://badge.fury.io/js/susy)<br />
[![Build Status](https://travis-ci.org/oddbird/susy.png?branch=master)](https://travis-ci.org/oddbird/susy)


Susy is a design-agnostic set of tools
for creating powerful, custom layouts.
We didn't want another grid system
full of rules and restrictions —
we wanted a power tool
for building our own damn systems.
Version Three is trimmed down to it's most basic components —
functions that can be used to build any grid system.

- [Susy Website](http://oddbird.net/susy/) |
  [@SassSusy](http://twitter.com/sasssusy/)
- [Susy3 Intro](http://oddbird.net/2017/06/28/susy3) |
  [Spread in Susy3](http://oddbird.net/2017/06/13/susy-spread)
- [Susy3 Documentation](http://oddbird.net/susy/docs/)
- [Susy1/Susy2 Documentation](http://susy.readthedocs.io)


Quotes
------

> "I like the idea of grids-on-demand,
> rather than a strict framework."<br />
> – Chris Coyier, [CSS Tricks](http://css-tricks.com/build-web-layouts-easily-susy/)

> "Susy and Zendesk have been getting along magically…
> It’s precisely what you need and nothing more."<br />
> — Stephany Varga, [Zendesk](https://medium.com/zendesk-creative-blog/responsive-a-harrowing-meditation-on-the-brutal-realities-of-web-content-organization-in-5-acts-1d33ce25f062)

> "If you’re interested in reading Sass poetry,
> be sure to look at Susy’s source code!"<br />
> — Hugo Giraudel, [SitePoint](http://www.sitepoint.com/my-favorite-sass-tools/)


Resources
---------

- [OddBird](http://oddbird.net/) | [@OddBird](http://twitter.com/oddbird/)
- [Sites using Susy](http://oddbird.net/susy/sites/)
- [Changelog](https://github.com/oddbird/susy/blob/master/CHANGELOG.md)
- [Guidelines for contributing](https://github.com/oddbird/susy/blob/master/CONTRIBUTING.md)
- [BSD3 License](https://github.com/oddbird/susy/blob/master/LICENSE.txt)


Installation
------------

```
npm install susy
```

There are two imports to choose from.
The default `sass/susy` comes with
un-prefixed versions of the core API functions.
If you want Susy to be name-spaced,
import `sass/susy-prefix` instead.

```scss
// un-prefixed functions
@import '<path-to>/susy/sass/susy';

// susy-prefixed functions
@import '<path-to>/susy/sass/susy-prefix';
```


### Using [Eyeglass](http://eyeglass.rocks/)

With eyeglass set up,
you can `@import 'susy';`
without providing the npm-modules path.


### Using Webpack

Make sure `sass-loader` is installed:

```bash
npm install sass-loader --save-dev
```

Make sure you have sass-loader enabled in your webpack configuration:

```javascript
// webpack.config.js
module: {
  rules: [
    {
      test: /\.scss$/,
      use: ['style-loader', 'css-loader', 'sass-loader']
    }
  ]
}
```

Start using Susy:

```scss
/* app.scss */
@import "~susy/sass/susy";
```


### Using Gulp

Add a gulp task:

```javascript
// gulpfile.js
gulp.task('sass', function() {
  return gulp.src('scss/*.scss')
      .pipe(sass({
          outputStyle: 'compressed',
          includePaths: ['node_modules/susy/sass']
      }).on('error', sass.logError))
      .pipe(gulp.dest('dist/css'));
});
```

Start using Susy:

```scss
/* app.scss */
@import 'susy';
```

### Using Grunt (and Yeoman)

To add Susy to the Sass task,
edit your `Gruntfile.js` at the root level of your project
and look for the Sass-related rules.
Add `require: 'susy'` inside the options object:

```javascript
// Gruntfile.js
sass: {
  dist: {
    options: {
      style: 'expanded',
      require: 'susy'
    },
    files: {
      'css/style.css': 'scss/style.scss'
    }
  }
}
```

Assuming you’ve already installed Susy,
it will now be added to the project
and will not clash with Yeoman's grunt rules.

Start using Susy:

```scss
/* app.scss */
@import 'susy';
```


Susy vs Su
----------

You may notice that some functions have a `susy-` prefix,
while others only have `su-`.
This helps distinguish between the two distinct layers:

- The core grid-math layer is called **Su**,
  and is made up of "pure" functions
  that expect normalized values.
  This is useful if you prefer argument-syntax to shorthand syntax,
  or if you are building your own Susy mixins.
- The upper **Susy** layer provides syntax-sugar –
  global defaults, shorthand-parsing, normalization,
  and a smaller set of common-use functions
  that call on the core math as necessary.
  This is the primary API for most users.
