Toolkit
=======

The Susy 2.0 toolkit is built around
our :doc:`shorthand syntax <shorthand>`.
Use the shorthand to control every detail,
and adjust your defaults on-the-fly,
so you are never tied down to just one grid,
or just one output style.


.. _tools-span-mixin:

Span [Mixin]
------------

Set any element to span a portion of your layout.
For a floated or isolated layout,
this will add necessary floats, widths, and margins.

**Arbitrary Widths**

For the simplest use,
pass any width directly to the mixin:

.. code-block:: scss

  // arbitrary width
  .item { @include span(25%); }

  // float output (without gutters)
  .item {
    float: left;
    width: 25%;
  }

**Grid Widths**

If you are using a grid,
you can also span columns on the grid:

.. code-block:: scss

  // grid span
  .item { @include span(3); }

  // output (7-column grid with 1/2 gutters after)
  .item {
    float: left;
    width: 40%;
    margin-right: 5%;
  }

**Row Edges**

When you use a grid with gutters ``before`` or ``after``,
you sometimes need to mark the ``first`` or ``last``
elements in a row,
so Susy can remove the extra gutters:

.. code-block:: scss

  // grid span
  @include span(last 3);

  // output (same 7-column grid)
  .item {
    float: right;
    width: 40%;
  }

For legacy reasons,
``alpha`` and ``omega`` can be used
in place of ``first`` and ``last``.

**Context**

Context is required any time you are using fluid math,
and nesting grid elements inside other elements:

.. code-block:: scss

  // 10-column grid
  .outer {
    @include span(5);
    .inner { @include span(2 of 5); }
  }

The ``of`` flag is used to signal context.
The context is always equal to the grid-span of the parent.
In some cases, you can imply changes in context
by nesting elements inside the span tag itself:

.. code-block:: scss

  // 10-column grid
  .outer {
    // out here, the context is 10
    @include span(5) {
      // in here, the context is 5
      .inner { @include span(2); }
    }
  }

**Nesting**

Grids with ``inside``, ``inside-static``, or ``split`` gutters
don't need to worry about the edge cases,
but they do have to worry about nesting.

If an element will have grid-aligned children,
you should mark it as a ``nest``:

.. code-block:: scss

  // inside, inside-static, or split gutters
  .outer {
    @include span(5 nest);
    .inner { @include span(2 of 5); }
  }

**Location**

Asymmetrical grids and isolated output
also need to know the desired ``location`` of the span.
In both cases,
use the ``at`` flag to set a location.

For isolation,
you can use either an arbitrary width
or a column index (starting with 1).
For asymmetrical grid spans,
the location setting must be a column index:

.. code-block:: scss

  .width { @include span(isolate 500px at 25%); }
  .index { @include span(isolate 3 at 2); }

**narrow, wide, and wider**

By default,
a grid span only spans the gutters *between* columns.
So a span of ``2`` includes 1 internal gutter (``narrow``).
In some cases you want to span additional gutters on either side.
So that same span of 2
could include the internal gutter,
and one (``wide``) or both (``wider``) external gutters.

.. code-block:: scss

  // grid span
  .narrow { @include span(2); }
  .wide { @include span(2 wide); }
  .wider { @include span(2 wider); }

  // width output (7 columns, .25 gutters)
  // (each column is 10%, and each gutter adds 2.5%)
  .narrow { width: 22.5%; }
  .wide { width: 25%; }
  .wider { width: 27.5%; }

If you are using inside gutters,
the spans are wide by default
but can be overridden manually.

**Other Settings**

Use the ``full`` keyword
to span the entire context available.
Use ``break`` to clear previous floats
and start a new row.
The ``no-gutters`` keyword can be used
to remove gutter output from an individual span.

You can set an arbitrary gutter override,
by passing a map (e.g. ``(gutter-override: 1.5em)``)
as part of the shorthand syntax.

You can also change the output style
(currently only float and isolate are supported)
grid context,
and other global settings on the fly:

.. code-block:: scss

  // grid span
  .item { @include span(isolate 4 at 2 of 8 (4em 1em) inside-static rtl break); }

  // output
  .item {
    clear: both;
    float: right;
    width: 50%;
    padding-left: .5em;
    padding-right: .5em;
    margin-left: 25%;
    margin-right: -100%;
  }


.. _tools-span-function:

Span [Function]
---------------

The span function is identical to the
:ref:`span mixin <tools-span-mixin>`,
but returns only the span width value,
so you can use it with custom output:

.. code-block:: scss

  .item {
    width: span(2);
    margin-left: span(3 wide);
    margin-right: span(1) + 25%;
  }


.. _tools-gutter:

Gutters
-------

Use ``gutter`` or ``gutters``
as a function to return the width of a gutter
given your settings and current context.

.. code-block:: scss

  // default context
  margin-left: gutter();

  // nested in a 10-column context
  margin-left: gutter(10);

Or use the mixin version
to apply gutters to any element.
Gutters are output
as ``margin`` or ``padding``
depending on the ``gutter-position`` setting.

.. code-block:: scss

  // default gutters
  .item { @include gutters; }

You can also set explicit gutter widths:

.. code-block:: scss

  // explicit gutters
  .item { @include gutters(3em); }

Or use the shorthand syntax
to adjust settings on the fly:

.. code-block:: scss

  // inside gutters
  .item { @include gutters(3em inside); }

  // gutters after, in an explicit (10 1/3) layout context
  .item { @include gutters(10 1/3 after); }


.. _tools-container:

Container
---------

Use the ``container`` function
return a container width based on your settings,
or the explicit setting you pass in
using the shorthand syntax.

.. code-block:: scss

  // global settings
  width: container();

  // 12-column grid
  $large-breakpoint: container(12);

Or use the mixin to
apply container settings to an element directly.

.. code-block:: scss

  body {
    @include container(12 center static);
  }


.. _tools-context:

Nested Context
--------------

Sass is not aware of the :abbr:`DOM (Document Object Model)`,
or the specific markup of your site,
so Susy mixins don't know about about ancestor/child relationships.
If your container creates a grid context
that is different from the default,
you will need to pass that new context explicitly to nested elements.

You can pass that context along with the shorthand syntax.

.. code-block:: scss

  body { @include container(8); }
  .span { @include span(3 of 8); }

But that gets repetative if you have large blocks of code
using a given context.
The ``nested`` mixin provides a shortcut
to change the default context for a section of code.

.. code-block:: scss

  @include nested(8) {
    .span { @include span(3); }
  }

Context is a bit more complex
when you are using asymmetrical grids,
because we need to know
not just *how many* columns,
but *which* columns are available.

.. code-block:: scss

  .outer {
    @include span(3 of (1 2 3 2 1) at 2);

    // context is now (2 3 2)...
    .inner { @include span(2 of (2 3 2) at 1); }
  }

The ``nested`` function can help you
manage context more easily,
without having to calculate it yourself.

.. code-block:: scss

  $grid: (1 2 3 2 1);

  .outer {
    @include span(3 of $grid at 2);

    $context: nested(3 of $grid at 2);
    .inner { @include span(2 of $context at 1); }
  }


.. _tools-box-sizing:

Box Sizing
----------

You can pass a ``box-sizing`` argument
to the ``span`` mixin
as part of the shorthand syntax,
and Susy will set the element's box-sizing to match.

.. code-block:: scss

  // input
  .item { @include span(25em border-box); }

  // sample output (depending on settings)
  .item {
    float: left;
    width: 25em;
    box-sizing: border-box;
  }

We highly recommend using
a `global`_ ``border-box`` setting,
especially if you are using inside gutters
of any kind.

.. code-block:: scss

  // the basics...
  * { box-sizing: border-box; }

Susy needs to know what box model you are using,
so the best approach is to set global box sizing
using one of Susy's shortcuts.

.. code-block:: scss

  // the flexible version:
  @include global-box-sizing(border-box);

  // the shortcut:
  @include border-box-sizing;

If you want to change the global box-sizing by hand,
or it has already been changed by another library,
just update the `global-box-sizing` setting
to let Susy know.

If you need to supprot IE6/7,
there is a simple `polyfill`_
to make it work.

.. _global: www.paulirish.com/2012/box-sizing-border-box-ftw/
.. _polyfill: https://github.com/Schepp/box-sizing-polyfill


.. _tools-margin:

Margins
-------


.. _tools-padding:

Padding
-------


.. _tools-bleed:

Bleed
-----


.. _tools-row:

Rows
----


.. _tools-isolation:

Isolation
---------


.. _tools-gallery:

Gallery
-------


.. _tools-breakpoint:

Breakpoint
----------


.. _tools-debugging:

Debugging
---------
