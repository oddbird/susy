Susy Next Changelog
===================

2.0.0.alpha.2 [???, 2013]
-------------------------

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