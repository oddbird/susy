Upgrade Path
============

Susy ``2.x`` supports two syntax options, side by side.
If you want to use the latest release
but keep the old syntax,
change your import from ``susy`` to ``susyone``.

.. code-block:: scss

  // With Susy 2.x installed...
  @import "susyone";

If you ever want to upgrade to the new syntax,
change the import back to ``susy``,
and follow these instructions:


-------------------------------------------------------------------------

Settings
--------

In SusyOne, settings were handled as variables.

.. code-block:: scss

  // the basics
  $columns: 12;
  $column-width: 4em;
  $gutter-width: 1em;
  $grid-padding: 1em;

  // advanced
  $container-width: false;
  $container-style: magic;
  $from-direction: left;
  $omega-float: right;

  // media-query fallbacks
  $breakpoint-media-output: true;
  $breakpoint-ie-output: true;
  $breakpoint-raw-output: false;


Removed Settings
~~~~~~~~~~~~~~~~

All the media-query fallback settings have been dropped.
Susy 2 no longer manages media-queries,
but we play well with other media-query libraries,
and include special
:ref:`Breakpoint integration <tools-susy-breakpoint>`.
See `their documentation`_ for handling legacy browsers.

.. _`their documentation`: https://github.com/Team-Sass/breakpoint/wiki/Basic-Media-Queries

We've also dropped ``$grid-padding`` as a setting.
If you want to add padding to your container,
you can easily do it by hand.


Translation
~~~~~~~~~~~

The remaining settings can be easily mapped
into the new syntax.

.. code-block:: scss

  $susy: (
    // the basics
    columns: $total-columns,
    gutters: $gutter-width / $column-width,
    column-width: $column-width,

    // advanced
    container: $container-width,
    math: if($container-style == magic, fluid, $container-style),
    flow: if($from-direction == right, rtl, ltr),
    last-flow: if($omega-float == $from-direction, from, to),
  );

There are a few differences to note in the translation.

- You can set either ``column-width`` or ``container`` (or neither),
  but never both.
  One can be calculated from the other,
  but if you set both we don't know which one should have priority.
- If you are using ``static`` math
  we highly recommend that you use ``column-width``
  rather than ``container``.
- The old ``magic`` style can be achieved
  through a combination of ``fluid`` math
  and a width setting (either ``column-width`` or ``container``).

See :doc:`settings` for more details.


-------------------------------------------------------------------------

Functions
---------

Columns / Space
~~~~~~~~~~~~~~~

The ``columns`` and ``space`` functions from SusyOne
have now been merged into the new
:ref:`span function <tools-span-function>`.

.. code-block:: scss

  // columns/space: <span> [, <context>, <math>]
  $columns: columns(3, 6, static);
  $space: space(2, 7, fluid);

  // span
  $span-columns: span(3 of 6 static);
  $span-space: span(2 of 7 fluid wide);

The difference between ``columns`` and ``space``
in the old syntax
is now covered by the ``narrow`` and ``wide``
:ref:`spread <tools-span-spread>` keywords
(with ``narrow`` being the default in most cases).

Gutter
~~~~~~

The :ref:`gutter function <tools-gutter>` remains,
but the syntax has changed.

.. code-block:: scss

  // gutter([<context>, <math>])
  $old: gutter(6, static);
  $new: gutter(6 static);


-------------------------------------------------------------------------

Basic Mixins
------------

Container
~~~~~~~~~

The :ref:`container mixin <tools-container>` remains,
but media-query support has been removed.
For now, at least,
you'll have to establish one container at a time
inside media-query declarations.

In most (fluid/magic) cases,
we set up the container for our largest layout,
and let it flex fluidly from there.
If you need to change explicit sizes at explicit breakpoints,
we recommend using the ``container`` *function*
to override only the width at different breakpoints.

.. code-block:: scss

  // old
  body {
    @include container(4, 50em 8, 80em 12);
  }

  // new (simple)
  body { @include container(12); }

  // new (with breakpoint plugin)
  body {
    @include container(4);
    @include breakpoint(50em) { max-width: container(8); }
    @include breakpoint(80em) { max-width: container(12); }
  }

Span Columns
~~~~~~~~~~~~

The ``span-columns`` mixin has been renamed
:ref:`span <tools-span-mixin>`,
and has much more power and flexibility.
The old ``$padding`` argument has been removed,
but everything else tranlates cleanly.
Note that ``$from`` took ``right`` or ``left`` as options,
where the new ``flow`` setting takes ``rtl`` or ``ltr``.

.. code-block:: scss

  // span-columns(<$columns> [<omega> , <$context>, <$padding>, <$from>, <$style>])
  .old { @include span-columns(3 omega, 12, $padding, left, static); }
  .new { @include span(last 3 of 12 ltr static); }

Omega
~~~~~

The :ref:`omega mixin <tools-row-last>` still esists,
and should work without any changes.
For readability, ``omega`` can be replaced with ``last``,
but that's up to you.

``nth-omega`` has been deprecated,
in favor of ``omega`` with nth-child selectors.

.. code-block:: scss

  .old { @include nth-omega(last); }
  .new:last-child { @include omega; }


-------------------------------------------------------------------------

Responsive Design
-----------------

At-Breakpoint
~~~~~~~~~~~~~

Media-query support has been removed from the Susy core,
because there are so many more powerful and flexible
query-handling plugins.
We recommend using `Breakpoint`_,
and we've written a translation of ``at-breakpoint``
(now called :ref:`susy-breakpoint <tools-susy-breakpoint>`)
that integrates smoothly with their controls.

.. code-block:: scss

  .old {
    @include at-breakpoint(30em 8 60em) {
      // your 8-column media-query content...
    }
  }

  .new {
    @include susy-breakpoint(30em 60em, 8) {
      // your 8-column media-query content...
    }
  }

This looks like a minor change,
but it exposes a lot more power in both the media-queries
and the changes to layout.
See the `Breakpoint`_ docs for more detail on the former,
and use our :doc:`shorthand <shorthand>` to control the latter
in detail.

.. _Breakpoint: http://breakpoint-sass.com/

Layout & With-Grid-Settings
~~~~~~~~~~~~~~~~~~~~~~~~~~~

the ``layout`` and ``with-grid-settings`` mixins
have merged to become :ref:`with-layout <settings-layout>`.
They continue to work much like before,
with extra power exposed
through the :doc:`shorthand <shorthand>` syntax.

.. code-block:: scss

  // old
  @include layout(12) { /* your 12-column layout */ }
  @include with-grid-settings(8, 4em, 1em) { /* your custom layout */ }

  // new
  @include with-layout(12) { /* your 12-column layout... */ }
  @include with-layout(8 (4em 1em)) { /* your custom layout */ }

There is still a mixin named ``layout``,
but it changes the global layout settings
rather than wrapping a layout block.

.. code-block:: scss

  // global layout
  @include layout(12);

  /* your 12-column layout... */

Set Container Width
~~~~~~~~~~~~~~~~~~~

The ``set-container-width`` mixin
can be replaced by applying the
:ref:`container function <tools-container>`
to the ``width`` or ``max-width`` of your containing element.

.. code-block:: scss

  // old
  .fluid { @include set-container-width(8, fluid); }
  .static { @include set-container-width(12, static); }

  // new
  .fluid { max-width: container(8); }
  .static { width: container(12); }


-------------------------------------------------------------------------

Grid Helpers
------------

Border-Box Sizing
~~~~~~~~~~~~~~~~~

The setting has changed
from the boolean ``$border-box-sizing``
to the new :ref:`global-box-sizing <settings-global-box-sizing>`,
but the :ref:`border-box-sizing <tools-box-sizing>` mixin
works exactly like before.

Isolate
~~~~~~~

Isolation no longer requires it's own mixin,
as it can be controlled now through the
:ref:`span mixin <tools-span-mixin>` for most cases.
In those cases where you do still need a distinct mixin,
:ref:`isolate <tools-isolate>` remains much like before.

.. code-block:: scss

  .old { @include isolate(2, 12, left, static); }
  .new { @include isolate(2 of 12 ltr static); }

Isolate Grid
~~~~~~~~~~~~

the ``isolate-grid`` mixin has been renamed
:ref:`gallery <tools-gallery>`,
but is very similar in use.

.. code-block:: scss

  .gallery-old { @include isolate-grid(3, 12, child, left, fluid); }
  .gallery-new { @include gallery(3 of 12 left fluid, child); }

Only the ``selector`` argument remains split off from the others.

Margins and Padding
~~~~~~~~~~~~~~~~~~~

All the margin and padding mixins —
``pre``, ``post``, ``push``, ``pull``,
``prefix``, ``suffix``, ``pad``, ``squish`` —
remain unchanged,
except that we now use the :doc:`shorthand syntax <shorthand>`
in place of all the arguments.

See the new
:ref:`margins / padding <tools-margin>` documentation
for details.

Bleed
~~~~~

Besides upgrading to the new shorthand,
the :ref:`bleed <tools-bleed>` mixin now also supports
:abbr:`TRBL (Top Right Bottom Left)` syntax
for applying to different sides,
along with ``bleed-x`` and ``bleed-y`` shortcuts
for horizontal and vertical bleed.

.. code-block:: scss

  .old { @include bleed(2, left right); }
  .new { @include bleed-x(2); }

Susy Grid Background
~~~~~~~~~~~~~~~~~~~~

This has been renamed :ref:`show-grid <tools-show-grid>`,
and otherwise remains intact.

Reset-Columns / Remove-Omega
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Susy One included ``reset-columns``
and ``remove-omega``,
but both have been deprecated.
Rather than removing styles,
override them with the desired behavior.
The :ref:`full <tools-row-full>` and :ref:`span <tools-span-mixin>`
mixins should give you everything you need
for overriding spans and omegas, respectively.
