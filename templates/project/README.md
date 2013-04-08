# Susy Next Syntax

*This document currently represents the plans for Susy Next syntax,
and not necessarily the existing functionality.*

## Defining Layouts

*We should avoid the "grid" terminology
unless we are talking about explicitly grid-related features.*

What we need to define:
- width of layout
- Layout margins (?)
- breakpoints

For grids, we need:
- number of columns
- width/ratio of columns
- width/ratio of gutters

Layout styles to support:
- ltr, rtl, mixed-direction
- content-box or border-box sizing
- gutters inside (padding) or outside (margin)
- gutters before, after, or split


*(?) Do we really need to manage grid margins at all? Or can they be handled easily by the user?*

Any solution should support:
- Arbitrary non-grid layouts
- Figuring widths based on ratios or vice versa
- Symmetric and asymmetric grids
- Any arbitrary breakpoints (min/max/both)

## Functions

- Need to access the width of a certain number of columns
  - Symmetric or asymmetric
  - With or without edge gutters (inner or outer width)
  - In context

```scss
// symmetric
width: span(4);
width: span(4 of 3);
width: span(4 of 3 outer);

// asymmetric
width: span(4 at 2);
width: span(4 at 2 of 3 4 5 4 3);
width: span(4 at 2 of 3 4 5 4 3 outer);
```

- Need to access the width of a single gutter
  - In context

```scss
// symmetric
width: gutter();
width: gutter(3);
```

## Container

Establish a container element: `container($width)`

- `$width`: <length> | <grid>
  - An arbitrary length to be used as the container width, or
  - Enough grid settings to calculate a container width.

## Span *(supported)*

Establish a spanning element: `span($span [, $modifiers])`

- `$span`: <length> | "full" | <columns> [<keywords>]
  - "of" for context
  - "at" for asymmetric location selection *(supported)*
  - "first/alpha" | "last/omega" for edge handling *(first/last supported)*
  - "push/pull" for relative float location
  - "isolate" for isolation location
  - "prefix/suffix" for padding ??
  - "pre/post" for margins ??
- `$modifiers`: *TBD*
