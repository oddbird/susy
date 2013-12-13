Quick Start
===========

Once you have everything :doc:`installed <install>`,
you can import Susy into your Sass files.

.. code-block:: scss

  @import "susy";

The basic Susy layout is composed using two simple mixins:

.. code-block:: scss

  @include container; // establish a layout context
  @include span(<width>); // lay out your elements

For example:

.. code-block:: scss

  body { @include container(80em); }
  nav { @include span(25%); }

If you want to lay your elements out on a grid,
you can use the ``span`` mixin to calculate column widths:

.. code-block:: scss

  nav { @include span(3 of 12); }

But you don't have to do things the Susy way.
We give you direct access to the math,
so you can use it any way you like:

.. code-block:: scss

  main {
    float: left;
    width: span(4);
    margin-left: span(2) + gutter();
    margin-right: gutter();
  }

You can also establish :doc:`global settings <settings>`,
to configure Susy for your specific needs.
Just create a ``$susy`` variable,
and add your settings as a map.

.. code-block:: scss

  $susy: (
    columns: 12,  // The number of columns in your grid
    gutters: 1/4, // The size of a gutter in relation to a single column
  );

There are many more settings available
for customizing every aspect of your layout,
but this is just a quick-start guide.
Keep going to get the details.
