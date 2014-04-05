DIY Susy
========

Susy is built in three distinct modules:
math, output, and syntax.
The math and output layers form the core of Susy —
so abstract that they could be used for any grid system.
That's exactly what we hope will happen.

The syntax modules hold it all together.
In the same way that you can theme a website,
applying different CSS to the same markup,
you can theme Susy by writing your own syntax
(or extending one of ours).

We've written a powerful new :doc:`Default Syntax <settings>`,
and we're keeping the old :doc:`susyone` available as well.
But why stop there?
You can *create your own unique syntax*,
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


-------------------------------------------------------------------------

.. _core-settings:

Core Settings
-------------

While the Susy language module
is built to support layouts of all kinds,
we only need the math module for grid basics.

The Susy core has two settings:
:ref:`columns <settings-columns>`, and
:ref:`gutters <settings-gutters>`.

.. code-block:: scss

  $symmetrical: (
    columns: 12,
    gutters: 1/4,
  );

  $asymmetrical: (
    columns: (1 3 4 6 2),
    gutters: .5,
  );

Both ``columns`` and ``gutters`` are set
as unitless numbers,
but you can think of them as "grid units" —
as they are all relative to each other.
``1/4`` gutter is a quarter the size of ``1`` column.


-------------------------------------------------------------------------

.. _core-is-symmetrical:

Is Symmetrical
--------------

Returns ``null`` if a grid is asymmetrical.

- ``$columns``: ``<number>`` | ``<list>``

It's not a difficult test,
but it's important to know what you're dealing with.

.. code-block:: scss

  // input
  $sym: is-symmetrical(12);
  $asym: is-symmetrical(2 4 6 3);

  // output
  $sym: 12;
  $asym: null;


-------------------------------------------------------------------------

.. _core-susy-count:

Susy Count
----------

Find the number of columns in a given layout.

- ``$columns``: ``<number>`` | ``<list>``

This is only necessary for asymmetrical grids,
since symmetrical are already defined by their count,
but the function handles both styles
for the sake of flexibility.

1. ``<number>``:
   Susy grid layouts are defined by columns.
   In a symmetrical grid
   all the columns are the same relative width,
   so they can be defined by the number of columns.
   We can have an "8-column" grid, or a "12-column" grid.

   .. code-block:: scss

     // input
     $count: susy-count(12);

     // output
     $count: 12;

2. ``<list>``:
   Asymmetrical grids are more complex.
   Since each column can have a different width
   relative to the other columns,
   we need to provide more detail about the columns.
   We can do that with a list of relative (unitless sizes).
   Each number in the list
   represents a number of grid units
   relative to the other numbers.

   .. code-block:: scss

     // input
     $count: susy-count(1 2 4 3 1);

     // output
     $count: 5;

   For asymmetrical grids,
   the number of columns is egual to the list length.
   This isn't complex math.


-------------------------------------------------------------------------

.. _core-susy-sum:

Column Sum
----------

Find the total sum of column-units in a layout.

- ``$columns``: ``<number>`` | ``<list>``
- ``$gutters``: ``<ratio>``
- ``$spread``: ``false``/``narrow`` | ``wide`` | ``wider``

Rather than counting how many columns there are,
the ``susy-sum`` function calculates
the total number of grid units covered.
It's a simple matter of adding together all the columns
as well as the gutters between them.

.. code-block:: scss

  // input
  $susy-sum: susy-sum(7, .5);

  // output: 7 + (6 * .5) = 10
  $susy-sum: 10;

Most grids have one less gutter than column,
but that's not always true.
The ``spread`` argument allows you to also include
the gutters on either side.
While the default ``narrow`` spread subtracts a gutter,
the ``wide`` spread
(common when using split gutters)
has an equal number of columns and gutters.

.. code-block:: scss

  // input
  $wide-sum: susy-sum(7, .5, wide);

  // output: 7 + (7 * .5) = 10.5
  $wide-sum: 10.5;

On rare occasions
you may actually want gutters on both sides,
which we call a ``wider`` spread.

.. code-block:: scss

  // input
  $wider-sum: susy-sum(7, .5, wider);

  // output: 7 + (8 * .5) = 11
  $wider-sum: 11;

This is all possible with asymmetrical grids as well.

.. code-block:: scss

  // input
  $susy-sum: susy-sum(1 2 4 2, 1/3);

  // output: (1 + 2 + 4 + 2) + (3 * 1/3) = 10
  $susy-sum: 10;


-------------------------------------------------------------------------

.. _core-susy-span:

Column Span
-----------

Return a subset of columns at a given location.

- ``$span``: ``<number>``
- ``$location``: ``<number>``
- ``$columns``: ``<number>`` | ``<list>``

This is only necessary for asymmetrical grids,
since a symmetrical subset is always equal to the span,
but the function handles both styles
for the sake of flexibility.

The ``location`` is given
as a column index, starting with 1,
so that ``1`` is the first column,
``2`` is the second, and so on.

.. code-block:: scss

  // input
  $sym-span: susy-span(3, 2, 7);
  $asym-span: susy-span(3, 2, (1 2 3 5 4));

  // output: 3 columns, starting with the second
  $sym-span: 3;
  $asym-span: (2 3 5);


-------------------------------------------------------------------------

.. _core-susy:

Susy
----

Find the sum of given slice.

- ``$span``: ``<number>``
- ``$location``: ``<number>``
- ``$columns``: ``<number>`` | ``<list>``
- ``$gutters``: ``<ratio>``
- ``$spread``: ``false``/``narrow`` | ``wide`` | ``wider``

This is where it all comes together.
``susy`` is the basic building-block
for any grid system.
It combines ``susy-span`` with ``susy-sum``
to return the unitless width of a given slice.

.. code-block:: scss

  // input
  $sym-span: susy(3, 2, 7, .5);
  $asym-span: susy(3, 2, (1 2 3 5 4), .5);

  // output
  $sym-span: 4;
  $asym-span: 11;

All you need to do is add units...


-------------------------------------------------------------------------

.. _core-diy:

Build Something New
-------------------

That's really all it takes to build a grid system.
The rest is just syntax.
Start with ``susy()``.

.. code-block:: scss

    $sum: susy(3, 2, 7);

If you want static grids,
you can multiply the results
by the width of one column.

.. code-block:: scss

    // static
    $column-width: 4em;
    $static: $sum * $column-width;

For a fluid grid,
divide the results by the context span sum,
to get a percentage.

.. code-block:: scss

    // fluid
    $context: susy(7);
    $fluid: percentage($sum / $context);

That's all it takes.
Now go build yourself a grid system!
