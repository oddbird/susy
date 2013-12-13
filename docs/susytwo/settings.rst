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

  @include set-grid($susy float inside);

That's the overview.
Let's take a look at the details:


Global Settings
---------------

.. code-block:: scss

  $layout: (
    columns: 4,
    gutters: .25,
    column-width: false,
    layout-math: fluid,
    layout-method: float,
    gutter-position: after,
    flow: ltr,
    last-flow: to,
    global-box-sizing: content-box,
  );


Container Settings
------------------

.. code-block:: scss

  $container: (
    container: auto,
    container-position: center,
    show-grids: hide,
  );


Span Settings
-------------

.. code-block:: scss

  $span: (
    span: 3,
    location: first,
    box-sizing: border-box,
    spread: wide,
    is-container: false,
  );


Gutter Settings
---------------

.. code-block:: scss

  $gutter: (
    gutter-override: 4em,
  );
