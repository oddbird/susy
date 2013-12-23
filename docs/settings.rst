Settings
========

The new syntax for Susy
is based around a number of settings
that can be written either as a Sass Map
or using a :doc:`shorthand syntax <shorthand>`.
These two definitions are interchangeable:

.. code-block:: scss

  $map: (
    columns: 12,
    gutters: 1/4,
    math: fluid,
    output: float,
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
    math: fluid,
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

*Set the flow direction of your document,
similar to the html ``dir`` attribute.*

- **scope:** global, local
- **options:** ``rtl`` | ``ltr``
- **default:** ``ltr``

1. ``ltr``:
   Layout elements will flow from left to right.
2. ``rtl``:
   Layout elements will flow from right to left.


Math
----

*Toggle between static and fluid (relative) math.*

- **setting:** ``math``
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


Output
------

*Toggle between output layout styles.*

- **setting:** ``output``
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

.. _trick: http://www.palantir.net/blog/responsive-design-s-dirty-little-secret
.. _sub-pixel rounding: http://tylertate.com/blog/2012/01/05/subpixel-rounding.html
.. _John Albin Wilkins: http://john.albin.net/


Gutter Position
---------------

*Set how and where gutters are added to the layout,
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

*Set the width of the containing element.*

- **setting:** ``container``
- **scope:** global, local [container only]
- **options:** ``<length>`` | ``auto``
- **default:** ``auto``

1. ``<length>``:
   Set any explicit lenght (e.g. ``60em`` or ``80%``),
   and it will be applied directly to the container.
2. ``auto``:
   Susy will calculate the width of your container
   based on the other grid settings,
   or fall back to ``100%``.

.. warning::

  For ``static`` layouts,
  leave ``container: auto``
  and set the ``column-width`` instead.
  Susy will calculate the outer container width for you.
  Dividing columns out of a set container width
  would leave you open to sub-pixel errors,
  and no one likes sub-pixel errors.


Container Position
------------------

*Position the container in the viewport (or other context).*

- **setting:** ``container-position``
- **scope:** global, local [container only]
- **options:** ``left`` | ``center`` | ``right`` | ``<length> [*2]``
- **default:** ``center``

1. ``left``:
   Holds container elements flush left,
   with ``margin-left: 0;`` and ``margin-right: auto;``.
2. ``center``:
   Centers the container,
   by setting both left and right margins to ``auto``.
3. ``right``:
   Pushes the container flush right,
   with ``margin-right: 0;`` and ``margin-left: auto;``.
4. ``<length> [*2]``:
   If one length is given,
   it will be applied to both side margins,
   to offset the container from the edges of the viewport.
   If to values are given,
   they will be used as ``left`` and ``right`` margins respectively.


Columns
-------

- **setting:** ``columns``
- **scope:** global, local
- **options:** ``<number>`` | ``<list>``
- **default:** ``12``

1. ``<number>``:
   The number of columns in your layout.
2. ``<list>``:
   For assymetrical grids,
   list the size of each column relative to the other columns,
   where ``1`` is a single column-unit.
   ``(1 2)`` would create a 2-column grid,
   with the second column being twice the width of the first.
   For a `Fibonacci`_-inspired grid, use
   ``(1 1 2 3 5 8 13)``.

.. _Fibonacci: http://en.wikipedia.org/wiki/Fibonacci_number


Gutters
-------

- **setting:** ``gutters``
- **scope:** global, local
- **options:** ``<ratio>``
- **default:** ``1/4``

1. ``<ratio>``:
   Gutters are established as a ratio to the size of a column.
   The default ``1/4`` setting will create gutters
   one quarter the size of a column.
   In asymmetrical grids,
   this is ``1/4`` the size of a single column-unit.


Column Width
------------

- **setting:** ``column-width``
- **scope:** global, local
- **options:** ``<length>`` | ``false``
- **default:** ``false``

1. ``<length>``:
   The width of one column, using any valid unit.
   This will be used in ``static`` layouts to calculate all grid widths,
   but can also be used by ``fluid`` layouts
   to calculate an outer maximum width for the container.
2. ``false``:
   There is no need for column-width in ``fluid`` layouts
   unless you specifically want the container-width
   calculated for you.


Global Box Sizing
-----------------

*Tell Susy what box model is being applied globally.*

- **setting:** ``global-box-sizing``
- **scope:** global
- **options:** ``border-box`` | ``content-box``
- **default:** ``content-box``

1. ``content-box``:
   Browsers use the ``content-box`` model unless you specify otherwise.
2. ``border-box``:
   If you are using the `Paul Irish universal border-box`_ technique
   (or something similar),
   you should change this setting to ``border-box``.
   You can also use our ``border-box-sizing`` mixin,
   and we'll take care of it all for you.

For more,
see the `MDN box-sizing documentation`_.

.. _MDN box-sizing documentation: https://developer.mozilla.org/en-US/docs/Web/CSS/box-sizing


Last Flow
---------

*The float-direction for the last element in a row.*

- **setting:** ``last-flow``
- **scope:** global
- **options:** ``from`` | ``to``
- **default:** ``to``

1. ``from``:
   This is the default for all other elements in a layout.
   In an ``ltr`` (left-to-right) flow,
   the from-direction is ``left``,
   and this setting would float "last" elements to the left,
   along with the other elements.
2. ``to``:
   In many cases (especially with ``fluid`` grids),
   it can be helpful to float the last element in a row
   in the opposite direction.


Show Grids
----------

*Toggle grid images for debugging.*

- **setting:** ``show-grids``
- **scope:** global, local [container only]
- **options:** ``show`` | ``hide`` | ``show-columns`` | ``show-baseline``
- **default:** ``hide``

1. ``show``:
   Show grid images,
   usually on the background of container elements,
   for the purpose of debugging.
   If you are using `Compass vertical rhythms`_
   (or have set your own ``$base-line-height`` variable)
   Susy will show baseline grids as well.
2. ``hide``:
   Hide all grid debugging images.
3. ``show-columns``:
   Show only horizontal grid-columns,
   even if a baseline grid is available.
4. ``show-baseline``:
   Show only the baseline grid,
   if the ``$base-line-height`` variable is available.

.. warning::

  Grid images are not exact.
  Browsers have extra trouble
  with sub-pixel rounding on background images.
  These are meant for rough debugging,
  not for pixel-perfect measurements.

.. _Compass vertical rhythms: http://compass-style.org/reference/compass/typography/vertical_rhythm/


Location
--------

*Reference a specific column on the grid.
Locations keywords don't require the ``at`` flag.*

- **name:** ``location``
- **scope:** local
- **options:** ``first`` | ``alpha`` | ``last`` | ``omega`` | ``<number>``
- **default:** ``null``

1. ``first`` & ``alpha``:
   Set location to ``1``.
2. ``last`` & ``omega``:
   Set the location to the final column,
   and any previous columns included by the relevant ``span``.
3. ``<number>``:
   Set the location to any column-index
   between ``1`` and the total number of available columns.


Box Sizing
----------

*Set a new box model on the given element element.*

- **name:** ``box-sizing``
- **scope:** local
- **options:** ``border-box`` | ``content-box``
- **default:** ``null``

1. ``border-box``:
   Output ``box-sizing`` CSS to set the ``border-box`` model.
2. ``content-box``:
   Output ``box-sizing`` CSS to set the ``content-box`` model.


Spread
------

*Adjust how many gutters are included in a column span.*

- **name:** ``spread``
- **scope:** local
- **options:** ``narrow`` | ``wide`` | ``wider``
- **default:** various...

1. ``narrow``:
   In most cases,
   column-spans include the gutters *between* columns.
   A span of ``3 narrow`` covers the width of 3 columns,
   as well as 2 internal gutters.
   This is the default in most cases.
2. ``wide``:
   Sometimes you need to include one side gutter in a span width.
   A span of ``3 wide`` covers the width of 3 columns,
   and 3 gutters (2 internal, and 1 side).
   This is the default for several margin/padding mixins.
3. ``wider``:
   Sometimes you need to include both side gutters in a span width.
   A span of ``3 wider`` covers the width of 3 columns,
   and 4 gutters (2 internal, and 2 sides).


Gutter Override
---------------

*Set an explicit one-off gutter-width, or remove gutters entirely.*

- **name:** ``gutter-override``
- **scope:** local
- **options:** ``no-gutters`` | ``no-gutter`` | ``<length>``
- **default:** ``null``

1. ``no-gutters`` or ``no-gutter``:
   Remove all gutter output.
2. ``<length>``:
   Override the calculated gutter output with an explicit width.


Role
----

*Mark a grid element as a nesting context for child elements.*

- **name:** ``role``
- **scope:** local
- **options:** ``nest``
- **default:** ``null``

1. ``nest``:
   Mark an internal grid element as a context for nested grids.

.. note::

  This can be used with any grid type,
  but it is required for nesting
  with ``split``, ``inside``, or ``inside-static`` gutters.
