# Susy Next Syntax

*This document currently represents the plans for Susy Next syntax,
and not necessarily the existing functionality.*

## Container

Establish a container element: `container($width)`

- `$width`: <length> | <grid>
  - An arbitrary length to be used as the container width, or
  - Enough grid settings to calculate a container width.

## Span *(supported)*

Establish a spanning element: `span($span [, $modifiers])`

- `$span`: <length> | "full" | <columns> [<keywords>]
  - "of" for context *(supported)*
  - "at" for asymmetric location selection *(supported)*
  - "first/alpha" | "last/omega" for edge handling *(first/last supported)*
  - "push/pull" for relative float location
  - "isolate" for isolation location
  - "prefix/suffix" for padding ??
  - "pre/post" for margins ??
- `$modifiers`: *TBD*
