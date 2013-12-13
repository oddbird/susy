Settings
========

The new default syntax for Susy
is based around a number of settings
that can be written either as a Sass Map
or using a shorthand syntax.
These two definitions are interchangeable:

.. code-block:: scss

  $map: (
    columns: 12,
    gutters: 1/4,
    layout-math: fluid,
    layout-method: float,
    gutter-position: inside,
  );

  $shorthand: 12 1/4 fluid float inside;

Either format can be passed as a single argument
to the functions and mixins that make up the Susy language.
They can even be mixed and matched:

.. code-block:: scss

  $map: (
    columns: 12,
    gutters: .25,
    layout-math: fluid,
  );

  @include set-grid($map float inside);

Unless otherwise noted,
all the settings can be controlled both globally
(by setting the site-wide default)
or locally
(passed to individual functions and mixins).

Global Defaults
---------------

You can create any setting-maps you need
for storing different layouts,
but you can also set a global default
for Susy to use as fallback.
That map is simply called ``$susy``.

You can set the defaults directly in the ``$susy`` variable:

.. code-block:: scss

  $susy: (
    columns: 12,
    gutters: .25,
    gutter-position: inside,
  )

You can set them using ``set-grid`` along with the shorthand syntax:

.. code-block:: scss

  @include set-grid(12 .25 inside);

Or you can temporarily set defaults
for a small section of your code
with ``use-grid``:

.. code-block:: scss

  @include use-grid(8 static) {
    // an 8-column static grid...
  }


Flow
----

*Establishes the reading direction of your document,
either left-to-right, or right-to-left.*

- **scope:** global, local
- **options:** ``rtl`` | ``ltr``
- **default:** ``ltr``

1. ``ltr``:
   Layout elements will flow from left to right.
2. ``rtl``:
   Layout elements will flow from right to left.


Layout Math
-----------

*Determines the output units for calculating grid spans,
either relative to a container,
or a multiplier of the ``column-width``.*

- **setting:** ``layout-math``
- **scope:** global, local
- **options:** ``fluid`` | ``static``
- **default:** ``fluid``

1. ``fluid``:
   All internal grid spans will be calculated relative to the container,
   and output as ``%`` values.
2. ``static``:
   All internal grid values will be calculated
   as multiples of the ``column-width`` setting.
   If you set column-width to ``4em``,
   your grid widths will be output as ``em`` values.


Layout Method
-------------

*Determines the layout technique.
Currently only two variations of the float method are supported.*

- **setting:** ``layout-method``
- **scope:** global, local
- **options:** ``float`` | ``isolate``
- **default:** ``float``

1. ``float``:
   Floats are the most common form of layout used on the web.
2. ``isolate``:
   Isolation is a `trick`_ developed by `John Albin Wilkins`_
   to help fix `sub-pixel rounding`_ bugs in fluid, floated layouts.
   You can think of it like absolute positioning of floats.
   We find it to be very useful for spot-checking the worst rounding bugs,
   but we think it's overkill as a layout technique all to itself.

- **todo:** Add support for ``inline-block`` and ``flexbox`` layouts.

.. _trick: http://www.palantir.net/blog/responsive-design-s-dirty-little-secret
.. _sub-pixel rounding: http://tylertate.com/blog/2012/01/05/subpixel-rounding.html
.. _John Albin Wilkins: http://john.albin.net/


Gutter Position
---------------

*Determines how and where gutters are added to the layout,
either as padding or margins on layout elements.*

- **setting:** ``gutter-position``
- **scope:** global, local
- **options:** ``before`` | ``after`` | ``split`` | ``inside`` | ``inside-static``
- **default:** ``after``

1. ``before``:
   Gutters are added as ``margin`` before a layout element,
   relative to the flow direction
   (left-margin for ltr, right-margin for rtl).
   The first gutter on each row will need to be removed.
2. ``after``:
   Gutters are added as ``margin`` after a layout element,
   relative to the flow direction.
   The last gutter on each row will need to be removed.
3. ``split``:
   Gutters are added as ``margin`` on both sides of a layout element,
   and are not removed at the edges of the grid.
4. ``inside``:
   Gutters are added as ``padding`` on both sides of a layout element,
   and are not removed at the edges of the grid.
5. ``inside-static``:
   Gutters are added as static ``padding`` on both sides of a layout element,
   even in a fluid layout context,
   and are not removed at the edges of the grid.


Container
---------

*Determines the width of the containing element.*

- **setting:** ``container``
- **scope:** global, local [container only]
- **options:** ``<length>`` | ``auto``
- **default:** ``auto``

1. ``<length>``
2. ``auto``


Container Position
------------------

*Determines the position of the container in the viewport.*

- **setting:** ``container-position``
- **scope:** global, local [container only]
- **options:** ``left`` | ``center`` | ``right`` | ``<offset> [<offset>]``
- **default:** ``center``

1. ``left``
2. ``center``
3. ``right``
4. ``<offset> [<offset>]``


Columns
-------

- **setting:** ``columns``
- **scope:** global, local
- **options:** ``<list>`` | ``<number>``
- **default:** ``12``

1. ``<list>``
2. ``<number>``


Gutters
-------

- **setting:** ``gutters``
- **scope:** global, local
- **options:** ``<ratio>``
- **default:** ``1/4``

1. ``<ratio>``


Column Width
------------

- **setting:** ``column-width``
- **scope:** global, local
- **options:** ``<length>`` | ``false``
- **default:** ``false``

1. ``<length>``
2. ``false``


Box Sizing
----------

- **setting:** ``global-box-sizing`` [global scope],
  ``box-sizing`` [local scope]
- **scope:** global, local
- **options:** ``border-box`` | ``content-box``
- **default:** ``content-box``

1. ``global-box-sizing`` vs ``box-sizing``
2. ``border-box`` vs ``content-box``


Last Flow
---------

- **setting:** ``last-flow``
- **scope:** global
- **options:** ``from`` | ``to``
- **default:** ``to``

1. ``from``
2. ``to``


Show Grids
----------

- **setting:** ``show-grids``
- **scope:** global, local [container only]
- **options:** ``show`` | ``hide`` | ``show-columns`` | ``show-baseline``
- **default:** ``hide``

1. ``show``
2. ``hide``
3. ``show-columns``
4. ``show-baseline``


Layout Shorthand
----------------

**syntax:** [ ``<container>`` ``<columns>`` ``<gutters/column-width>`` ``<keywords...>`` ]


Span Shorthand
--------------

**syntax:** ``<span>`` [ ``at`` ``<location>`` ``of`` ``<global-context>`` ]


Gutter Shorthand
----------------

**syntax** [ ``<gutter-override>`` ``of`` ] ``<global-context>``


