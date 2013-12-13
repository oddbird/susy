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

Syntax Options
==============

Susy is built in three distinct modules:
math, output, and syntax.
The math and and output layers form the core of Susy —
so abstract that they could be used for any grid system.
That's exactly what we hope will happen.

The syntax modules hold it all together.
In the same way that you can theme a website,
applying different CSS to the same markup,
you can theme Susy by writing your own syntax
(or extending one of ours).

We've written a powerful new :doc:`susytwo/index`,
and we're keeping the old :doc:`susyone/index` available as well.
But why stop there?
You can create your own unique syntax,
or port over the language of existing tools like
`oocss`_, `singularity`_, `zurb`_, `neat`_, `zen`_,
`blueprint`_, `960gs`_, etc.,
without ever leaving Susy.

.. _oocss: http://oocss.org/
.. _singularity: http://singularity.gs/
.. _zurb: http://foundation.zurb.com/
.. _neat: http://neat.bourbon.io/
.. _zen: http://zengrids.com/
.. _blueprint: http://www.blueprintcss.org/
.. _960gs: http://960.gs/
