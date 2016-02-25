Toolkit
=======

The Susy 2.0 toolkit is built around
our :doc:`shorthand syntax <shorthand>`.
Use the shorthand to control every detail,
and adjust your defaults on-the-fly,
so you are never tied down to just one grid,
or just one output style.

-------------------------------------------------------------------------

.. _tools-span-mixin:

Span [mixin]
------------

Set any element to span a portion of your layout.
For a floated or isolated layout,
this will add necessary floats, widths, and margins.

.. describe:: mixin

  :format: ``span($span) { @content }``
  :$span: :ref:`\<span\> <shorthand-span>`
  :@content: Sass content block

There are many ways to use the span mixin...


.. _tools-span-width:

Arbitrary Widths
~~~~~~~~~~~~~~~~

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


.. _tools-span-span:

Grid Widths
~~~~~~~~~~~

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


.. _tools-span-edge:

Row Edges
~~~~~~~~~

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
    margin-right: 0;
  }

For legacy reasons,
``alpha`` and ``omega`` can be used
in place of ``first`` and ``last``.


.. _tools-span-context:

Context
~~~~~~~

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


.. _tools-span-nesting:

Nesting
~~~~~~~

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


.. _tools-span-location:

Location
~~~~~~~~

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


.. _tools-span-spread:

narrow, wide, and wider
~~~~~~~~~~~~~~~~~~~~~~~

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


.. _tools-span-other:

Other Settings
~~~~~~~~~~~~~~

Use the ``full`` keyword
to span the entire context available,
use ``break`` to start a new :ref:`tools-row`
by clearing previous floats,
and ``nobreak`` to clear none.
Use ``no-gutters``
to remove gutter output from an individual span,
and use ``border-box`` or ``content-box``
to output changes in :ref:`box-sizing <tools-box-sizing>`
on the fly.

You can set an arbitrary gutter override,
by passing a map (e.g. ``(gutter-override: 1.5em)``)
as part of the shorthand syntax.

You can also change the :ref:`output <settings-output>` style,
grid context,
and other :doc:`global settings <settings>` on the fly:

.. code-block:: scss

  // grid span
  .item { @include span(isolate 4 at 2 of 8 (4em 1em) inside rtl break); }

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


-------------------------------------------------------------------------

.. _tools-span-function:

Span [function]
---------------

The span function is identical to the
:ref:`span mixin <tools-span-mixin>`,
but returns only the span width value,
so you can use it with custom output.

.. describe:: function

  :format: ``span($span)``
  :$span: :ref:`\<span\> <shorthand-span>`

.. code-block:: scss

  .item {
    width: span(2);
    margin-left: span(3 wide);
    margin-right: span(1) + 25%;
  }


-------------------------------------------------------------------------

.. _tools-gutter:

Gutters
-------

.. describe:: function/mixin

  :format: ``gutters($span)``
  :alternate: ``gutter($span)``
  :$span: :ref:`\<span\> <shorthand-span>`

Use ``gutter`` or ``gutters``
as a **function** to return the width of a gutter
given your settings and current context.

.. code-block:: scss

  // default context
  margin-left: gutter();

  // nested in a 10-column context
  margin-left: gutter(10);

Use the **mixin** version
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


-------------------------------------------------------------------------

.. _tools-container:

Container
---------

.. describe:: function/mixin

  :format: ``container($layout)``
  :$layout: :ref:`\<layout\> <shorthand-layout>`

Use the ``container`` **function**
to return a container-width based on an optional layout argument,
or your global settings.

.. code-block:: scss

  // global settings
  width: container();

  // 12-column grid
  $large-breakpoint: container(12);

Use the **mixin** to
apply container settings to an element directly.

.. code-block:: scss

  body {
    @include container(12 center static);
  }

Note that :ref:`static math <settings-math>` requires a valid
:ref:`column-width <settings-column-width>` setting


-------------------------------------------------------------------------

.. _tools-nested:

Nested Context
--------------

.. describe:: function/mixin

  :function: ``nested($span)``
  :mixin: ``nested($span) { @content }``
  :$span: :ref:`\<span\> <shorthand-span>`
  :@content: Sass content block

Sass is not aware of the :abbr:`DOM (Document Object Model)`,
or the specific markup of your site,
so Susy mixins don't know about any ancestor/child relationships.
If your container creates a grid context
that is different from the default,
you will need to pass that new context explicitly to nested elements.

You can pass that context along with the shorthand syntax.

.. code-block:: scss

  body { @include container(8); }
  .span { @include span(3 of 8); }

But that gets repetitive if you have large blocks of code
using a given context.
The ``nested`` **mixin** provides a shortcut
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

The ``nested`` **function** can help you
manage context more easily,
without having to calculate it yourself.

.. code-block:: scss

  $grid: (1 2 3 2 1);

  .outer {
    $context: 3 of $grid at 2;
    @include span($context);

    @include nested($context) {
      .inner { @include span(2 at 1); }
    }
  }


-------------------------------------------------------------------------

.. _tools-box-sizing:

Global Box Sizing
-----------------

Set the ``box-sizing`` on a `global`_ selector,
and set the :ref:`global-box-sizing <settings-global-box-sizing>`
to match.

.. describe:: mixin

  :format: ``global-box-sizing($box [, $inherit])``
  :shortcut: ``border-box-sizing([$inherit])``
  :$box: ``content-box`` | ``border-box``
  :$inherit: [optional] ``true`` | ``false``

Setting the optional argument, ``$inherit``, to ``true``
will still globally set the ``box-sizing``, but in
a way such that a component can easily override the
global ``box-sizing`` by setting its own ``box-sizing``
property. By setting ``box-sizing`` once on the
component, all nested elements within the component
will also be modified. The default behavior, where
``$inherit`` is ``false``, would only update the
``box-sizing`` of the component itself. Nested
elements are not affected when ``$inherit`` is
``false``.

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

  // the basics with default behavior:
  * { box-sizing: border-box; }

  // the basics with $inherit set to true:
  html { box-sizing: border-box; }
  * { box-sizing: inherit; }

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
update the
:ref:`global-box-sizing <settings-global-box-sizing>` setting
to let Susy know.

If you need to supprot IE6/7,
there is a simple `polyfill`_
to make it work.

.. _global: http://www.paulirish.com/2012/box-sizing-border-box-ftw/
.. _polyfill: https://github.com/Schepp/box-sizing-polyfill


-------------------------------------------------------------------------

.. _tools-row:

Rows & Edges
------------

Floated layouts sometimes require
help maintaining rows and edges.


-------------------------------------------------------------------------

.. _tools-row-break:

Break
~~~~~

.. describe:: mixin

  :format: ``break()``
  :reset: ``nobreak()``
  :keywords: ``break`` | ``nobreak``

To create a new row,
you need to clear all previous floats.
This can usually be done using keywords
with the :ref:`span mixin <tools-span-edge>`.
When you need to apply a row-break on it's own,
we have a ``break`` mixin.

.. code-block:: scss

  .new-line { @include break; }

If you ever need to override that,
you can use ``nobreak``
to set ``clear: none;``.

.. code-block:: scss

  .no-new-line { @include nobreak; }

Both ``break`` and ``nobreak``
can also be used as keywords
with the :ref:`span mixin <tools-span-mixin>`.


-------------------------------------------------------------------------

.. _tools-row-first:

First
~~~~~

.. describe:: mixin

  :format: ``first($context)``
  :alternate: ``alpha($context)``
  :$context: :ref:`\<layout\> <shorthand-layout>`

.. note::

  Only useful when
  :ref:`gutter-position <settings-gutter-position>`
  is set to ``before``.

When :ref:`gutter-position <settings-gutter-position>`
is set to ``before``
we need to remove the gutter
from the first element in every row.
This can often be solved
using a keyword in the :ref:`span mixin <tools-span-edge>`.
Sometimes you need to set an item as ``first``
outside the span mixin.

.. code-block:: scss

  .first { @include first; }

We also support an ``alpha`` mixin
with the same syntax and output.

Both ``first`` and ``alpha``
can also be used as keywords
with the :ref:`span mixin <tools-span-mixin>`.


-------------------------------------------------------------------------

.. _tools-row-last:

Last
~~~~

.. describe:: mixin

  :format: ``last($context)``
  :alternate: ``omega($context)``
  :$context: :ref:`\<layout\> <shorthand-layout>`

.. note::

  Only required when
  :ref:`gutter-position <settings-gutter-position>`
  is set to ``after``,
  but can be useful in any context
  to help with sub-pixel rounding issues.

When :ref:`gutter-position <settings-gutter-position>`
is set to ``after``
we need to remove the gutter
from the last element in every row,
and :ref:`optionally float in the opposite direction <settings-last-flow>`.
This can often be solved
using a keyword in the :ref:`span mixin <tools-span-edge>`.
Sometimes you need to set an item as ``last``
outside the span mixin.

.. code-block:: scss

  .last { @include last; }

We also support an ``omega`` mixin
with the same syntax and output.

Both ``last`` and ``omega``
can also be used as keywords
with the :ref:`span mixin <tools-span-mixin>`.


-------------------------------------------------------------------------

.. _tools-row-full:

Full
~~~~

.. describe:: mixin

  :format: ``full($context)``
  :$context: :ref:`\<layout\> <shorthand-layout>`

This is a shortcut for
``span(full)``,
used to create elements
that span their entire context.

.. code-block:: scss

  .last { @include full; }

``full`` can also be used as a keyword
with the :ref:`span mixin <tools-span-mixin>`.


-------------------------------------------------------------------------

.. _tools-margin:

Margins
-------

Shortcut mixins
for applying left/right margins.


-------------------------------------------------------------------------

.. _tools-margin-pre:

Pre
~~~

.. describe:: mixin

  :format: ``pre($span)``
  :alternate: ``push($span)``
  :$span: :ref:`\<span\> <shorthand-span>`

Add margins before an element,
depending on the :ref:`flow <settings-flow>` direction.

.. code-block:: scss

  .example1 { @include pre(25%); }
  .example2 { @include push(25%); }
  .example3 { @include pre(2 of 7); }
  .example4 { @include push(2 of 7); }


-------------------------------------------------------------------------

.. _tools-margin-post:

Post
~~~~

.. describe:: mixin

  :format: ``post($span)``
  :$span: :ref:`\<span\> <shorthand-span>`

Add margins after an element,
depending on the :ref:`flow <settings-flow>` direction.

.. code-block:: scss

  .example1 { @include post(25%); }
  .example2 { @include post(2 of 7); }


-------------------------------------------------------------------------

.. _tools-margin-pull:

Pull
~~~~

.. describe:: mixin

  :format: ``pull($span)``
  :$span: :ref:`\<span\> <shorthand-span>`

Add negative margins before an element,
pulling it against the direction of :ref:`flow <settings-flow>`.

.. code-block:: scss

  .example1 { @include pull(25%); }
  .example2 { @include pull(2 of 7); }


-------------------------------------------------------------------------

.. _tools-margin-squish:

Squish
~~~~~~

.. describe:: mixin

  :format: ``squish($pre [, $post])``
  :$pre: :ref:`\<span\> <shorthand-span>`
  :$post: [optional] :ref:`\<span\> <shorthand-span>`

Shortcut for adding both :ref:`pre <tools-margin-pre>`
and :ref:`post <tools-margin-post>` margins
to the same element.

.. code-block:: scss

  // equal pre and post
  .example1 { @include squish(25%); }

  // distinct pre and post
  .example2 { @include squish(1, 3); }

When they share identical context,
you can pass ``pre`` and ``post`` spans
in the same argument.
This is often the case,
and saves you from repeating yourself.

.. code-block:: scss

  // shared context
  .shared {
    @include squish(1 3 of 12 no-gutters);
  }

  // distinct context
  .distinct {
    @include squish(1 at 2, 3 at 6);
  }


-------------------------------------------------------------------------

.. _tools-padding:

Padding
-------

Shortcut mixins
for applying left/right padding.

.. note::

  The interaction between padding and width changes
  depending on your given :ref:`box-model <tools-box-sizing>`.
  In the browser-default `content-box` model,
  width and padding are added together,
  so that an item with ``span(3)`` and ``prefix(2)``
  will occupy a total of 5 columns.
  In the recommended `border-box` model,
  padding is subtracted from the width,
  so that an item with ``span(3)`` will always
  occupy 3 columns,
  no matter what padding is applied.


-------------------------------------------------------------------------

.. _tools-padding-prefix:

Prefix
~~~~~~

.. describe:: mixin

  :format: ``prefix($span)``
  :$span: :ref:`\<span\> <shorthand-span>`

Add padding before an element,
depending on the :ref:`flow <settings-flow>` direction.

.. code-block:: scss

  .example1 { @include prefix(25%); }
  .example2 { @include prefix(2 of 7); }


-------------------------------------------------------------------------

.. _tools-padding-suffix:

Suffix
~~~~~~

.. describe:: mixin

  :format: ``suffix($span)``
  :$span: :ref:`\<span\> <shorthand-span>`

Add padding after an element,
depending on the :ref:`flow <settings-flow>` direction.

.. code-block:: scss

  .example1 { @include suffix(25%); }
  .example2 { @include suffix(2 of 7); }


-------------------------------------------------------------------------

.. _tools-padding-pad:

Pad
~~~

.. describe:: mixin

  :format: ``pad($prefix [, $suffix])``
  :$prefix: :ref:`\<span\> <shorthand-span>`
  :$suffix: :ref:`\<span\> <shorthand-span>`

Shortcut for adding both :ref:`prefix <tools-padding-prefix>`
and :ref:`suffix <tools-padding-suffix>` padding
to the same element.

.. code-block:: scss

  // equal pre and post
  .example1 { @include pad(25%); }

  // distinct pre and post
  .example2 { @include pad(1, 3); }

When they share identical context,
you can pass ``pre`` and ``post`` spans
in the same argument.
This is often the case,
and saves you from repeating yourself.

.. code-block:: scss

  // shared context
  .shared {
    @include pad(1 3 of 12 no-gutters);
  }

  // distinct context
  .distinct {
    @include pad(1 at 2, 3 at 6);
  }


-------------------------------------------------------------------------

.. _tools-bleed:

Bleed
-----

.. describe:: mixin

  :format: ``bleed($bleed)``
  :$bleed: :abbr:`TRBL (Top Right Bottom Left)`
           :ref:`\<span\> <shorthand-span>`

Apply negative margins
and equal positive padding,
so that element borders and backgrounds "bleed"
outside of their containers,
without the content be affected.

This uses the standard :ref:`span shorthand <shorthand-span>`,
but takes anywhere from one to four widths,
using the common :abbr:`TRBL (Top Right Bottom Left)` pattern
from CSS.

.. code-block:: scss

  // input
  .example1 { @include bleed(1em); }
  .example2 { @include bleed(1em 2 20px 5% of 8 .25); }

  // output
  .example1 {
    margin: -1em;
    padding: 1em;
  }

  .example2 {
    margin-top: -1em;
    padding-top: 1em;
    margin-right: -22.5%;
    padding-right: 22.5%;
    margin-bottom: -20px;
    padding-bottom: 20px;
    margin-left: -5%;
    padding-left: 5%;
  }

When possible,
the ``bleed`` mixins will attempt
to keep gutters intact.
Use the ``no-gutters`` keyword
to override that behavior.


-------------------------------------------------------------------------

.. _tools-bleed-x:

Bleed-x
~~~~~~~

.. describe:: mixin

  :format: ``bleed-x($bleed)``
  :$bleed: :abbr:`LR (Left Right)`
           :ref:`\<span\> <shorthand-span>`

A shortcut for applying only left and right
(horizontal) bleed.

.. code-block:: scss

  // input
  .example { @include bleed-x(1em 2em); }

  // output
  .example {
    margin-left: -1em;
    padding-left: 1em;
    margin-right: -2em;
    padding-right: 2em;
  }


-------------------------------------------------------------------------

.. _tools-bleed-y:

Bleed-y
~~~~~~~

.. describe:: mixin

  :format: ``bleed-y($bleed)``
  :$bleed: :abbr:`TB (Top Bottom)`
           :ref:`\<span\> <shorthand-span>`

A shortcut for applying only top and bottom
(vertical) bleed.

.. code-block:: scss

  // input
  .example { @include bleed-y(1em 2em); }

  // output
  .example {
    margin-top: -1em;
    padding-top: 1em;
    margin-bottom: -2em;
    padding-bottom: 2em;
  }


-------------------------------------------------------------------------

.. _tools-isolate:

Isolate
-------

.. describe:: mixin

  :format: ``isolate($isolate)``
  :$isolate: :ref:`\<span\> <shorthand-span>`

Isolation is a layout technique based on floats,
but adjusted to `address sub-pixel rounding issues`_.
Susy supports it as a global :ref:`output <settings-output>` setting,
or as a :doc:`shorthand` keyword for the ``span`` mixin,
or as a stand-alone mixin.

The ``$isolate`` argument takes a standard
:ref:`span shorthand <shorthand-span>`,
but any length or grid-index given
is interpreted as an isolation location
(unless location is otherwise specified with the ``at`` flag).
The function returns a length value.

.. code-block:: scss

  // input
  .function {
    margin-left: isolate(2 of 7 .5 after);
  }

  // output
  .function {
    margin-left: 15%;
  }

And the mixin returns
all the properties required for isolation.

.. code-block:: scss

  // input
  .mixin { @include isolate(25%); }

  // output
  .mixin {
    float: left;
    margin-left: 25%;
    margin-right: -100%;
  }

.. _`address sub-pixel rounding issues`: http://www.palantir.net/blog/responsive-design-s-dirty-little-secret


-------------------------------------------------------------------------

.. _tools-gallery:

Gallery
-------

.. describe:: mixin

  :format: ``gallery($span, $selector)``
  :$span: :ref:`\<span\> <shorthand-span>`
  :$selector: (nth-) ``child``:abbr:`* (default)` | ``of-type``

Gallery is a shortcut for creating gallery-style layouts,
where a large number of elements are laid out on a consistent grid.
We take the standard :ref:`span shorthand <shorthand-span>`
and apply it to all the elements,
using ``nth-child`` or ``nth-of-type`` selectors
and the isolation technique to arrange them on the grid.

.. code-block:: scss

  // each img will span 3 of 12 columns,
  // with 4 images in each row:
  .gallery img {
    @include gallery(3 of 12);
  }

.. warning::

  The `nth-child` selector
  `has issues on iOS8 Safari`_.
  Use `nth-of-type` for iOS8 support.

  .. _has issues on iOS8 Safari: http://stackoverflow.com/questions/26032513/ios8-safari-after-a-pushstate-the-nth-child-selectors-not-works


-------------------------------------------------------------------------

.. _tools-show-grid:

Show Grid
---------

.. describe:: mixin

  :format: ``show-grid($grid)``
  :$grid: :ref:`\<layout\> <shorthand-layout>`

The easiest way to show you grids
is by adding a :ref:`keyword <settings-debug-image>`
to your :ref:`container <tools-container>` mixin.
If you need to apply the grid separately,
the ``show-grid`` mixin takes exactly the same
:ref:`layout shorthand <shorthand-layout>` arguments,
and can output the debugging grid image
as either a background, or a triggered overlay.

.. code-block:: scss

  body {
    @include container;
    @include show-grid(overlay);
  }

.. warning::

  Grid images are not exact.
  Browsers have extra trouble with
  sub-pixel rounding on background images.
  These are meant for rough debugging,
  not for pixel-perfect measurements.
  Expect the ``to`` side of your grid image
  (``right`` if your flow is ``ltr``)
  to be off by several pixels.


-------------------------------------------------------------------------

.. _tools-breakpoint:

Breakpoint
----------

Susy has built-in media-query handling,
and also supports integration with the `Breakpoint`_ plugin.
To install Breakpoint,
follow the instuctions on their site.

.. _Breakpoint: http://breakpoint-sass.com/


-------------------------------------------------------------------------

.. _tools-susy-breakpoint:

Susy Breakpoint
~~~~~~~~~~~~~~~

.. describe:: mixin

  :format: ``susy-breakpoint($query, $layout, $no-query)``
  :$query: media query shorthand (see :ref:`susy-media <tools-susy-media>`)
  :$layout: :ref:`\<layout\> <shorthand-layout>`
  :$no-query: <boolean> | <string> (see :ref:`susy-media <tools-susy-media>`)

``susy-breakpoint()`` acts as a shortcut
for changing layout settings at different media-query breakpoints,
using either :ref:`susy-media <tools-susy-media>` or
the third-party `Breakpoint`_ plugin.

If you are using the third-party plugin,
see `Breakpoint: Basic Media Queries`_ and
`Breakpoint: No Query Fallbacks`_ for details.

This mixin acts as a wrapper,
adding media-queries and
changing the layout settings for any susy functions or mixins
that are nested inside.

.. code-block:: scss

  @include susy-breakpoint(30em, 8) {
    // nested code uses an 8-column grid,
    // starting at a 30em min-width breakpoint...
    .example { @include span(3); }
  }

.. _`Breakpoint: Basic Media Queries`: https://github.com/Team-Sass/breakpoint/wiki/Basic-Media-Queries
.. _`Breakpoint: No Query Fallbacks`: https://github.com/Team-Sass/breakpoint/wiki/No-Query-Fallbacks


-------------------------------------------------------------------------

.. _tools-susy-media:

Susy Media
~~~~~~~~~~

.. describe:: mixin

  :format: ``susy-media($query, $no-query)``
  :$query: <min-width> [<max-width>] | <string> | <pair> | <map>
  :$no-query: <boolean> | <string>

The ``susy-media`` mixin provides basic media-query handling,
and handles the built-in functionality for ``susy-breakpoint``.

``$query``
  A single length will be used as a `min-width` query,
  two lengths will become `min-` and `max-` width queries,
  a property-value pair, or map of pairs
  will become ``(property: value)`` queries,
  and a lonely string will be used directly.

.. code-block:: scss

  // min
  // ---
  @include susy-media(30em) { /*...*/ }

  @media (min-width: 30em) { /*...*/ }

  // min/max pair
  // ------------
  @include susy-media(30em 60em) { /*...*/ }

  @media (min-width: 30em) and (max-width: 60em) { /*...*/ }

  // property/value pair
  // -------------------
  @include susy-media(min-height 30em) { /*...*/ }

  @media (min-height: 30em) { /*...*/ }

  // map
  // ---
  @include susy-media((
    min-height: 30em,
    orientation: landscape,
  )) { /*...*/ }

  @media (min-height: 30em) and (orientation: landscape) { /*...*/ }


``$no-query``
  ``true`` will render the contents to css without any media-query.
  This can be useful for creating separate no-query fallback files.

  For inline fallbacks using a target class,
  pass in a string (e.g. `.no-mqs`) to use as your fallback selector.
  The contents will be output both inside a media-query
  and again inside the given selector.

  This can be set globally with the ``$susy-media-fallback`` variable.

``susy-media`` also supports named media-queries,
which can be set using the ``$susy-media`` variable:

.. code-block:: scss

  $susy-media: (
    min: 20em,
    max: 80em 60em,
    string: 'screen and (orientation: landscape)',
    pair: min-height 40em,
    map: (
      media: screen,
      max-width: 30em
    ),
  );

  @include susy-media(min);
