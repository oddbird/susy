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

We're planning to build various output-modules
with mixins to help you get started.
We'll probably start with a float-based module,
and a flexbox module.
If you have ideas for another plugin,
or want to help move floats or flexbox along,
pull requests are welcome!


Getting Started
---------------

You can install Susy as a rubygem,
npm module, bower package, or git repo.

```
npm install susy@pre
```

There are two imports to choose from.
The default `sass/_susy.scss` comes with
un-prefixed versions of the core API functions.
If you want Susy to be name-spaced,
import `sass/_prefix.scss` instead.

```scss
@import '../node_modules/susy/sass/susy';
```


Spanning Columns & Gutters
--------------------------

There are two core funtions:
`span()` (or `susy-span()`),
and `gutter()` (or `susy-gutter()`).

The **gutter** function returns
the width of a single gutter on your grid —
to be applied as you see fit:

```scss
.example {
  margin: susy-gutter();
}
```

The **span** function
describes a span of one or more columns,
and any relevant gutters along the way:

```scss
.example {
  // the width of three columns, and the two intervening gutters
  width: susy-span(3);
}
```

When nesting fluid grids,
you can use the old `of $n` syntax
to describe changes in context —
e.g. `susy-span(3 of 6)`.
When using asymmetrical grids,
you can use the old `at $n`, `first`, or `last` syntax
to describe the specific columns you want to span —
e.g. `susy-span(3 at 2 of (1 2 3 4 5 6))`
to span across `(2 3 4)`.

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


Defining Grids
--------------

A grid is defined by a series of `columns`
with optional `gutters` between them.

**Columns** are described by a list of numbers,
representing the relative width of each column.
By default, a grid is fluid —
but you can add units to create a static layout:

```scss
// six equal fluid columns
$equal: (1 1 1 1 1 1);

// six equal 5em columns
$static: (5em 5em 5em 5em 5em 5em);

// six unequal fluid columns
$asymmetrical: (1 1 2 3 5 8);

// six unequal fluid columns
// you can mix units, as long as they are comparable...
$strange: (1in 1cm 2pt 3mm 5in 8cm);
```

Since `(1 1 1 1 1 1)` is so repetative,
we've provided a shorthand syntax
for describung equal columns:

```scss
// six equal fluid columns (shorthand)
$fluid: 6;

// six 120px static columns (shorthand)
// that's a lowercase 'x' — not a star or any other symbol...
$static: 6 x 120px;
```

**Gutters**
are defined relative to columns,
in comparable units.
Both settings go together
in a single map variable:

```scss
// fluid 4-column grid
// with gutters 1/4 the size of a column
$fluid: (
  'columns': 4;
  'gutters': 0.25;
);

// Static un-equal grid
// with comparable gutters
$static: (
  'columns': (1em 1em 2em 3em 5em 8em)
  'gutters': 0.25em;
);
```

Anything you put in the root `$susy` variable map
will be treated as a global default
across your project.


Advanced Features
-----------------

Once you get used to the basics,
you can dig into the `spread` options —
allowing you to include extra gutters in a span —
and the `susy-slice()` function
that can help you handle nesting-context with asymmetrical grids.

Happy grid-building!


Resources
---------

- [Website](http://susy.oddbird.net/)
- [Documentation](http://susydocs.oddbird.net/)
- [Sites using Susy](http://susy.oddbird.net/sites-using-susy/)
- [Twitter @SassSusy](http://twitter.com/Sasssusy/)
