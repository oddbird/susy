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
  @include set-grid(12 (60px 10px) split static);

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
       layout-math          : static fluid,
       layout-method        : isolate float,
       container-position   : left center right,
       flow                 : ltr rtl,
       show-grids           : show hide show-columns show-baseline,
       gutter-position      : before after split inside inside-static,
     );

     $local-keywords: (
       box-sizing           : border-box content-box,
       location             : first alpha last omega,
       spread               : narrow wide wider,
       gutter-override      : no-gutters no-gutter,
       is-container         : container,
     );

   The global keywords can be used anywhere,
   and apply to global default :doc:`settings <settings>`.
   The local keywords are specific to each individual use.


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
  // keywords: (layout-math: fluid, gutter-position: inside-static, flow: rtl);
  $small: 4 (4em 1em) fluid inside-static rtl;

  // span: (container: 80em);
  // grid: (columns: (1 2 3 4 5));
  // keywords: (container-position: left);
  $large: 80em (1 2 3 4 5) left;


Spans
-----

**span:** ``<span>`` [ ``at`` ``<location>`` ``of`` ``<layout>`` ]

**gutter:** [ ``<gutter-override>`` ``of`` ] ``<layout>``


Box Sizing
----------

*Change the box model on an element.*

- **setting:** ``box-sizing``
- **scope:** local
- **options:** ``border-box`` | ``content-box``
- **default:** ``null``


Spread
------

