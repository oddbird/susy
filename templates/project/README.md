# Susy Next Syntax

*This document currently represents the plans for Susy Next syntax,
and not necessarily the existing functionality.*

## Output Settings

**Document direction:**
- `$layout-direction: 'left to right' !default;`
- 'ltr' | 'left to right' | 'rtl' | 'right to left' | 'both'

**Default output style:**
- `$output-style: 'float' !default;`
- 'float' | 'isolate' | *others TBD?*

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

*(?) Do we really need to manage outer margins at all? Or can they be handled easily by the user?*

Any solution should support:
- Arbitrary non-grid layouts
- Figuring widths based on ratios or vice versa
- Symmetric and asymmetric grids
- Any arbitrary breakpoints (min/max/both)

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
