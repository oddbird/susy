---
title: Reference
side_content: >
  <section class="glossary">
    <h2>Susy Basics</h2>
    <h3>Settings</h3>
    <ul>
      <li><a href="#">$total-columns</li>
      <li><a href="#">$column-width</li>
      <li><a href="#">$gutter-width</li>
      <li><a href="#">$grid-padding</li>
    </ul>
    <h3>Mixins</h3>
    <ul>
      <li><a href="#">container()</li>
      <li><a href="#">span-columns()</li>
      <li><a href="#">omega()</li>
    </ul>
    <h2>Responsive Grids</h2>
    <h3>Settings</h3>
    <ul>
      <li><a href="#">$media-layout</li>
    </ul>
    <h3>Mixins</h3>
    <ul>
      <li><a href="#">at-breakpoint()</li>
      <li><a href="#">layout()</li>
    </ul>
    <h2>Grid Helpers</h2>
    <h3>Padding Mixins</h3>
    <ul>
      <li><a href="#">prefix()</li>
      <li><a href="#">suffix()</li>
      <li><a href="#">pad()</li>
    </ul>
    <h3>Margin Mixins</h3>
    <ul>
      <li><a href="#">pre()</li>
      <li><a href="#">post()</li>
      <li><a href="#">squish()</li>
      <li><a href="#">push()</li>
      <li><a href="#">pull()</li>
    </ul>
    <h3>Grid Background Image</h3>
    <ul>
      <li><a href="#">susy-grid-background()</li>
    </ul>
    <h3>Functions</h3>
    <ul>
      <li><a href="#">span-columns()</li>
      <li><a href="#">gutter()</li>
      <li><a href="#">space()</li>
    </ul>
    <h3>Container Override Settings</h3>
    <ul>
      <li><a href="#">$container-width</li>
      <li><a href="#">$container-style</li>
    </ul>
    <h3>Direction Override Settings</h3>
    <ul>
      <li><a href="#">$from-direction</li>
      <li><a href="#">$omega-float</li>
    </ul>
  </section>
---

# Basic Usage

    :::scss
    @import 'susy';
    
## Terms

- **Susy Grid**: A grid that you build with Susy. 
- **Column**: The main unit of horizontal measurement on the _Grid_.
- **Layout**: The total number of _Columns_ in a grid.
- **Gutter**: The space between _Columns_.
- **Grid Padding**: Padding between the _Grid_ and the document edges.
- **Grid Element**: Any HTML element that is aligned to a _Grid_.
- **Container**: The root element of a _Grid_.
- **Context**: The number of _Columns_ spanned by the parent element.
- **Omega**: Any _Grid Element_ spanning the last _Column_ in its _Context_.

## Settings

### Total Columns

    :::scss
    $total-columns: <number>; //default: 12
    
    //Example
    $total-columns: 12;
  
The number of Columns in your Susy Grid Layout.

**Options:**

- `<number>`: Unitless number. 
  - Default: `12`.
  
### Column Width

    :::scss
    $column-width: <length>; //default: 4em

    //Example
    $column-width: 5em;

The width of a single Column in your Susy Grid.

**Options:**

- `<length>`: Length in em, px, %, etc. 
  - Default: `4em`.

### Gutter Width

    :::scss
    $gutter-width: <length>; //default: 1em
    
    //Example
    $gutter-width: 1em;

The width of space between Columns.

**Options:**

  - `<length>`: Units must match `$column-width`. 
    - Default: `1em`.

### Grid Padding

    :::scss
    $grid-padding: $gutter-width; //default: $gutter-width

    //Examples
    $grid-padding: $gutter-width;
    $grid-padding: .5em;

Padding on the left and right of a grid container.

**Options:**

- `<length>`: Units must match `$column-width`. 
  - Default: `$gutter-width`.
  
## Mixins

    :::scss
    .page { @include container; }

**Container**: `container([$<media-layout>]*)`
- _Apply to the outer grid-containing element._
- `<$media-layout>`: Optional media-layout shortcuts 
  (see 'Responsive Grids' below). 
  - Default: `$total-columns`.

    :::scss
    nav { @include columns(3,12); }
    article { @include columns(9 omega,12); }

**Columns**: `columns(<$columns> [<omega> , <$context>, <$from>])`
- _Apply to any element to align it with the Susy Grid._
- `<$columns>`: The number of _Columns_ to span, with optional `<omega>` flag.
- `<$context>`: Current nesting _Context_. 
  - Default: `$total-columns`.
- `<$from>`: The origin direction of your document flow. 
  - Default: `$from-direction`.

    :::scss
    .gallery-image { 
      @include columns(3,9);              // each gallery-image is 3 of 9 cols.
      &:nth-child(3n) { @include omega; } // every third image completes a row.
    }

**Omega**: `omega([<$from>])`
- _Apply to any omega element as an override._
- `<$from>`: The origin direction of your document flow. 
  - Default: `$from-direction`.




# Responsive Grids

## Terms

- **Breakpoint**: A min- or max- viewport width at which to change _Layouts_.
- **Media-Layout**: Shortcut for declaring _Breakpoints_ and _Layouts_ in Susy:
  - `<min-width> <layout> <max-width> <ie-fallback>`
  - You must supply either `<min>` or `<layout>`.

Example Media-Layouts:

    :::scss
    $media-layout: 12;          // Use 12-col layout at matching min-width.
    $media-layout: 30em;        // At min 30em, use closest fitting layout.
    $media-layout: 30em 12;     // At min 30em, use 12-col layout.
    $media-layout: 12 60em;     // Use 12 cols up to max 60em.
    $media-layout: 30em 60em;   // Between min 30em & max 60em, use closest layout.
    $media-layout: 30em 12 60em;// Use 12 cols between min 30em & max 60em.
    $media-layout: 60em 12 30em;// Same. Larger length will always be max-width.
    $media-layout : 12 lt-ie9;  // Output is included under `.lt-ie9` class,
                                // for use with IE conditional comments 
                                // on the <html> tag.

## Mixins

    :::scss
    $total-columns: 4;

    .container {
      @include container;           // Establish a default 4-col container.
      @include at-breakpoint(10) {  // At min-width == 10-cols, use 10-col layout.
        @include container;         // Establish a 10-col container inside @media.
      }
    }

**At-Breakpoint**: 
  `at-breakpoint(<$media-layout> [, <$font-size>]) { <@content> }`
- _At a given min- or max-width Breakpoint, use a given Layout._
- `<$media-layout>`: The _Breakpoint/Layout_ combo to use (see above).
- `<$font-size>`: When using EMs for your grid, the font size is important.
  - Default: `$base-font-size`.
- `<@content>`: Nested @content block will use the given _Layout_.

    :::scss
    $total-columns: 4;

    .container-9 { 
      @include layout(9) {    // Change total-columns to 9 for all nested code.
        @include container;   // Establish a 9-col container.
      }
    }

**Layout**: `layout(<$layout-cols>) { <@content> }`
- _Set an arbitrary Layout to use with any block of content._
- `<$layout-cols>`: The number of _Columns_ to use in the _Layout_.
- `<@content>`: Nested @content block will use the given _Layout_.




# Grid Helpers

## Padding Mixins

**Prefix**: `prefix(<$columns> [, <$context>, <$from>])`
- _Add Columns of empty space as `padding` before an element._
- `<$columns>`: The number of _Columns_ to be added as `padding` before.
- `<$context>`: The _Context_. 
  - Default: `$total-columns`.
- `<$from>`: The origin direction of your document flow. 
  Default `$from-direction`.

**Suffix**: `suffix(<$columns> [, <$context>, <$from>])`
- _Add columns of empty space as padding after an element._
- `<$columns>`: The number of _Columns_ to be added as `padding` after.
- `<$context>`: The _Context_. 
  - Default: `$total-columns`.
- `<$from>`: The origin direction of your document flow. 
  - Default: `$from-direction`.

**Pad**: `pad([<$prefix>, <$suffix>, <$context>, <$from>])`
- _Shortcut for adding both Prefix and Suffix `padding`._
- `<$prefix>`: The number of _Columns_ to be added as `padding` before.
- `<$suffix>`: The number of _Columns_ to be added as `padding` after.
- `<$context>`: The _Context_. 
  - Default: `$total-columns`.
- `<$from>`: The origin direction of your document flow. 
  - Default: `$from-direction`.

## Margin Mixins

**Pre**: `pre(<$columns> [, <$context>, <$from>])`
- _Add columns of empty space as margin before an element._
- `<$columns>`: The number of _Columns_ to be added as `margin` before.
- `<$context>`: The _Context_. 
  - Default: `$total-columns`.
- `<$from>`: The origin direction of your document flow. 
  - Default: `$from-direction`.

**Post**: `post(<$columns> [, <$context>, <$from>])`
- _Add columns of empty space as margin after an element._
- `<$columns>`: The number of _Columns_ to be added as `margin` after.
- `<$context>`: The _Context_. 
  - Default: `$total-columns`.
- `<$from>`: The origin direction of your document flow. 
  - Default: `$from-direction`.

**Squish**: `squish([<$pre>, <$post>, <$context>, <$from>])`
- _Shortcut to add empty space as margin before and after an element._
- `<$pre>`: The number of _Columns_ to be added as `margin` before.
- `<$post>`: The number of _Columns_ to be added as `margin` after.
- `<$context>`: The _Context_. 
  - Default: `$total-columns`.
- `<$from>`: The origin direction of your document flow. 
  - Default: `$from-direction`.

**Push**: `push(<$columns> [, <$context>, <$from>])`
- _Add positive margins before an element, to push it with the flow._
  _Identical to `pre`._

**Pull**: `pull(<$columns> [, <$context>, <$from>])`
- _Add negative margins before an element, to pull it against the flow._
- `<$columns>`: The number of _Columns_ to be subtracted as `margin` before.
- `<$context>`: The _Context_. 
  - Default: `$total-columns`.
- `<$from>`: The origin direction of your document flow. 
  - Default: `$from-direction`.

## Grid Background Image

**Susy Grid Background**: `susy-grid-background()`
- _Apply to a Container to see the Susy Grid as a background-image._
- Some browsers have trouble with sub-pixel rounding on background images.
  Use it for checking general spacing, not pixel-exact alignment.

## Functions

Where a mixin returns property/value pairs, functions return simple values 
that you can put where you want, and use for advanced math.

    :::scss
    .item { width: columns(3,6); }

**Columns**: `columns(<$columns> [, <$context>])`
- _Identical to `columns` mixin, but returns the math-ready `%` multiplier._
- `<$columns>`: The number of _Columns_ to span, 
- `<$context>`: The _Context_.
  - Default: `$total-columns`.

    :::scss
    .item { margin-right: gutter(6) + columns(3,6); }

**Gutter**: `gutter([<$context>])`
- _The `%` width of one gutter in any given context._
- `<$context>`: The _Context_. 
  - Default: `$total-columns`.

    :::scss
    .item { margin-right: space(3,6); }

**Space**: `space(<$columns> [, <$context>])`
- _Total `%` space taken by Columns, including internal AND external gutters._
- `<$columns>`: The number of _Columns_ to span, 
- `<$context>`: The _Context_.
  - Default: `$total-columns`.

## Container Override Settings

    :::scss
    $container-width  : false     !default;

**Container Width**: `$container-width: <length>;`
- _Override the total width of your grid with an arbitrary length._ 
- `<length>`: Length in em, px, %, etc.
  - Default: `false`.

    :::scss
    $container-style  : magic     !default;

**Container Style**: `$container-style: <style>;`
- _The type of shell containing your grid._
- `<style>`: `magic` | `static` | `fluid`.
  - Default: `magic`.
  - `magic`: The Susy Special Sauce (TM). A magic grid has a set width,
    but becomes fluid rather than overflowing the viewport.
  - `static`: A static grid will retain the width defined in your settings.
  - `fluid`: A fluid grid will always be based on the viewport width.
    The percentage will be determined by your grid settings,
    or by `$container-width`, if either is set using `%` units.
    Otherwise it will default to `auto` (100%).

## Direction Override Settings

    :::scss
    $from-direction : left        !default;

**From Direction**: `$from-direction: <direction>;`
- _The side of the Susy Grid from which the flow starts._
  _For ltr documents, this is the left._
- `<direction>`: `left` | `right`
  - Default: `left`

    :::scss
    $omega-float    : opposite-position($from-direction)  !default;

**Omega Float**: `$omega-float: <direction>;`
- _The direction that Omega elements should be floated._
- `<direction>`: `left` | `right`
  - Default: `opposite-position($from-direction)`
