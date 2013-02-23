---
title: Grid Types
stylesheet: "grid-types.css"
pagenav: >
  <ul>
    <li><a href="#demo-magic">Magic</a></li>
    <li><a href="#demo-fluid">Fluid</a></li>
    <li><a href="#demo-static">Static</a></li>
    <li><a href="#demo-mix">Mixing <span class="amp">&</span> Matching</a></li>
  </ul>
---

## Different Grid Types

You can build grids of all kinds with Susy.
Define your grid using any unit of measurement
(ems, pixels, percentages, inches, etc.)
and then determine how and when
you want that grid to respond to the viewport.

Susy converts all internal grid-widths into percentages,
so that once you have a grid
it is **able** to respond and flex in any way you choose.
How the grid responds depends on the outer container.

Here are a few examples
of grids with different container styles.

### <a href="#demo-magic" id="demo-magic">The Magic Grid</a>

The default grid in Susy is what I call "the magic grid".
Fluid on the inside,
with an elastic container max-width.
The em-width makes it responsive to font sizes,
while the max-width setting makes it responsive to window sizes.

    :::scss
    // Setting up the Magic Grid
    $total-columns: 12; // 12 columns
    $column-width: 4em; // columns are 4em wide
    $gutter-width: 1em; // with 1em gutters
    $grid-padding: 1em; // and 1em padding on the grid container

    .magic-container { @include container; }

<aside class="magic-container">
  <h4>Magic grid: <b>.magic-container</b></h4>
  <p>
    12 columns,
    4em width,
    1em gutters,
    1em padding.
    Magic.
  </p>
</aside>

What we've defined is a simple elastic grid,
but by default the outer container width
will be set as a max-width,
making this a magic grid.

You can also have px-based magic grids,
and so on,
though I find them somewhat less magical.
What makes it a magic grid
is the fact that it collapses with the browser at smaller sizes,
but remains set-width at larger sizes.

There is a more complete
[mobile-first magic grid demo](/demos/magic/)
if you are interested.

### <a href="#demo-fluid" id="demo-fluid">The Fluid Grid</a>

There are many ways to build a fluid grid with Susy.
You could simply replace all the em-widths above
with percentage widths.
But that's actually the hard way,
unless you know exactly what percentages you want to use.
Let me show you some easier options.

Say you want to build a fluid grid
based on the [960gs](http://960.gs/) dimensions:

    :::scss
    // A Fluid Grid based on 960gs
    $total-columns: 12;
    $column-width: 60px;
    $gutter-width: 20px;
    $grid-padding: 10px;

That's a good start.
We now have a 960px magic grid.
Turning that into a fluid grid is simple:

    :::scss
    // Make it fluid!
    $container-style: fluid;

    .fluid-container { @include container; }

<aside class="fluid-container">
  <h4>Fluid grid #1: <b>.fluid-container</b></h4>
  <p>
    12 columns,
    60px initial width,
    20px initial gutters,
    10px initial padding.
    Fluid.
  </p>
</aside>

That's it.
You have a fluid grid
based on the dimensions of the 960gs.
By default the container is set to 100% width,
but you can override that as well:

    :::scss
    // Make it smaller
    $container-width: 60%;

    .fluid-60-container { @include container; }

<aside class="fluid-60-container">
  <h4>Fluid grid #2: <b>.fluid-60-container</b></h4>
  <p>Same as above, but contained at 60%.</p>
</aside>

### <a href="#demo-static" id="demo-static">The Static Grid</a>

Perhaps you don't want your grid to respond
to the size of the viewport at all.
By telling Susy you want a "static" grid,
Susy will apply your container-width
directly to the "width" property.

This is your more standard grid type.
Most "elastic" and "fixed" grids fit this category.
Unlike the magic grid, it doesn't collapse.

Let's take our first grid and make it static:

    :::scss
    // Setting up the Static Grid
    $total-columns: 12;
    $column-width: 4em;
    $gutter-width: 1em;
    $grid-padding: 1em;

    $container-style: static;

    .static-container { @include container; }

<aside class="static-container">
  <h4>Static elastic grid: <b>.static-container</b></h4>
  <p>
    12 columns,
    4em width,
    1em gutters,
    1em padding.
    Static.
  </p>
</aside>

### <a href="#demo-mix" id="demo-mix">Mixing and matching</a>

Using those same 4 basic settings,
and the two advanced override settings,
you can create nearly any grid without doing any math.

Want the 960 grid system
updated to 1140px?

    :::scss
    // The 960gs in 1140px
    $total-columns: 12;
    $column-width: 60px;
    $gutter-width: 20px;
    $grid-padding: 10px;

    $container-style: static;
    $container-width: 1140px;

    .larger-960-container { @include container; }

<aside class="larger-960-container">
  <h4>Larger 960-based grid: <b>.larger-960-container</b></h4>
  <p>
    12 columns,
    60px width,
    20px gutters,
    10px padding.
    Static,
    1140px total width.
  </p>
</aside>

Why not make it elastic and magic?

    :::scss
    // The 960gs in ems
    $total-columns: 12;
    $column-width: 60px;
    $gutter-width: 20px;
    $grid-padding: 10px;

    $container-style: magic;
    $container-width: 60em;

    .elastic-960-container { @include container; }

<aside class="elastic-960-container">
  <h4>Elastic 960 grid: <b>.elastic-960-container</b></h4>
  <p>
    12 columns,
    60px width,
    20px gutters,
    10px padding.
    Magic elastic,
    60em total width.
  </p>
</aside>

Or we can make a magic-elastic grid,
defined in percentages:

    :::scss
    // Elastic grid as percentages
    $total-columns: 12;
    $column-width: 6%;
    $gutter-width: 2%;
    $grid-padding: 1%;

    $container-style: magic;
    $container-width: 50em;

    .elastic-percentage-container { @include container; }

<aside class="elastic-percentage-container">
  <h4>Elastic magic grid, defined as percentages: <b>.elastic-percentage-container</b></h4>
  <p>
    12 columns,
    6% width,
    2% gutters,
    1% padding.
    Magic elastic,
    50em total width.
  </p>
</aside>

Play around.
Start to add breakpoints,
with different grids at different sizes,
or just pick the grid best suited for your site:
magic-elastic,
magic-fixed,
static-elastic,
static-fixed,
fluid,
defined as one but displayed as another...
The possibilities are endless.
Have fun!
