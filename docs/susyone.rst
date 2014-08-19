Susy One
========

This is documentation for the old syntax,
used in Susy 1.

If you are using Susy 2
and want use the old syntax,
change your import from ``susy`` to ``susyone``.

.. code-block:: scss

  // With Susy 2 installed...
  @import "susyone";


----------------------------------------------------------------------

.. _susyone-basic-settings:

Basic Settings
--------------

- **Container**: The root element of a *Grid*.
- **Layout**: The total number of *Columns* in a grid.
- **Grid Padding**: Padding on the sides of the *Grid*.
- **Context**: The number of *Columns* spanned by the parent element.
- **Omega**: Any *Grid Element* spanning the last *Column* in its *Context*.


.. _susyone-total-columns:

Total Columns
~~~~~~~~~~~~~

The number of Columns in your default Grid Layout.

.. code-block:: scss

  // $total-columns: <number>;
  $total-columns: 12;

- ``<number>``: Unitless number.


.. _susyone-column-width:

Column Width
~~~~~~~~~~~~

The width of a single Column in your Grid.

.. code-block:: scss

  // $column-width: <length>;
  $column-width: 4em;

- ``<length>``: Length in any unit of measurement (em, px, %, etc).


.. _susyone-gutter-width:

Gutter Width
~~~~~~~~~~~~

The space between Columns.

.. code-block:: scss

  // $gutter-width: <length>;
  $gutter-width: 1em;

- ``<length>``: Units must match ``$column-width``.


.. _susyone-grid-padding:

Grid Padding
~~~~~~~~~~~~

Padding on the left and right of a Grid Container.

.. code-block:: scss

  // $grid-padding: <length>;
  $grid-padding: $gutter-width;  // 1em

- ``<length>``: Units should match the container width
  (``$column-width`` unless ``$container-width`` is set directly).


----------------------------------------------------------------------

.. _susyone-functions:

Functions
---------

Where a mixin returns property/value pairs, functions return simple values
that you can put where you want, and use for advanced math.


.. _susyone-columns:

Columns
~~~~~~~

Similar to ``span-columns`` mixin,
but returns the math-ready ``%`` multiplier.

.. code-block:: scss

  // columns(<$columns> [, <$context>, <$style>])
  .item { width: columns(3,6); }

- ``<$columns>``: The number of *Columns* to span,
- ``<$context>``: The *Context*.
  Default: ``$total-columns``.
- ``<$style>``: Optionally return ``static`` lengths for grid calculations.
  Default: ``$container-style``.


.. _susyone-gutter:

Gutter
~~~~~~

The ``%`` width of one gutter in any given context.

.. code-block:: scss

  // gutter([<$context>, <$style>])
  .item { margin-right: gutter(6) + columns(3,6); }

- ``<$context>``: The *Context*.
  Default: ``$total-columns``.
- ``<$style>``: Optionally return ``static`` lengths for grid calculations.
  Default: ``$container-style``.


.. _susyone-space:

Space
~~~~~

Total ``%`` space taken by Columns, including internal AND external gutters.

.. code-block:: scss

  // space(<$columns> [, <$context>, <$style>])
  .item { margin-right: space(3,6); }

- ``<$columns>``: The number of *Columns* to span,
- ``<$context>``: The *Context*.
  Default: ``$total-columns``.
- ``<$style>``: Optionally return ``static`` lengths for grid calculations.
  Default: ``$container-style``.


----------------------------------------------------------------------

.. _susyone-basic-mixins:

Basic Mixins
------------


.. _susyone-container:

Container
~~~~~~~~~

Establish the outer grid-containing element.

.. code-block:: scss

  // container([$<media-layout>]*)
  .page { @include container; }

- ``<$media-layout>``: Optional media-layout shortcuts
  (see *Responsive Grids* below).
  Default: ``$total-columns``.


.. _susyone-span-columns:

Span Columns
~~~~~~~~~~~~

Align an element to the Susy Grid.

.. code-block:: scss

  // span-columns(<$columns> [<omega> , <$context>, <$padding>, <$from>, <$style>])
  nav { @include span-columns(3,12); }
  article { @include span-columns(9 omega,12); }

- ``<$columns>``: The number of *Columns* to span.
  - ``<omega>``: Optional flag to signal the last element in a row.
- ``<$context>``: Current nesting *Context*.
  Default: ``$total-columns``.
- ``<$padding>``: Optional padding applied inside an individual grid element.
  Given as a length (same units as the grid)
  or a list of lengths (from-direction to-direction).
  Default: ``false``.
- ``<$from>``: The origin direction of your document flow.
  Default: ``$from-direction``.
- ``<$style>``: Optionally return ``static`` lengths for grid calculations.
  Default: ``$container-style``.


.. _susyone-omega:

Omega
~~~~~

Apply to any omega element as an override.

.. code-block:: scss

  // omega([<$from>])
  .gallery-image {
    @include span-columns(3,9); // each gallery-image is 3 of 9 cols.
    &:nth-child(3n) { @include omega; } // every third image completes a row.
  }

- ``<$from>``: The origin direction of your document flow.
  Default: ``$from-direction``.


.. _susyone-nth-omega:

Nth-Omega
~~~~~~~~~

Apply to any element as an nth-child omega shortcut.
Defaults to ``:last-child``.

.. code-block:: scss

  // nth-omega([<$n>, <$selector>, <$from>])
  .gallery-image {
    @include span-columns(3,9); // each gallery-image is 3 of 9 cols.
    @include nth-omega(3n); // same as omega example above.
  }

- ``<$n>``: The keyword or equation to select: ``[first | only | last | <equation>]``.
  An equation could be e.g. ``3`` or ``3n`` or ``'3n+1'``.
  Note that quotes are needed to keep complex equations
  from being simplified by Compass.
  Default: ``last``.
- ``<$selector>``: The type of element, and direction to count from:
  ``[child | last-child | of-type | last-of-type ]``.
  Default: ``child``.
- ``<$from>``: The origin direction of your document flow.
  Default: ``$from-direction``.


----------------------------------------------------------------------

.. _susyone-responsive-mixins:

Responsive Mixins
-----------------

- **Breakpoint**: A min- or max- viewport width at which to change *Layouts*.
- **Media-Layout**: Shortcut for declaring *Breakpoints* and *Layouts* in Susy.

.. code-block:: scss

  // $media-layout: <min-width> <layout> <max-width> <ie-fallback>;
  // - You must supply either <min-width> or <layout>.
  $media-layout: 12;          // Use 12-col layout at matching min-width.
  $media-layout: 30em;        // At min 30em, use closest fitting layout.
  $media-layout: 30em 12;     // At min 30em, use 12-col layout.
  $media-layout: 12 60em;     // Use 12 cols up to max 60em.
  $media-layout: 30em 60em;   // Between min 30em & max 60em, use closest layout.
  $media-layout: 30em 12 60em;// Use 12 cols between min 30em & max 60em.
  $media-layout: 60em 12 30em;// Same. Larger length will always be max-width.
  $media-layout : 12 lt-ie9;  // Output is included under ``.lt-ie9`` class,
                              // for use with IE conditional comments
                              // on the <html> tag.

- ``<$min/max-width>``: Any length with units, used to set media breakpoints.
- ``<$layout>``: Any (unitless) number of columns to use for the grid
  at a given breakpoint.
- ``<$ie-fallback>``: Any string to use as a fallback class
  when mediaqueries are not available.
  Do not include a leading "``.``" class-signifier,
  only the class name ("``lt-ie9``", not "``.lt-ie9``").
  This can be anything you want:
  "``no-mediaqueries``", "``ie8``", "``popcorn``", etc.


.. _susyone-at-breakpoint:

At-Breakpoint
~~~~~~~~~~~~~

At a given min- or max-width Breakpoint, use a given Layout.

.. code-block:: scss

  // at-breakpoint(<$media-layout> [, <$font-size>]) { <@content> }
  @include at-breakpoint(30em 12) {
    .page { @include container; }
  }

- ``<$media-layout>``: The *Breakpoint/Layout* combo to use (see above).
- ``<$font-size>``: Browsers interpret em-based media-queries
  using the browser default font size (``16px`` in most cases).
  If you have a different base font size for your site,
  we have to adjust for the difference.
  Tell us your base font size, and we'll do the conversion.
  Default: ``$base-font-size``.
- ``<@content>``: Nested ``@content`` block will use the given *Layout*.


.. _susyone-layout:

Layout
~~~~~~

Set an arbitrary Layout to use with any block of content.

.. code-block:: scss

  // layout(<$layout-cols>) { <@content> }
  @include layout(6) {
    .narrow-page { @include container; }
  }

- ``<$layout-cols>``: The number of *Columns* to use in the *Layout*.
- ``<@content>``: Nested ``@content`` block will use the given *Layout*.


.. _susyone-set-container-width:

Set Container Width
~~~~~~~~~~~~~~~~~~~

Reset the width of a Container for a new Layout context.
Can be used when ``container()`` has already been applied to an element,
for DRYer output than using ``container`` again.

.. code-block:: scss

  // set-container-width([<$columns>, <$style>])
  @include container;
  @include at-breakpoint(8) {
    @include set-container-width;
  }

- ``<$columns>``: The number of *Columns* to be contained.
  Default: Current value of ``$total-columns`` depending on *Layout*.
- ``<$style>``: Optionally return ``static`` lengths for grid calculations.
  Default: ``$container-style``.


.. _susyone-with-settings:

With Grid Settings
~~~~~~~~~~~~~~~~~~

Use different grid settings for a block of code -
whether the same grid at a different breakpoint,
or a different grid altogether.

.. code-block:: scss

  // with-grid-settings([$<columns>, $<width>, <$gutter>, <$padding>]) { <@content> }
  @include with-grid-settings(12,4em,1.5em,1em) {
    .new-grid { @include container; }
  };

- ``<$columns>``: Overrides the ``$total-columns`` setting for all contained elements.
- ``<$width>``: Overrides the ``$column-width`` setting for all contained elements.
- ``<$gutter>``: Overrides the ``$gutter-width`` setting for all contained elements.
- ``<$padding>``: Overrides the ``$grid-padding`` setting for all contained elements.
- ``<@content>``: Nested ``@content`` block will use the given grid settings.


----------------------------------------------------------------------

.. _susyone-box-sizing:

Box Sizing
----------


.. _susyone-border-box-mixin:

Border-Box Sizing
~~~~~~~~~~~~~~~~~

Set the default box-model to ``border-box``,
and adjust the grid math accordingly.

.. code-block:: scss

  // border-box-sizing()
  @include border-box-sizing;

This will apply border-box model to all elements
(using the star selector)
and set ``$border-box-sizing`` to ``true``.
You can use the variable on it's own to adjust the grid math,
in cases where you want to apply the box-model separately.


----------------------------------------------------------------------

.. _susyone-isolation:

Isolation
---------

.. _susyone-isolate:

Isolate
~~~~~~~

Isolate the position of a grid element relative to the container.
This should be used in addition to ``span-columns``
as a way of minimizing sub-pixel rounding errors in specific trouble locations.

.. code-block:: scss

  // isolate(<$location> [, <$context>, <$from>, <$style>])
  @include span-columns(4); // 4-columns wide
  @include isolate(2); // positioned in the second column

- ``<$location>``: The container-relative column number to position on.
- ``<$context>``: Current nesting *Context*.
  Default: ``$total-columns``.
- ``<$from>``: The origin direction of your document flow.
  Default: ``$from-direction``.
- ``<$style>``: Optionally return ``static`` lengths for grid calculations.
  Default: ``$container-style``.


.. _susyone-isolate-grid:

Isolate Grid
~~~~~~~~~~~~

Isolate a group of elements in a grid (such as an image gallery)
using nth-child or nth-of-type for positioning.
Provide the column-width of each element,
and Susy will determine the positioning for you.

.. code-block:: scss

  // isolate-grid(<$columns> [, <$context>, <$selector>, <$from>, <$style>])
  .gallery-item {
    @include isolate-grid(3);
  }

- ``<$columns>``: The number of *Columns* for each item to span.
- ``<$context>``: Current nesting *Context*.
  Default: ``$total-columns``.
- ``<$selector>``: either 'child' or 'of-type'.
  Default: ``child``.
- ``<$from>``: The origin direction of your document flow.
  Default: ``$from-direction``.
- ``<$style>``: Optionally return ``static`` lengths for grid calculations.
  Default: ``$container-style``.


----------------------------------------------------------------------

.. _susyone-padding:

Padding Mixins
--------------


.. _susyone-prefix:

Prefix
~~~~~~

Add Columns of empty space as ``padding`` before an element.

.. code-block:: scss

  // prefix(<$columns> [, <$context>, <$from>, <$style>])
  .box { @include prefix(3); }

- ``<$columns>``: The number of *Columns* to be added as ``padding`` before.
- ``<$context>``: The *Context*.
  Default: ``$total-columns``.
- ``<$from>``: The origin direction of your document flow.
  Default: ``$from-direction``.
- ``<$style>``: Optionally return ``static`` lengths for grid calculations.
  Default: ``$container-style``.


.. _susyone-suffix:

Suffix
~~~~~~

Add columns of empty space as padding after an element.

.. code-block:: scss

  // suffix(<$columns> [, <$context>, <$from>, <$style>])
  .box { @include suffix(2); }

- ``<$columns>``: The number of *Columns* to be added as ``padding`` after.
- ``<$context>``: The *Context*.
  Default: ``$total-columns``.
- ``<$from>``: The origin direction of your document flow.
  Default: ``$from-direction``.
- ``<$style>``: Optionally return ``static`` lengths for grid calculations.
  Default: ``$container-style``.


.. _susyone-pad:

Pad
~~~

Shortcut for adding both Prefix and Suffix ``padding``.

.. code-block:: scss

  // pad([<$prefix>, <$suffix>, <$context>, <$from>, <$style>])
  .box { @include pad(3,2); }

- ``<$prefix>``: The number of *Columns* to be added as ``padding`` before.
- ``<$suffix>``: The number of *Columns* to be added as ``padding`` after.
- ``<$context>``: The *Context*.
  Default: ``$total-columns``.
- ``<$from>``: The origin direction of your document flow.
  Default: ``$from-direction``.
- ``<$style>``: Optionally return ``static`` lengths for grid calculations.
  Default: ``$container-style``.


.. _susyone-bleed:

Bleed
~~~~~

Add negative margins and matching positive padding to an element,
so that its background "bleeds" outside its natural position.

.. code-block:: scss

  // bleed(<$width> [<$sides>, <$style>])
  @include bleed(2);

- ``<$width>``: The number of *Columns* or arbitrary length to bleed.
  Use ``2 of 12`` syntax for context in nested situations.
- ``<$sides>``: The sides of the element that should bleed.
  Default: ``left right``.
- ``<$style>``: Optionally return ``static`` lengths for grid calculations.
  Default: ``$container-style``.


----------------------------------------------------------------------

.. _susyone-margin:

Margin Mixins
-------------


.. _susyone-pre:

Pre
~~~

Add columns of empty space as margin before an element.

.. code-block:: scss

  // pre(<$columns> [, <$context>, <$from>, <$style>])
  .box { @include pre(2); }

- ``<$columns>``: The number of *Columns* to be added as ``margin`` before.
- ``<$context>``: The *Context*.
  Default: ``$total-columns``.
- ``<$from>``: The origin direction of your document flow.
  Default: ``$from-direction``.
- ``<$style>``: Optionally return ``static`` lengths for grid calculations.
  Default: ``$container-style``.


.. _susyone-post:

Post
~~~~

Add columns of empty space as margin after an element.

.. code-block:: scss

  // post(<$columns> [, <$context>, <$from>, <$style>])
  .box { @include post(3); }

- ``<$columns>``: The number of *Columns* to be added as ``margin`` after.
- ``<$context>``: The *Context*.
  Default: ``$total-columns``.
- ``<$from>``: The origin direction of your document flow.
  Default: ``$from-direction``.
- ``<$style>``: Optionally return ``static`` lengths for grid calculations.
  Default: ``$container-style``.


.. _susyone-squish:

Squish
~~~~~~

Shortcut to add empty space as margin before and after an element.

.. code-block:: scss

  // squish([<$pre>, <$post>, <$context>, <$from>, <$style>])
  .box { @include squish(2,3); }

- ``<$pre>``: The number of *Columns* to be added as ``margin`` before.
- ``<$post>``: The number of *Columns* to be added as ``margin`` after.
- ``<$context>``: The *Context*.
  Default: ``$total-columns``.
- ``<$from>``: The origin direction of your document flow.
  Default: ``$from-direction``.
- ``<$style>``: Optionally return ``static`` lengths for grid calculations.
  Default: ``$container-style``.


.. _susyone-push:

Push
~~~~

Identical to ``pre``.

.. code-block:: scss

  // push(<$columns> [, <$context>, <$from>, <$style>])
  .box { @include push(3); }


.. _susyone-pull:

Pull
~~~~

Add negative margins before an element, to pull it against the flow.

.. code-block:: scss

  // pull(<$columns> [, <$context>, <$from>, <$style>])
  .box { @include pull(2); }

- ``<$columns>``: The number of *Columns* to be subtracted as ``margin`` before.
- ``<$context>``: The *Context*.
  Default: ``$total-columns``.
- ``<$from>``: The origin direction of your document flow.
  Default: ``$from-direction``.
- ``<$style>``: Optionally return ``static`` lengths for grid calculations.
  Default: ``$container-style``.


----------------------------------------------------------------------

.. _susyone-reset:

Reset Mixins
------------


.. _susyone-reset-column:

Reset Columns
~~~~~~~~~~~~~

Resets an element to default block behaviour.

.. code-block:: scss

  // reset-columns([<$from>])
  article { @include span-columns(6); }     // articles are 6 cols wide
  #news article { @include reset-columns; } // but news span the full width
                                            // of their container

- ``<$from>``: The origin direction of your document flow.
  Default: ``$from-direction``.


.. _susyone-remove-omega:

Remove-Omega
~~~~~~~~~~~~

Apply to any previously-omega element
to reset it's float direction and margins
to match non-omega grid elements.
Note that unlike omega,
this requires a context when nested.

.. code-block:: scss

  // remove-omega([<$context>, <$from>, <$style>])
  .gallery-image {
    &:nth-child(3n) { @include remove-omega; } // 3rd images no longer complete rows.
  }

- ``<$context>``: Current nesting *Context*.
  Default: ``$total-columns``.
- ``<$from>``: The origin direction of your document flow.
  Default: ``$from-direction``.
- ``<$style>``: Optionally return ``static`` lengths for grid calculations.
  Default: ``$container-style``.


.. _susyone-remove-nth-omega:

Remove Nth-Omega
~~~~~~~~~~~~~~~~

Apply to any previously nth-omega element
to reset it's float direction and margins
to match non-omega grid elements.
Note that unlike omega,
this requires a context when nested.

.. code-block:: scss

  // remove-nth-omega([<$n>, <$selector>, <$context>, <$from>, <$style>])
  .gallery-image {
    @include remove-nth-omega(3n); // same as remove-omega example above.
  }

- ``<$n>``: The keyword or equation to select: ``[first | only | last | <equation>]``.
  An equation could be e.g. ``3`` or ``3n`` or ``'3n+1'``.
  Note that quotes are needed to keep a complex equation from being simplified by Compass.
  Default: ``last``.
- ``<$selector>``: The type of element, and direction to count from:
  ``[child | last-child | of-type | last-of-type ]``.
  Default: ``child``.
- ``<$context>``: Current nesting *Context*.
  Default: ``$total-columns``.
- ``<$from>``: The origin direction of your document flow.
  Default: ``$from-direction``.
- ``<$style>``: Optionally return ``static`` lengths for grid calculations.
  Default: ``$container-style``.


----------------------------------------------------------------------

.. _susyone-debug:

Debugging
---------


.. _susyone-grid-background:

Susy Grid Background
~~~~~~~~~~~~~~~~~~~~

Show the Susy Grid as a background-image on any container.

.. code-block:: scss

  // susy-grid-background();
  .page { @include susy-grid-background; }

- If you are using the ``<body>`` element as your *Container*,
  you need to apply a background to the ``<html>`` element
  in order for this grid-background to size properly.
- Some browsers have trouble with sub-pixel rounding on background images.
  Use this for checking general spacing, not pixel-exact alignment.
  Susy columns tend to be more accurate than gradient grid-backgrounds.


----------------------------------------------------------------------

.. _susyone-container-override:

Container Override Settings
---------------------------


.. _susyone-container-width:

Container Width
~~~~~~~~~~~~~~~

Override the total width of your grid with an arbitrary length.

.. code-block:: scss

  // $container-width: <length> | <boolean>;
  $container-width: false;

- ``<length>``: Length in em, px, %, etc.
- ``<boolean>``: True or false.


.. _susyone-container-style:

Container Style
~~~~~~~~~~~~~~~

Override the type of shell containing your grid.

.. code-block:: scss

  // $container-style: <style>;
  $container-style: magic;

- ``<style>``: ``magic`` | ``static`` | ``fluid``.

  + ``magic``: Susy's magic grid has a set width,
    but becomes fluid rather than overflowing the viewport at small sizes.
  + ``static``: Susy's static grid will retain the width defined in your settings
    at all times.
  + ``fluid``: Susy's fluid grid will always be based on the viewport width.
    The percentage will be determined by your grid settings,
    or by ``$container-width``, if either is set using ``%`` units.
    Otherwise it will default to ``auto`` (100%).


----------------------------------------------------------------------

.. _susyone-direction-override:

Direction Override Settings
---------------------------


.. _susyone-from-direction:

From Direction
~~~~~~~~~~~~~~

The side of the Susy Grid from which the flow starts.
For ltr documents, this is the left.

.. code-block:: scss

  // $from-direction: <direction>;
  $from-direction: left;

- ``<direction>``: ``left`` | ``right``


.. _susyone-omega-float:

Omega Float
~~~~~~~~~~~

The direction that Omega elements should be floated.

.. code-block:: scss

  // $omega-float: <direction>;
  $omega-float: opposite-position($from-direction);

- ``<direction>``: ``left`` | ``right``


----------------------------------------------------------------------

.. _susyone-compass-options:

Compass Options
---------------


.. _susyone-base-font-size:

Base Font Size
~~~~~~~~~~~~~~

From the `Compass Vertical Rhythm`_ module,
Susy uses your base font size to help manage
em-based media-queries.

.. code-block:: scss

  // $base-font-size: <px-size>;
  $base-font-size: 16px;

- ``<px-size>``: Any length in ``px``.
  This will not actually effect your font size
  unless you use other Vertical Rhythm tools,
  we just need to know.
  See `Compass Docs`_ for further usage details.

.. _Compass Vertical Rhythm: http://compass-style.org/reference/compass/typography/vertical*rhythm/
.. _Compass Docs: http://compass-style.org/reference/compass/typography/vertical*rhythm/#const-base-font-size


.. _susyone-browser-support:

Browser Support
~~~~~~~~~~~~~~~

Susy recognizes all the `Compass Browser Support`_ variables,
although only IE6 and IE7 have special cases attached to them currently.

.. code-block:: scss

  // $legacy-support-for-ie  : <boolean>;
  // $legacy-support-for-ie6 : <boolean>;
  // $legacy-support-for-ie7 : <boolean>;
  $legacy-support-for-ie  : true;
  $legacy-support-for-ie6 : $legacy-support-for-ie;
  $legacy-support-for-ie7 : $legacy-support-for-ie;

- ``<boolean>``: ``true`` | ``false``

.. _Compass Browser Support: http://compass-style.org/reference/compass/support/


----------------------------------------------------------------------

.. _susyone-breakpoint-output:

Breakpoint Output
-----------------

If you are compiling seperate files for IE-fallbacks,
it can be useful to output only the modern code in one file
and only the fallbacks in another file.
You can make ``at-breakpoint`` do exactly that
by using the following settings.


.. _susyone-media-output:

$breakpoint-media-output
~~~~~~~~~~~~~~~~~~~~~~~~

Turn off media-query output for IE-only stylesheets.

.. code-block:: scss

  // $breakpoint-media-output: <boolean>;
  $breakpoint-media-output: true;

- ``<boolean>``: ``true`` | ``false``


.. _susyone-ie-output:

$breakpoint-ie-output
~~~~~~~~~~~~~~~~~~~~~

Turn off media-query fallback output for non-IE stylesheets.

.. code-block:: scss

  // $breakpoint-ie-output: <boolean>;
  $breakpoint-ie-output: true;

- ``<boolean>``: ``true`` | ``false``


.. _susyone-raw-output:

$breakpoint-raw-output
~~~~~~~~~~~~~~~~~~~~~~

Pass through raw output
without media-queries or fallback classes
for IE-only stylesheets.

.. code-block:: scss

  // $breakpoint-raw-output: <boolean>;
  $breakpoint-raw-output: false;

- ``<boolean>``: ``true`` | ``false``
