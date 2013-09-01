Susy Next Changelog
===================

2.0.0.alpha.4 [unreleased]
--------------------------

* Add `bleed` mixin.
* Fix bug with fluid inside-gutter calculations.
* `$last-flow` setting controls the flow direction (to/from) of row-ending elements.
* `background-grid-output` now accepts `$line-height` argument.
* Compass modules are imported as needed.
* `grid-background`, `grid-overlay`, `grid-background-output`, & `$grid-background-color`
  have been renamed to remiain consistent and avoid conflicts with Compass:
  - `grid-background` => `background-grid`
  - `grid-overlay` => `overlay-grid`
  - `grid-background-output` => `background-grid-output`
  - `$grid-background-color` => `$grid-color`
* `span` mixing accepts nested `@content`, and uses nested context.
* Add `inside-static` option for static gutters in otherwise fluid grids.
* `gutters` mixin uses span syntax, accepts explicit gutter span.
* Explicit gutter-overrides are divided when gutters are `split`/`inside`.

2.0.0.alpha.3 [July 9, 2013]
----------------------------

* `row` now includes clearfix, and `unrow` removes clearfix.
* `gallery` output should override previous gallery settings.
* Removed `nth-gallery` and `isolate-gallery` in favor of single, isolated `gallery` mixin.
* Add padding-span syntax: `prefix`, `suffix`, and `pad`.
* Add margin-span syntax: `pre`, `post`, `push`, `pull`, and `squish`.
* New `gutters` mixin adds gutters to an element.
* `gutter` function now returns half-widths when using split/inside gutters.
* Add `outer` keyword to `span` syntax, to return span-width including gutters.
  - Works with both span mixin and span function.
  - Replaces Susy 1.0 `space` function.
* Add comrehensive unit tests, using [true](http://eric.andmeyer.com/true/).
* Improve fall-abck handling of ommitted arguments.
* Add `container` function to return a given container's width.
* Add `auto` keyword to override `$container-width`, otherwise respect existing width.
* Renamed `$isolate` to `$layout-method`
  - No longer accepts boolean.
  - Accepts keywords `isolate` and (default) `float`.
* Renamed `$static` to `$layout-math`
  - No longer accepts boolean.
  - Accepts keywords `static` (use given units) and (default) `fluid` (use % units).
* Add `show-columns` and `show-baseline` keywords to `$show-grids` setting.
  - `show` will show both columns/baseline, default is `show-columns`.

2.0.0.alpha.2 [May 7, 2013]
---------------------------

* Added `gutter <length>`/`gutters <length>` to override the attached gutter width on a single span.
  - NOTE: `gutters 0` is not the same as `no-gutters`. `0` is an output value, `no-gutters` removes output.
* Added `container` span option to remove inside gutters from nesting containers.
* Added gutter options: `before` | `after` | `split` | `inside` | `no-gutters`.
* Added `gallery` mixin for auto-generating gallery layouts (floated or isolated).
* Moved grid-backgrounds into language layer, and made them syntax-aware.
* Added `row`/`unrow`, `first`/`last`, `alpha`/`omega`, `nth-first`/`nth-last`, and `nth-alpha`/`nth-omega`.
* Added `container` and `span` mixins with new syntax.
* Added syntax-aware math functions (`span`/`gutter`/`outer-span`).
* Added rough `translate-susy1-settings` mixin.
* Moved syntax-specific math into language layer.
* Fleshed-out new language syntax.
* Added `get-grid`, `set-grid`, and `use-grid` and declaring and managing settings.
* Remove breakpoint core requirement (will come back as option)

2.0.0.alpha.1 [Jan 26, 2013]
----------------------------

* Functioning math engine
* Initial string parsing for natural syntax
* Float/Isolation output methods
* Removed all ECHOE/RAKE stuff in favor of vanilla .gemspec
* Added Ruby based String Split function
* Added Sass based `grid-add` function, to add grids à la Singularity
* Added default variables
