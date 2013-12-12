Quick Start
===========


Import
------

.. code-block:: scss

  @import "susy";


Basic Layouts
-------------

The basic Susy layout is composed using two simple mixins:

.. code-block:: scss

  @include container; // establish a layout context
  @include span(<width>); // lay out your elements

For example:

.. code-block:: scss

  body { @include container(80em); }
  nav { @include span(25%); }


Settings
--------

All your settings are controlled by the single ``$susy`` variable.

.. code-block:: scss

  $susy: (
    columns: 12,  // The number of columns in your grid
    gutters: 1/4, // The size of a gutter in relation to a single column
  );

If you want to lay your elements out on a grid,
you can use the ``span`` mixin to calculate column widths:

.. code-block:: scss

  nav { @include span(3 of 12); }

There are many more settings you can use
to customize every aspect of your layout,
but this is a quick-start quide.
