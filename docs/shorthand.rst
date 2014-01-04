Shorthand
=========

Susy provides a shorthand syntax
to easily pass arbitrary settings into functions and mixins.
This allows the syntax to stay simple and readable
for the majority of use cases,
and only add complexity if/when you really need it.

.. code-block:: scss

  // Establish an 80em container
  @include container(80em);

  // Span 3 of 12 columns
  @include span(3 of 12);

  // Setup the 960 Grid System
  @include layout(12 (60px 10px) split static);

  // Span 3 isolated columns in a complex, asymmetrical grid, without gutters
  @include span(isolate 3 at 2 of (1 2 3 4 3 2 1) no-gutters);


Overview
--------

In most cases, the syntax order is not important,
but there are a few rules to get you started.
The syntax generally breaks down into three parts:

.. code-block:: scss

  // Pattern
  $shorthand: $span $grid $keywords;

1. The ``$span`` can be any length,
   or (in some cases) a unitless number
   representing column-spans.
   The specifics change
   depending on the function or mixin
   where it is being passed.

2. The ``$grid`` is composed of a ``columns`` setting,
   and optional settings for ``gutters`` and ``column-width``.
   It always looks something like this:

   .. code-block:: scss

     // 12-column grid
     $grid: 12;

     // 12-column grid with 1/3 gutter ratio
     $grid: 12 1/3;

     // 12-column grid with 60px columns and 10px gutters
     $grid: 12 (60px 10px);

     // asymmetrical grid with .25 gutter ratio
     $grid: (1 2 3 2 1) .25;

3. The ``$keywords`` are the easiest.
   Most :doc:`settings <settings>` have simple keyword values
   that can be included in any order —
   before, after, or between the ``$span`` and ``$grid`` options.

   .. code-block:: scss

     // All the keywords in Susy:

     $global-keywords: (
       container            : auto,
       math                 : static fluid,
       output               : isolate float,
       container-position   : left center right,
       flow                 : ltr rtl,
       gutter-position      : before after split inside inside-static,
       debug: (
         image              : show hide show-columns show-baseline,
         output             : background overlay,
       ),
     );

     $local-keywords: (
       box-sizing           : border-box content-box,
       edge                 : first alpha last omega,
       spread               : narrow wide wider,
       gutter-override      : no-gutters no-gutter,
       clear                : break nobreak,
       role                 : nest,
     );

   The global keywords can be used anywhere,
   and apply to global default :doc:`settings <settings>`.
   The local keywords are specific to each individual use.


.. _shorthand-layout:

Layout
------

The simplest shorthand variation
is used for defining your layout in broad terms.
Nothing here is required —
all the settings are optional and have global defaults.
``$grid`` and ``$keyword`` settings work exactly as advertised,
and you can pass any length (with units) for the ``$span``.
If you provide a span,
it will be used for the ``container`` width.

.. code-block:: scss

  // Pattern:
  $layout: $span $grid $keywords;

  // grid: (columns: 4, gutters: 1/4, column-width: 4em);
  // keywords: (math: fluid, gutter-position: inside-static, flow: rtl);
  $small: 4 (4em 1em) fluid inside-static rtl;

  // span: (container: 80em);
  // grid: (columns: (1 2 3 4 5));
  // keywords: (container-position: left);
  $large: 80em (1 2 3 4 5) left;

You can easily convert layouts from shorthand to map syntax
using the ``layout()`` function.

.. code-block:: scss

  // input
  $map: layout(auto 12 .25 inside fluid isolate);

  //output
  $map: (
    container: auto,
    columns: 12,
    gutters: .25,
    gutter-position: inside,
    math: fluid,
    output: isolate,
  );

This is useful any time you need to combine settings
from different places.
This has to do with the difference in Sass
between lists and maps.

.. code-block:: scss

  // these work
  $medium: layout(13 static);
  @include span(3 of $medium);

  $medium: 13 static;
  @include span(3 of layout($medium));

  // this doesn't
  $medium: 13 static;
  @include span(3 of $medium);


.. _shorthand-span:

Spans
-----

Most of Susy's functions & mixins
are used to calculate or set a width, or ``span``.
Most spans in Susy are either a unitless number
(representing columns)
or an explicit width.
Some of them also require a location
(particularly for asymmetrical grids and isolation).

The standard span syntax looks like this:

.. code-block:: scss

  // Pattern:
  $span: $span at $location of $layout;

  // span: 3;
  // location: 4;
  // layout: (columns: 12, gutters: .25, math: fluid)
  $span: 3 at 4 of 12 .25 fluid;

  // Only $span is required in most cases
  $span: 30%;

The "at" flag comes immediately before the location
(unless the location itself is a keyword),
and everything after the "of" flag
is treated as part of the layout.

Some mixins accept multiple spans,
using the common CSS "top right bottom left" (TRBL) pattern,
or have other specific options.
Those are all documented as part of the function/mixin details.
