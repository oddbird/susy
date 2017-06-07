Power Tools For The Web
=======================

[![Build Status](https://travis-ci.org/oddbird/susy.png?branch=threeish)](https://travis-ci.org/oddbird/susy)

Susy is an agnostic set of tools
for creating powerful, custom layouts.
We didn't want another grid system
full of rules and restrictions —
we wanted a power tool
for building our own damn systems.

Version Three is trimmed down to it's most basic components —
functions that can be used to build any grid system.
This is truely a grids-on-demand approach,
where you build your own system,
and we handle the math.


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



Defining Grids
--------------

The grid is defined in a single map variable,
with four initial properties:

```scss
// The factory defaults…
$susy: (
  'columns': susy-repeat(4),
  'gutters': 0.5,
  'spread': 'narrow',
  'container-spread': 'narrow',
);
```

Columns and gutters are conceptually similar
to native CSS `grid-template-columns`
and `grid-column-gap`,
with a few simplifications.



Defining Columns
----------------

Columns are described by a list of numbers,
representing the relative width of each column.
This is a simplified adaptation of the CSS-native
[grid-template-columns](https://developer.mozilla.org/en-US/docs/Web/CSS/grid-template-columns)
syntax:

```scss
// six equal fluid columns
// (use unitless numbers in place of `fr` unit)
$susy: (
  'columns': 1 1 1 1 1 1
);

// six equal 5em columns
$susy: (
  'columns': 5em 5em 5em 5em 5em 5em
);

// six unequal fluid columns
$susy: (
  'columns': 1 1 2 3 5 8
);

// six unequal mixed-unit columns
// (if units can't be compared, Susy will output a calc() value)
$susy: (
  'columns': 1in 1cm 2pt 3mm 5in 8cm
);
```

Since this syntax can be repetative,
we also provide a function
that mimics the native-CSS `repeat()`
for generating grid-column definitions:

```scss
// six equal fluid columns (1 1 1 1 1 1)
$susy: (
  'columns': susy-repeat(6)
);

// six 120px static columns
$susy: (
  'columns': susy-repeat(6, 120px)
);

// 12 columns, alternating 4em and 6em
$susy: (
  'columns': susy-repeat(6, 4em 6em)
);

// Mixing it up
$susy: (
  'columns': 120px susy-repeat(4) 120px
);
```


Defining Gutters
----------------

Gutters are defined as a single width,
or fluid ratio.
This is similar to the native-CSS
[grid-column-gap](https://developer.mozilla.org/en-US/docs/Web/CSS/grid-column-gap)
syntax:

```scss
// fluid 4-column grid
// with gutters 1/4 the size of a column
$fluid: (
  'columns': susy-repeat(4),
  'gutters': 0.25,
);

// Static un-equal grid
// with comparable gutters
$static: (
  'columns': (1em 1em 2em 3em 5em 8em),
  'gutters': 0.25em,
);
```

Anything you put in the root `$susy` variable map
will be treated as a project default.
Create configuration maps under different variable names,
and you can pass in on-the-fly settings
to override the defaults as-needed.



Spread & Container-Spread
-------------------------

Susy3 has two core settings you may not recognize
from older versions of Susy:
`spread` and `container-spread`.
These define the way columns and gutters relate to each other,
and were previously defined by the `gutter-position` setting.
By making spread explicit,
we hope to provide more flexibility.

- Both spread settings default to `narrow`,
  the most common use-case.
  A `narrow` spread only has gutters *between* columns
  (one less gutter than columns).
- A `wide` spread includes the same number of gutters as columns,
  spanning across a single side-gutter.
- The rare `wider` spread includes gutters
  on both sides of the column-span
  (one more gutters than columns).

[![Spread Diagram](https://github.com/oddbird/susy/blob/threeish/spread.jpg)][spread]

[spread]: https://codepen.io/mirisuzanne/pen/EgmJJp?editors=1100

The `spread` property describes your target output,
while `container-spread` describes your context,
for the sake of fluid grids.



Spanning Columns & Gutters
--------------------------

There are two core funtions in the Susy3 API,
each with an unprefixed alias by default:
`span()` (or `susy-span()`),
and `gutter()` (or `susy-gutter()`).

The **gutter** function returns
the width of a single gutter on your grid —
to be applied as you see fit:

```scss
.example {
  margin: gutter();
}
```

The **span** function
describes a span of one or more columns,
and any relevant gutters along the way:

```scss
.example {
  // the width of three columns, and the two intervening gutters
  width: span(3);
}
```

- When nesting symmetrical grids,
  you can use the old `of $n` syntax
  to describe changes in context —
  e.g. `span(3 of 6)`.
- When nesting asymmetrical grids,
  you can use the old `at $n`, `first`, or `last` syntax
  to describe the specific columns you want to span —
  e.g. `span(3 at 2 of (1 2 3 4 5 6))`
  to span across `(2 3 4)`.
  (Note that Susy calculates the proper span-width,
  but does not automatically move elements to the proper location)
- To define new gutter-values in the shorthand syntax,
  use `set-gutters $n`.

You can use these two functions
to build all sorts of grids:

```scss
.float {
  float: left;
  width: span(3);
  margin-right: gutter();
}

.flexbox {
  flex-basis: span(3);
  padding: gutter() / 2;
}


// Make your own class system!
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


Debugging Plugin: SVG Grid Image
--------------------------------

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



Advanced Features
-----------------

Once you get used to the basics,
you can dig into some of the more advanced features:

- Use the `susy-slice()` function
  to handle nesting-context with asymmetrical grids.
- Use `susy-compile()` and `su-call()`
  to quickly access the full power of Susy's
  syntax-parsing, normalization, and math engines,
  while building plugins of your own.

Happy griding!



Susy vs Su
----------

The Susy code is roughly divided into two layers.

- The core grid-math layer is called **Su**,
  and is made up of "pure" functions
  that expect normalized values.
  Most users will never access Su directly,
  unless building a more involved plugin.
- The **Susy** layer provides extra syntax-sugar –
  with defaults, shorthand-parsing, normalization,
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
