Changelog
=========


3.0.0 - June 29, 2017
---------------------

See [Introducing Susy3](http://oddbird.net/2017/06/28/susy3),
[Undesanding Spread in Susy3](http://oddbird.net/2017/06/13/susy-spread/).

- No code changes from the beta
- Site moved to [oddbird.net/susy/](http://oddbird.net/susy/)
- Docs moved to [oddbird.net/susy/docs/](http://oddbird.net/susy/docs/)
- Document beta deprecations
- Add full documentation


3.0.0-beta.1 - June 19, 2017
----------------------------

- BREAKING: `_prefix.scss` has been renamed `_susy-prefix.scss`
  for clarity when importing.
- BREAKING: `susy-call()` has been renamed `su-call()`.
  since it is directly related to accessing the `su` functions.
- BREAKING: Remove support for non-list `columns`:
  `'columns': 4` => `'columns': susy-repeat(4)` == `'columns': 1 1 1 1`.
- BREAKING: Remove support for `$count x $width` syntax in `columns`:
  `'columns': 4 x 120px` =>
  `'columns': susy-repeat(4, 120px)` == `'columns': 120px 120px 120px 120px`.
- BREAKING: Remove rubygems/bower, to distribute on npm only.
- BREAKING: Add support for `calc()` output,
  so all mixed-unit grids are possible.
  This means the old inside-static solution
  has been replaced by calc() output as well.
- BREAKING: `su-sum` has been renamed `_su-sum`
  and is now considered a private function.
- SVG background images now have a default size included.
  You can override the default using the CSS `background-size` property.
- Add list-flattening to columns normalization,
  so that `susy-repeat()` can be used along-side other values.
- Improved documentation


3.0.0-alpha.6 - Apr 25, 2017
----------------------------

- Fix bug in empty `gutter()` alias
- Add `susy-repeat()` function
  to generate repeating gradients with the same syntax
  provided in CSS Grid templates
- Add `susy-compile()` and `susy-call()` plugin helpers,
  to aide with conversions between the user API and
  internal math functions.


3.0.0-alpha.5 - Feb 14, 2017
----------------------------

- SVG Grid plugin, to provide grid-debugging options:
  - `svg-grid-colors` global setting accepts one or more colors
  - `susy-svg-grid()` function returns inline svg
    for use in the `background` or generated `content` properties
- Add `set-gutters $n` shorthand to override global gutter settings
- Allow gutters function to take either context-only,
  or full span/context shorthand —
  useful when passing in details from a combined mixin
- More test coverage, including error-handling!


3.0.0-alpha.1 - Sep 6, 2016
---------------------------

- No Mixins!
- Trim down to the core math, and a thin layer of api functions:
  - `susy-span()` to return a column-spanning width
  - `susy-gutter()` to return a gutter width
  - `susy-slice()` to return a slice of asymmetrical grid
- Simplify to four settings:
  - `columns` to define the grid columns
    as a list of comparable or unitless relative numbers
  - `gutters` to define the size of a gutter
    in units comparable to the columns,
    or a unitless relative number
  - `spread` to define the default spread of a span
    across adjacent gutters
  - `container-spread` to define the default spread of a container
    across side-edge gutters
- Shorthand syntax for overriding settings on-the-fly:
  - starting with a count, length, or column-list span
  - `at $n`, `first`, or `last` location on asymmetrical grids
  - `narrow`, `wide`, or `wider` for spread
  - `of $n <spread>` for available grid columns and container-spread


2.2.5 - May 14 2015
-------------------

- Pass grid arguments to overlay positioning mixin.


2.2.3 - Apr 28 2015
-------------------

- Work around libsass fraction bug.


2.2.2 - Jan 23 2015
-------------------

- Fix bug in npm package.


2.2.1 - Jan 14 2015
-------------------

- Release npm ``susy`` package.
- Add global ``$susy-media`` map for creating named breakpoints.
- Add internal media-query support for ``susy-breakpoint``
  without requiring the Breakpoint plugin.
- ``susy-breakpoint`` mixin no longer requires ``$layout`` argument.
  By default, no changes will be made to your existing layout.
- Update ``global-box-sizing`` and the legacy ``border-box-sizing``
  mixins to optionally take another argument, ``$inherit``. This new
  argument is a boolean value that defaults to ``false``, meaning the
  behavior of these mixins will not change by default. The default
  behavior sets all elements to use the specified ``box-sizing``,
  which can only be changed explicitly on a per-element basis. By passing
  in ``$inherit`` as ``true``, the ``box-sizing`` is set on the
  ``html`` element, and all other elements inherit this property. This
  means that the ``box-sizing`` can be changed at the component level
  and all nested elements will inherit this change. This cascading
  effect can be prevented by explicitly setting ``box-sizing`` on the
  exceptions within the nested context.
- Add ``su`` import at root level.
- Both ``su`` and ``susy`` work with the latest LibSass master branch (3.0.2+).
  There are a few exceptions:

  + The ``susysone`` syntax
  + ``overlay`` grid output
  + The ``inherit`` option for ``global-box-sizing`` & ``border-box-sizing``


2.1.3 - Jul 16 2014
-------------------

- Baseline grid image uses `px` instead of `%`.
- Updated Sass dependency to work with 3.4.


2.1.2 - Apr 28 2014
-------------------

- ``first`` and ``last`` keywords output ``0`` margins instead of ``null``
  so they can be used to override previous span settings.
- Output ``:before`` / ``:after`` rather than ``::before`` / ``::after``
  to support IE8.
- Load Susy paths in Compass if required, otherwise add it to SASS_PATH.
  [`Adrien Antoine <https://github.com/Alshten>`_]
- Compass 1.0 config no longer needs to ``require 'susy'``.
  Susy is registered with Compass automatically.
- Add ``$clean`` argument to ``layout`` and ``with-layout`` mixins,
  for creating new layout contexts from a clean slate.


2.1.1 - Mar 13 2014
-------------------

- Rename core math functions, and prepare for decomposition.

  + ``column-count()`` => ``susy-count()``
  + ``column-sum()`` => ``susy-sum()``
  + ``column-span()`` => ``susy-slice()``
  + ``column-span-sum()`` => ``susy()``

- Add tests for core math validation.


2.0.0 — Mar 10 2014
-------------------

- New susyone tests for split-columns, is-default-layout, medialayout, columns,
  relative-width, columns width and nth-of-type (using True).
- Sass 3.3.0 (Maptastic Maple)
- Rename local 2.0 variables that conflict with global susyone settings.
- Susyone container mixin applies full container settings at every breakpoint.


2.0.0.rc.2 — Mar 4 2014
-----------------------

- Fix `templates_path` and compass project templates
- Fix Compass "rem" integration to respect ``$rhythm-units`` setting.


2.0.0.rc.1 — Feb 7 2014
-----------------------

- Add browser support module with settings to ``use-custom`` mixins
  for ``background-image``,
  ``background-options`` (``-size``, ``-clip``, ``-origin``),
  ``box-sizing``, ``clearfix``, and ``rem``.
  If you set to ``false``,
  we'll make sure everything works well on modern browsers.
  If you set to ``true``,
  we'll check for existing mixins (e.g. from Compass or Bourbon)
  to provide more powerful legacy support.

  .. code-block: scss

    $susy: (
      use-custom: (
        clearfix: false,
        background-image: true,
        background-options: false,
        box-sizing: true,
        rem: true,
      ),
    );

- Fix bugs caused by Sass changes to ``str-index()``,
  ``#{&}``, and ``@at-root``.
- Fix Bower dependencies, and add support for Sache.
- Remove legacy Compass polyfils from susyone code.


2.0.0.beta.3 — Jan 10 2014
--------------------------

- Fix a bug making ``show-grid`` unaware of local ``debug/output`` keywords.
- Added Susyone syntax for those that need to use the old Susy syntax,
  with updated Sass and Compass.

  + ``@import 'susyone';``


2.0.0.beta.2 — Jan 6 2014
-------------------------

- Allow nesting of Susy settings.
- ``show-grid`` mixin can output either background or overlay grids.
- Add ``isolate`` function to return isolation offset width.
- Fix a bug with ``last`` output for ``split``-gutter layouts.
- Fix a bug with split-gutter ``span()``, and ``narrow``/``wider`` keywords.
- Fix a bug with ``bleed`` and ``null`` + ``inside`` gutters.
- ``bleed`` output uses TRBL shorthand when possible.
- Clean up and document the core math functions.
- Document upgrade path, core-math, and DIY grids.

BREAKING:

- Move debug settings into ``$susy: (debug: (<settings>));``.
- Replace ``show-grid`` setting with new ``debug: image`` setting.
- Add ``debug: output`` setting and keywords
  to toggle between ``background`` and ``overlay`` grid images.
- Remove ``grid-overlay`` mixin.

  + Becomes part of ``show-grid`` mixin.
  + Doesn't take ``$selector`` argument — should be nested instead.
  + Can still be used multiple times.

- ``isolate`` mixin now interprets span argument as location,
  unless location is otherwise specified.

  + ``isolate(2)`` is the same as ``isolate(at 2)``.
  + ``isolate(25%)`` will isolate *at* ``25%``.

- Rename setting controls for consistency.

  + ``set-grid`` => ``layout``
  + ``use-grid`` => ``with-layout``

- ``pad`` and ``squish`` use RL shorthand for shared context.

  + ``pad(1, 3 of 12)`` => ``pad(1 3 of 12)``


2.0.0.beta.1 — Dec 24 2013
--------------------------

- Add ``susy-breakpoint`` mixin for basic integration with `Breakpoint`_.

  + Syntax: ``breakpoint($query, $layout, $no-query)``
    where ``$query`` and ``no-query`` follow the Breakpoint syntax,
    and ``$layout`` uses the Susy syntax for defining grids.

- Add ``layout`` function to convert layouts from shorthand syntax to map.
- Add ``full`` keyword shortcut for full-width spans.
- BREAKING: Remove unclear ``row`` and ``unrow`` mixins.
- Add ``break`` and ``nobreak`` mixins/keywords
  to create a new line before any element in the layout.
- BREAKING: Rename ``is-container: container`` setting/value to ``role: nest``.
- BREAKING: Rename ``layout-method`` setting to ``output``.
- BREAKING: Rename ``layout-math`` setting to ``math``.
- Clean up division between math/output/syntax layers.
- ``gutters`` and ``container-position`` can be set to ``null``.
- If ``gutters`` are set to ``0`` or ``null``, they will have no output.
- BREAKING: ``full`` output matches span patterns.
- BREAKING: Debug grids are hidden by default.
- BREAKING: Remove ``nth-last``/``-omega``/``-first``/``-alpha``
  as confusing & out-of-scope.
  Format your nth-selectors manually to apply ``first``/``last`` mixins.
- Gutter mixins/functions can accept context-only (without the "of" syntax):

  + ``gutters(of 10 .25)`` == ``gutters(10 .25)``
  + Unitless numbers are used for context.
  + Lengths (with units) are used as explicit gutter-overrides.

- BREAKING: Re-purposed ``susy-set`` as reverse of ``susy-get`` —
  to adjust a single setting.
  Example: ``@include susy-set(gutter-position, inside);``

- Replace global ``box-sizing`` setting with ``global-box-sizing``.

  + Let Susy know what box model you are using globally.
  + ``box-sizing`` can still be passed as a keyword argument.

- Add ``global-box-sizing()`` mixin to set your global box model.

  + Example: ``@include global-box-sizing(border-box);``
  + You can still use the legacy ``@include border-box-sizing;`` as a shortcut.
  + Uses your global setting as a default.
  + Updates your global setting to match, if you pass a different value.

- ``gallery`` and ``span`` mixins take global-box-sizing into account.

.. _Breakpoint: http://breakpoint-sass.com/


2.0.0-alpha.6 — Dec 5 2013
--------------------------

- Rewrite syntax parsing so parser and resulting maps are shared across Susy.
- Fix explicit-span bug causing large gutters.
- Padding mixins now respect inside gutters.

Backwards Incompatible:

- Removed ``gutters $n`` keyword in shorthand syntax
  for setting explicit gutters.
  Use ``(gutter-override: $n)`` map instead.


2.0.0-alpha.5 — Nov 25 2013
---------------------------

- Compass is no longer a dependency.

  + Only registers as a compass extension if compass is present.

- Any mixin/function that accepts natural language syntax also accepts maps.
- Maps and natural language can be mixed:

  + ``$large: (columns: 12, gutters: .5);``
  + ``span(3 $large no-gutters)``

- Add ``full`` mixin for full-width spans.

Backwards Incompatible:

- Requires Sass 3.3
- Default settings are handled with a Sass map on the ``$susy`` variable.
  Example: ``$susy: (columns: 12, gutters: .25)`` etc.

- ``bleed`` now takes standard span syntax, with multiple (TRBL) spans.

  + e.g. ``bleed(1em 2 of 8)`` for 1em top/bottom and 2-columns left/right.
  + Add ``bleed-x``/``bleed-y`` mixins for horizontal and vertical shortcuts.

- Span arguments now accept ``narrow``, ``wide``, or ``wider`` keywords.

  + The ``wide`` keyword replaces the old ``outer`` keyword.
  + This setting has been re-named from ``outer`` to ``spread``.

- Re-wrote grid debugging

  + More concise & accurate output for symmetrical grids.
  + Changed ``grid-background()`` to ``show-grid()``/``show-grids()``
  + Changed ``overlay-grid()`` to ``grid-overlay()``
  + Moved settings into ``$debug: (color: rgba(#66f, .25), toggle: top right);``
  + Removed overlay-position setting.
  + Only display vertical-rhythms when ``$base-line-height`` is available.

- ``split`` gutters are no longer removed at the grid edges.

  + ``first`` and ``last`` are not special cases for split gutter-handling.
  + pass the ``container`` argument to wrappers you plan to nest inside.

- ``first``/``alpha``/``last``/``omega``/``nth-`` mixins require grid context.


2.0.0-alpha.4 — Sept 4 2013
---------------------------

- Add ``bleed`` mixin.
- Fix bug with fluid inside-gutter calculations.
- ``$last-flow`` setting controls the flow direction of row-ending elements.
- ``background-grid-output`` now accepts ``$line-height`` argument.
- Compass modules are imported as needed.
- ``grid-background``, ``grid-overlay``, ``grid-background-output``,
  & ``$grid-background-color``
  have been renamed to remiain consistent and avoid conflicts with Compass:

  + ``grid-background`` => ``background-grid``
  + ``grid-overlay`` => ``overlay-grid``
  + ``grid-background-output`` => ``background-grid-output``
  + ``$grid-background-color`` => ``$grid-color``

- ``span`` mixing accepts nested ``@content``, and uses nested context.
- Add ``inside-static`` option for static gutters in otherwise fluid grids.
- ``gutters`` mixin uses span syntax, accepts explicit gutter span.
- Explicit gutter-overrides are divided when gutters are ``split``/``inside``.


2.0.0-alpha.3 — July 9 2013
---------------------------

- ``row`` now includes clearfix, and ``unrow`` removes clearfix.
- ``gallery`` output should override previous gallery settings.
- Removed ``nth-gallery`` and ``isolate-gallery`` in favor of single,
  isolated ``gallery`` mixin.
- Add padding-span syntax: ``prefix``, ``suffix``, and ``pad``.
- Add margin-span syntax: ``pre``, ``post``, ``push``, ``pull``, and ``squish``.
- New ``gutters`` mixin adds gutters to an element.
- ``gutter`` function now returns half-widths when using split/inside gutters.
- Add ``outer`` keyword to ``span`` syntax,
  to return span-width including gutters.

  + Works with both span mixin and span function.
  + Replaces Susy 1.0 ``space`` function.

- Add comrehensive unit tests, using `True`_.
- Improve fall-abck handling of ommitted arguments.
- Add ``container`` function to return a given container's width.
- Add ``auto`` keyword to override ``$container-width``,
  otherwise respect existing width.
- Renamed ``$isolate`` to ``$layout-method``

  + No longer accepts boolean.
  + Accepts keywords ``isolate`` and (default) ``float``.

- Renamed ``$static`` to ``$layout-math``

  + No longer accepts boolean.
  + Accepts keywords ``static`` (use given units)
    and (default) ``fluid`` (use % units).

- Add ``show-columns`` and ``show-baseline`` keywords
  to ``$show-grids`` setting.
  ``show`` will show both columns/baseline, default is ``show-columns``.

.. _True: http://miriamsuzanne.com/true/


2.0.0-alpha.2 — May 7 2013
--------------------------

- Added ``gutter <length>``/``gutters <length>``
  to override the attached gutter width on a single span.
  NOTE: ``gutters 0`` is not the same as ``no-gutters``.
  ``0`` is an output value, ``no-gutters`` removes output.

- Added ``container`` span option
  to remove inside gutters from nesting containers.
- Added ``before``/``after``/``split``/``inside``/``no-gutters`` gutter options.
- Added ``gallery`` mixin for auto-generating gallery layouts.
- Moved grid-backgrounds into language layer, and made them syntax-aware.
- Added ``row``/``unrow``, ``first``/``last``, ``alpha``/``omega``,
  ``nth-first``/``nth-last``, and ``nth-alpha``/``nth-omega``.
- Added ``container`` and ``span`` mixins with new syntax.
- Added syntax-aware math functions (``span``/``gutter``/``outer-span``).
- Added rough ``translate-susy1-settings`` mixin.
- Moved syntax-specific math into language layer.
- Fleshed-out new language syntax.
- Added ``get-grid``, ``set-grid``, and ``use-grid``
  and declaring and managing settings.
- Remove breakpoint core requirement (will come back as option)


2.0.0-alpha.1 — Jan 26 2013
---------------------------

**Susy 2.0 was re-written from the ground up.**

- Functioning math engine
- Initial string parsing for natural syntax
- Float/Isolation output methods
- Removed all ECHOE/RAKE stuff in favor of vanilla .gemspec
- Added Ruby based String Split function
- Added Sass based ``grid-add`` function, to add grids à la Singularity
- Added default variables



1.0.5 — Nov 27 2012
-------------------

- Add support for rem-units.
- Clean-up quoted arguments.
- Fix a few bugs related to the override settings.


1.0.4 — Nov 3 2012
-------------------

- Fix bug in nested mixins that adjust support
  (e.g. ``nth-omeg`` inside ``at-breakpoint``).
- Remove non-ie experimental support in ``at-breakpoint`` ie-fallback output.


1.0.3 — Oct 20 2012
-------------------

- Fix Compass dependencies.


1.0.2 — Oct 20 2012
-------------------

- Fix a bug with ``container-outer-width`` ignoring ``$columns`` argument.
- Turn off legacy-ie support inside CSS3 selectors (``nth-omega`` etc).


1.0.1 — Sept 12 2012
--------------------

- Fix a bug in the relationship
  between ``$container-width`` and ``$border-box-sizing``,
  so that grid-padding is subtracted from the width in certain cases.
- Reset right margin to ``auto`` rather than ``0`` with ``remove-omega``.


1.0 — Aug 14 2012
-----------------

This release is loaded with new features, but don't let that fool you. Susy
just became shockingly simple to use.

The gem name has changed from ``compass-susy-plugin`` to ``susy``.
First uninstall the old gem, then install the new one.
If you have both gems installed, you will get errors.

Semantics:

We re-arranged the code
in order to make the syntax simpler and more consistent:

- ``$total-cols`` is now ``$total-columns``.
- ``$col-width`` is now ``$column-width``.
- ``$side-gutter-width`` is now ``$grid-padding``
  and gets applied directly to the grid container.
- ``un-column`` & ``reset-column`` mixins have merged into ``reset-columns``.
- ``columns`` has been renamed ``span-columns``
  to resolve the conflict with CSS3 columns.
  See other improvements to span-columns below.

We also removed several bothersome requirements:

- The ``alpha`` mixin is no longer needed. Ever.
- The ``omega`` no longer takes a ``$context`` argument.
- ``full`` has been removed entirely.
  Elements will be full-width by default.
  You can add ``clear: both;`` back in as needed.
- ``side-gutter()`` is no longer needed.
  You can use the ``$grid-padding`` setting directly.

Upgrade:

That's all you need in order to upgrade from Susy 0.9.

1. Uninstall and re-install the gem.
2. Find and replace the semantic changes listed above.

You're done! Stop worrying about all that "nested vs. root" bullshit,
and start playing with the new toys!

If you use the ``$from`` directional arguments
directly in the ``span-columns`` mixin,
there may be one more change to make.
See below:

New Features:

- ``span-columns`` supports new features:

  + "omega" can be applied directly through the ``$columns`` argument.
  + Internal padding can be added through the ``$padding`` argument.
  + This pushes the ``$from`` argument from third position into fourth.

- ``at-breakpoint`` allows you to change layouts at media breakpoints.
- ``container`` accepts multiple media-layout combinations as a shortcut.
- ``layout`` allows you to use a different layout at any time.
- ``with-grid-settings`` allows you to change any or all grid settings.
- ``set-container-width`` does what it says, without the other container code.
- ``$breakpoint-media-output``, ``$breakpoint-ie-output``,
  and ``$breakpoint-raw-output``
  settings help manage the different outputs from ``at-breakpoint``
  when you have IE-overrides living in a file of their own.
- ``border-box-sizing`` will  apply the popular ``* { box-sizing: border-box }``
  universal box-model fix, as well as changing the Susy ``$border-box-model``
  setting for you, so Susy knows to adjust some math.
- The ``space()`` function can be used anywhere you need column+gutter math.
- ``push``/``pull``/``pre``/``post``/``squish`` mixins help manage margins.
- use the ``nth-omega`` mixin to set omega on any nth-child, nth-of-type,
  first, last, or only element.
- ``remove-omega`` and ``remove-nth-omega`` will remove
  the omega-specific styles from an element.
- ``$container-width`` will override the width of your container
  with any arbitrary length.
- ``$container-style`` will override the type of grid container
  (magic, fluid, fixed, static, etc) to use.


0.9 — Apr 25 2011
-----------------

Everything here is about simplicity. Susy has scaled back to it's most basic
function: providing flexible grids. That is all.

Deprecated:

- The ``susy/susy`` import is deprecated in favor of simply importing ``susy``.
- The ``show-grid`` import is deprecated in favor of CSS3 gradient-based
  grid-images. You can now use the ``susy-grid-background`` mixin. See below.

Removed:

- Susy no longer imports all of compass.
- Susy no longer establishes your baseline and no longer provides a reset.
  All of that is in the Compass core. You can (and should!) keep using them,
  but you will need to import them from compass.

New:

- Use ``susy-grid-background`` mixin on any ``container`` to display the grid.
  This toggles on and off with the same controls that are used by the compass
  grid-background module.


0.9.beta.3 — Mar 16 2011
------------------------

Deprecated:

- The ``susy/reset`` import has been deprecated
  in favor of the Compass core ``compass/reset`` import.
- The ``susy`` mixin has been deprecated.
  If you plan to continue using vertical-rhythms,
  you should replace it with the ``establish-baseline`` mixin
  from the Compass Core.

Removed:

- The ``vertical-rhythm`` module has moved into compass core.
  The API remains the same, but if you were importing it directly,
  you will have to update that import.
  (``$px2em`` was removed as part of this, but didn't make it into core).
- The ``defaults`` template has been removed as 'out-of-scope'.
  This will not effect upgrading in any way,
  but new projects will not get a template with default styles.

New Features:

- Susy now supports RTL grids and bi-directional sites
  using the ``$from-direction`` variable (default: left)
  and an optional additional from-direction argument on all affected mixins.
  Thanks to @bangpound for the initial implementation.
- Susy is now written in pure Sass! No extra Ruby functions included!
  Thanks to the Sass team for making it possible.


0.8.1 — Sep 24 2010
-------------------

- Fixed typos in tutorial and ``_defaults.scss``


0.8.0 — Aug 13 2010
-------------------

Deprecated:

- The ``skip-link`` was deprecated as it doesn't belong in Susy.
- All the IE-specific mixins have been deprecated,
  along with the ``$hacks`` variable.
  Hacks are now used in the default mixins as per Compass.
- The ``hide`` mixin was deprecated in favor of the Compass ``hide-text`` mixin.

Other Changes:

- ``inline-block-list`` will be moved to the compass core soon.
  In preparation, I've cleaned it up some.
  You can now apply a padding of "0" to override previous padding arguments.
  You can also use ``inline-block-list-container``
  and ``inline-block-list-item`` as you would
  with the Compass ``horizontal-list`` mixins.
- The ``$align`` arguments have been removed
  from both the ``susy`` and ``container`` mixins.
  Text-alignment is no longer used or needed in achieving page centering.
  That was a cary-over from the IE5 Mac days.
- The ``container`` mixin now uses the ``pie-clearfix``
  compass mixin to avoid setting the overflow to hidden.
- Default styles have been cleaned up to account
  for better font stacks and typography, html5 elements,
  vertically-rhythmed forms, expanded print styles,
  use of ``@extend``, and overall simplification.


0.7.0 — Jun 01 2010
-------------------

- updated documentation


0.7.0.rc2 — May 13 2010
-----------------------

- Fixes a bug with grid.png and a typo in the readme. Nothing major here.


0.7.0.rc1 — May 12 2010
-----------------------

- template cleanup & simplification - no more pushing CSSEdit comments, etc.
- expanded base and defaults with better fonts & styles out-of-the-box
- expanded readme documentation.
  This will expand out into a larger docs/tutorial site in the next week.


0.7.0.pre8 — Apr 20 2010
------------------------

- mostly syntax and gem cleanup
- added ``un-column`` mixin to reset elements previously declared as columns.
- added ``rhythm`` mixin as shortcut for leaders/trailers. accepts 4 args:
  leader, padding-leader, padding-trailer, trailer.
- added a warning on ``alpha``
  to remind you that ``alpha`` is not needed at nested levels.


0.7.0.pre7 — Apr 13 2010
------------------------

- *Requires HAML 3 and Compass 0.10.0.rc2*
- Internal syntax switched to scss. This will have little or no effect on users.
  You can still use Susy with either (Sass/Scss) syntax.
- ``$default-rhythm-border-style`` overrides default rhythm border styles
- Better handling of sub-pixel rounding for IE6


0.7.0.pre6 — Mar 29 2010
------------------------

- Added ``+h-borders()`` shortcut for vertical_rhythm ``+horizontal-borders()``
- Fixed vertical rhythm font-size typo (thanks @oscarduignan)
- Added to template styles, so susy is already in place from the start


0.7.0.pre5 — Mar 19 2010
------------------------

- Expanded and adjusted ``_vertical_rhythm.sass``
  in ways that are not entirely backwards compatible.
  Check the file for details.
- ``_defaults.sass`` is re-ordered from inline to block.
- ``:focus`` defaults cleaned up.
- README and docs updated.


0.7.0.pre4 — Jan 20 2010
------------------------

Update: pre2 was missing a file in the manifest. Use pre4.

*Update:* Forgot to note one change:
``+susy`` is no longer assigned to the ``body`` tag,
but instead at the top level of the document
(not nested under anything).

Warning: This update is not backwards compatible.
We've changed some things. You'll have to change some things.
Our changes were fairly major in cleaning up the code -
yours will be minor and also clean up some code.

Added:

- new ``_vertical_rhythm.sass`` (thanks to Chris Eppstein)
  provides better establishing of the baseline grid,
  as well as mixins to help you manage it.
- ``!px2em`` has replaced ``px2em()`` - see below.

Removed:

- ``px2em()`` has been removed and replaced with a simple variable
  ``!px2em`` which returns the size of one pixel
  relative to your basic em-height.
  Multiply against your desired px dimensions
  (i.e. ``border-width = !px2em*5px`` will output the em-equivalent of 5px).
- ``!base_font_size_px`` and ``!base_line_height_px``
  have been replaced with ``!base_font_size`` and ``!base_line_height``
  which take advantage of sass's built-in unit handling.
- ``!grid_units`` is not needed,
  as you can now declare your units directly
  in the other grid ``_width`` variables.
  Use any one type of units in declaring your grid.
  The units you use will be used in setting the container size.

Once you've upgraded, before you compile your files, make these changes:

- remove the "_px" from the font-size and line-height variables,
  and add "px" to their values.
- remove the ``!grid_units`` variable
  and add units to your grid variable values.
- find any uses of ``px2em()`` and replace them with something.
- enjoy!


0.7.0.pre1 — Nov 30 2009
------------------------

Not a lot of new functionality here –
it all moved over to Compass 0.10.0 –
mostly just cleaning it up to match.

- simplified the default styles
  and gave them their own project template (``_defaults.sass``).
- defaults not imported by ``ie.sass``,
  as ``ie.sass`` should be cascading on top of ``screen.sass`` anyway
- changed the syntax to match CSS and Compass
  (``property:`` replaces ``:property``)
- added more inline documentation and brought tutorial up to date
- moved CSS3 module over to Compass
- import the compass HTML5 reset along with the normal reset by default
  (because Susy loves the future)
- little internal management fixes and so on and so on…


Older
-----

Not documented here. Check the commit log...
