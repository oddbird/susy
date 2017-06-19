Power Tools For The Web
=======================

[![npm version](https://badge.fury.io/js/susy.svg)](https://badge.fury.io/js/susy)<br />
[![Build Status](https://travis-ci.org/oddbird/susy.png?branch=threeish)](https://travis-ci.org/oddbird/susy)

Susy is a design-agnostic set of tools
for creating powerful, custom layouts.
We didn't want another grid system
full of rules and restrictions —
we wanted a power tool
for building our own damn systems.
Version Three is trimmed down to it's most basic components —
functions that can be used to build any grid system.


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

- [OddBird](http://oddbird.net/)
- [Susy Website](http://susy.oddbird.net/)
- [Twitter @SassSusy](http://twitter.com/sasssusy/)
- [BSD3 License](https://github.com/oddbird/susy/blob/master/LICENSE.txt)
- [Live Documentation](http://susydocs.oddbird.net/)
- [Sites using Susy](http://susy.oddbird.net/sites-using-susy/)
- [Guidelines for contributing](https://github.com/oddbird/susy/blob/master/CONTRIBUTING.md)



Configuration Overview
----------------------

Susy3 has 4 core settings, in a single settings map:

```scss
// default settings
$susy: (
  'columns': susy-repeat(4),
  'gutters': 0.25,
  'spread': 'narrow',
  'container-spread': 'narrow',
);
```

You'll notice a few differences from Susy2.

**Columns** no longer accept a single number, like `12`,
but use a syntax more similar to the CSS property
[grid-template-columns][columns] –
a list of relative sizes for each column on the grid,
with unitless numbers acting similar to `fr` units in CSS.
Use the `susy-repeat()` function (similar to the new css `repeat()`)
to quickly establish equal-width columns.

- `susy-repeat(12)` will create 12 fluid, equal-width columns
- `susy-repeat(6, 120px)` will create 6 equal `120px`-wide columns
- `120px susy-repeat(4) 120px` will create 6 columns,
  the first and last are `120px`,
  while the middle 4 are equal fractions of the remainder.
  Susy will output `calc()` values in order to achieve this.

[columns]: https://developer.mozilla.org/en-US/docs/Web/CSS/grid-template-columns

**Gutters** haven't changed –
a single fraction or explicit width –
but the `calc()` output feature
means you can now use any combination of units and fractions
to create static-gutters on a fluid grid, etc.

**Spread** existed in the Susy2 API as a span option,
and was otherwise handled behind the scenes.
Now we're giving you full control over all spread issues.
You can find a more [detailed explanation of spread on the blog][spread].

[spread]: https://codepen.io/mirisuzanne/pen/EgmJJp?editors=1100

You can access your global settings at any time
with the `susy-settings()` function,
or grab a single setting from the global scope
with `susy-get('columns')`, `susy-get('gutters')` etc.



Shorthand Overview
------------------

All functions draw on the same shorthand syntax in two parts,
seperated by the word `of`.
The first part describes the
**span** `width`, `location`, and `spread` in any order.
Only the width is required:

```scss
// <width> <location> <spread>
$span: 2;
$spread: 3 wide;

// location is only needed with asymmetrical grids
$location: 3 at 2 narrow;
```

The second half of Susy's shorthand
describes the grid-**context**
`columns`, `container-spread`, and `gutters`
in any order.
None are required:

```scss
// of <columns> <container-spread> <gutters>
$columns: of 6;
$spread: of 12 wide;
$gutters: of 12 set-gutters 2em;
```

A single unitless number for `columns`
will be treated as a slice of the parent grid.
On a grid with `columns: susy-repeat(12, 120px)`,
the shorthand `of 4` will use the parent `120px` column-width.
you can also be more explicit,
and say `of susy-repeat(4, 100px)`.
If you are using asymmetrical grids,
like the `(1 1 2 3 5 8)` example above,
Susy can't slice it for you without knowing which slice you want.
The `slice` function accepts exactly the same syntax as `span`,
but returns a list of columns rather than a width.
Use it in your context like `of slice(first 3)`.


Function Overview
-----------------

Use the `span()` and `gutter()` functions
to build the grid system that fits you best.

**Span** will return the width of a span across grid-columns,
and any intermediate gutters.
Apply the results to a `width` or `flex-basis` property
to size your grid elements,
or use it with `padding`, `margin`, and `translateX()`
to move your elements around.

The span mixin only requires a span width,
but accepts the full shorthand:
`span(first 3 wide of (1 1 2 3 5 8) wide set-gutters 20px)`.

**Gutter** will return the width of a single gutter,
and only accepts the second context-half of the shorthand
(with or without `of` at the start):
`gutter()`.

With those two functions, you can build anything –
using floats, flexbox, tables, inline-block,
or any other layout technique you love.

```scss
.float {
  width: span(3);
  margin-right: gutter();
}

.flexbox {
  flex: 1 1 span(3);
  padding: 0 gutter() / 2;
}

.push-3 {
  margin-left: span(3 wide);
}
```

Here's a real-quick class system,
like you might find in one of the other frameworks:

```scss
.span {
  float: left;
  margin-right: gutter();

  &:last-child {
    margin-right: 0;
  }
}

@for $span from 1 through length(susy-get('columns')) {
  .span-#{$span} {
    width: span($span);
  }
}
```

[Read the docs](http://susydocs.oddbird.net/)
for more details on configuration
and available functions.



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
background: susy-svg-grid() no-repeat scroll;
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
