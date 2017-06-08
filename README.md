Power Tools For The Web
=======================

[![Build Status](https://travis-ci.org/oddbird/susy.png?branch=threeish)](https://travis-ci.org/oddbird/susy)

Susy is a design-agnostic set of tools
for creating powerful, custom layouts.
We didn't want another grid system
full of rules and restrictions —
we wanted a power tool
for building our own damn systems.
Version Three is trimmed down to it's most basic components —
functions that can be used to build any grid system.

> I like the idea of grids-on-demand, rather than a strict framework.<br />
> – Chris Coyier, CSS Tricks


Getting Started
---------------

Install Susy:

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
loaders: [
  {
    test: /\.scss$/,
    loader: 'style!css!sass'
  }
]
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

### Usig Grunt (and Yeoman)

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
and will not clash with Yeomans grunt rules.

Start using Susy:

```scss
/* app.scss */
@import 'susy';
```


Undestanding Spread & Container-Spread
--------------------------------------

Susy3 has two core settings you may not recognize
from older versions of Susy:
`spread` and `container-spread`.
Every grid system (especially fluid grids)
will have to make a decision about how containers
and grid elements spread across adjacent gutters.
These were previously defined by the `gutter-position` setting,
but we hope this provides more flexibility and clarity.

- Both spread settings default to `narrow`,
  the most common use-case.
  A `narrow` spread only has gutters *between* columns
  (one less gutter than columns).
  This is how all css-native grids work,
  and most margin-based grid systems.
- A `wide` spread includes the same number of gutters as columns,
  spanning across a single side-gutter.
  This is how most padding-based grid systems often work,
  and is also useful for pushing and pulling elements into place.
- The rare `wider` spread includes gutters
  on both sides of the column-span
  (one more gutters than columns).

[![Spread Diagram](https://raw.githubusercontent.com/oddbird/susy/threeish/spread.jpg)][spread]

[spread]: https://codepen.io/mirisuzanne/pen/EgmJJp?editors=1100

The `spread` property describes your target output,
while `container-spread` describes your context,
for the sake of fluid grids.

If you are in a "wide" context,
that means the parent element contains
as many gutters as columns.
To describe a "narrow" span inside that "wide" context:

```scss
width: span(3 narrow of 6 wide);
```


Get Creative
------------

Since the Susy API functions return length values
instead of HTML properties,
how you apply the math is up to you.
Susy works great with `float`, `flexbox`,
`inline-block`, `table`, and any other layout technique you use.
You can even use it with CSS Grid,
but it doesn't provide much advantage.

Here's a real-quick class-based grid system,
like you might find in one of the other frameworks:

```scss
.span {
  float: left;
  margin-right: gutter();

  &.last {
    margin-right: 0;
  }
}

@for $span from 1 through susy-get('columns') {
  .span-#{$i} {
    width: span($i);
  }
}
```

[Read the docs](http://susydocs.oddbird.net/)
for more details on configuration
and available functions.



Plugin: SVG Grid Image
----------------------

If you want to generate svg-backgrounds
for help visualizing and debugging your grids,
import the SVG Grid Plugin:

```
// unprefixed
@import '<path-to>/susy/sass/plugins/svg-grid';

// prefixed
@import '<path-to>/susy/sass/plugins/svg-grid/prefix';
```

The plugin adds `svg-grid-colors` setting
to your global defaults,
which you can override in `$susy`.
It also provides you with a new function,
`susy-svg-grid()`,
which will return inline svg for use in
backgrounds or generated content:

```scss
// usage
background: susy-svg-grid() no-repeat scroll;

// output sample
background: url('data:image/svg+xml,%3Csvg xmlns="http://www.w3.org/2000/svg"
                 fill="%239cc" %3E%3Crect x="1em" width="44.44444%"
                 height="100%" /%3E%3Crect x="55.55556%" width="44.44444%"
                 height="100%" style="transform:translateX(1em)"
                 /%3E%3C/svg%3E') no-repeat scroll;
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



Resources
---------

- [OddBird](http://oddbird.net/)
- [Susy Website](http://susy.oddbird.net/)
- [Twitter @SassSusy](http://twitter.com/sasssusy/)
- [BSD3 License](https://github.com/oddbird/susy/blob/master/LICENSE.txt)
- [Live Documentation](http://susydocs.oddbird.net/)
- [Sites using Susy](http://susy.oddbird.net/sites-using-susy/)
- [Guidelines for contributing](https://github.com/oddbird/susy/blob/master/CONTRIBUTING.md)
