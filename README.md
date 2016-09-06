Power Tools For The Web
=======================

[![Build Status](https://travis-ci.org/oddbird/susy.png?branch=threeish)](https://travis-ci.org/oddbird/susy)

Susy is an agnostic set of tools
for creating powerful, custom layouts.
We didn't want another grid system
full of rules and restrictions —
we wanted a power tool
for building our own damn systems.

Do It Yourself.
Your Markup,
Your Layout —
*Our Math*


Getting Started
---------------

Susy v3 is trimmed down to it's most basic components —
functions that can be used to build any grid system.

There are four global settings to understand,
and two of them are identical:

Columns
~~~~~~~

The `columns` setting describes the columns in your grid.
The most basic syntax uses a list of numbers
to describe the relative size of each column.

```scss
// five equal columns
$symmetrical: (1 1 1 1 1);

// six fibonacci columns
$asymmetrical: (1 1 2 3 5 8);
```

If you want static grids,
you can add units to the numbers —
as long as all the units are comparable.

```scss
// five equal static columns
$symmetrical: (120px 120px 120px 120px 120px);

// six not-fibonacci static columns
$asymmetrical: (1in 1cm 2pt 3mm 5in 8cm);
```

That can get repetative
when you are working with symmetrical grids,
so we've provided a symmetrical shorthand.

```scss
// five equal fluid columns (shorthand)
$fluid: 5;

// five equal static columns (shorthand)
$static: 5 x 120px;
```

That static-symmetrical shorthand
is technically a list.
The first value is a unitless number,
representing the number of columns in the grid.
The second value is the letter "x"
(not a star or times symbol).
The third value is the static width of your columns.

Gutters
~~~~~~~

The `gutters` setting describes the space between
(and sometimes around)
your columns.
It is always defined in units
comparable to the rest of your grid.

```scss
// fluid 4-column grid, with gutters 1/4 the size of a column
$columns: (1 1 1 1);
$gutters: 0.25;

// Static em-based grid, with 0.25em gutters
$columns: (1em 1em 2em 3em 5em 8em)
$gutters: 0.25em;
```

There is a special case
allowing you to use static gutters in a fluid grid,
but that's too advanced for a quick-start guide.


Spread & Container-Spread
~~~~~~~~~~~~~~~~~~~~~~~~~

The concept of `spread`
helps us describe what gutters to include
in a grid span or container.
There are three options:
`narrow`, `wide`, and `wider`.

Imagine a four-column grid.
How many gutters are in that grid?

- The most common answer is `3`.
  Gutters only exist between the columns —
  `c1 (g1) c2 (g2) c3 (g3) c4`.
  We call that option `narrow`,
  and it is the default value for both
  spans and containers.

- The other common answer is `5`,
  if we want to include gutters on the outside edges —
  `(g1) c1 (g2) c2 (g3) c3 (g4) c4 (g5)`.
  We call that option `wider`.

- Less commonly,
  you might want only one edge gutter
  either before or after —
  `c1 (g1) c2 (g2) c3 (g3) c4 (g4)` —
  leaving your with `4` gutters.
  We call that `wide`.

Spread and container-spread work in the same way,
but one applies to a span,
and the other applies to the parent context
when calculating relative widths.
If you are using static grids,
the `container-spread` isn't used.

In most cases,
you can set the default spread for a project,
and never look back.
Sometimes,
when you are pushing and pulling
elements around on the grid,
it is helpful to add and remove gutters on the fly.


Resources
---------

- [Website](http://susy.oddbird.net/)
- [Documentation](http://susydocs.oddbird.net/)
- [Sites using Susy](http://susy.oddbird.net/sites-using-susy/)
- [Twitter @SassSusy](http://twitter.com/Sasssusy/)
