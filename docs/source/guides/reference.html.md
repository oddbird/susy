---
title: Reference
side_content: >
  <nav class="glossary">
    <h2>Basic Usage</h2>
    <h3>Settings</h3>
    <ul>
      <li><a href="#">$total-columns</a></li>
      <li><a href="#">$column-width</a></li>
      <li><a href="#">$gutter-width</a></li>
      <li><a href="#">$grid-padding</a></li>
    </ul>
    <h3>Mixins</h3>
    <ul>
      <li><a href="#">container()</a></li>
      <li><a href="#">span-columns()</a></li>
      <li><a href="#">omega()</a></li>
    </ul>
    <h2>Responsive Grids</h2>
    <h3>Settings</h3>
    <ul>
      <li><a href="#">$media-layout</a></li>
    </ul>
    <h3>Mixins</h3>
    <ul>
      <li><a href="#">at-breakpoint()</a></li>
      <li><a href="#">layout()</a></li>
    </ul>
    <h2>Grid Helpers</h2>
    <h3>Padding Mixins</h3>
    <ul>
      <li><a href="#">prefix()</a></li>
      <li><a href="#">suffix()</a></li>
      <li><a href="#">pad()</a></li>
    </ul>
    <h3>Margin Mixins</h3>
    <ul>
      <li><a href="#">pre()</a></li>
      <li><a href="#">post()</a></li>
      <li><a href="#">squish()</a></li>
      <li><a href="#">push()</a></li>
      <li><a href="#">pull()</a></li>
    </ul>
    <h3>Other Mixins</h3>
    <ul>
      <li><a href="#">susy-grid-background()</a></li>
    </ul>
    <h3>Functions</h3>
    <ul>
      <li><a href="#">span-columns()</a></li>
      <li><a href="#">gutter()</a></li>
      <li><a href="#">space()</a></li>
    </ul>
    <h3>Container Override Settings</h3>
    <ul>
      <li><a href="#">$container-width</a></li>
      <li><a href="#">$container-style</a></li>
    </ul>
    <h3>Direction Override Settings</h3>
    <ul>
      <li><a href="#">$from-direction</a></li>
      <li><a href="#">$omega-float</a></li>
    </ul>
    <h3>Compass Options</h3>
    <ul>
      <li><a href="#">$base-font-size</a></li>
      <li><a href="#">$legacy-support-for-...</a></li>
    </ul>
  </nav>
---

# Basic Usage

    :::scss
    @import 'susy';

- **Container**: The root element of a _Grid_.
- **Layout**: The total number of _Columns_ in a grid.
- **Grid Padding**: Padding on the sides of the _Grid_.
- **Context**: The number of _Columns_ spanned by the parent element.
- **Omega**: Any _Grid Element_ spanning the last _Column_ in its _Context_.

## Settings

### Total Columns
The number of Columns in your default Grid Layout.

    :::scss
    // $total-columns: <number>; 
    $total-columns: 12; 

- `<number>`: Unitless number.
  
### Column Width
The width of a single Column in your Grid.

    :::scss
    // $column-width: <length>;
    $column-width: 4em;

- `<length>`: Length in any unit of measurement (em, px, %, etc). 

### Gutter Width
The space between Columns.

    :::scss
    // $gutter-width: <length>;
    $gutter-width: 1em;

- `<length>`: Units must match `$column-width`. 

### Grid Padding
Padding on the left and right of a Grid Container.

    :::scss
    // $grid-padding: <length>;
    $grid-padding: $gutter-width;  // 1em

- `<length>`: Units must match `$column-width`. 
  
## Mixins

### Container
Establish the outer grid-containing element.

    :::scss
    // container([$<media-layout>]*)
    .page { @include container; }

- `<$media-layout>`: Optional media-layout shortcuts 
  (see 'Responsive Grids' below).<br />
  **Default:** `$total-columns`.

### Span Columns
Align an element to the Susy Grid.

    :::scss
    // span-columns(<$columns> [<omega> , <$context>, <$from>])
    nav { @include span-columns(3,12); }
    article { @include span-columns(9 omega,12); }

- `<$columns>`: The number of _Columns_ to span.
  - `<omega>`: Optional flag to signal the last element in a row.
- `<$context>`: Current nesting _Context_.<br />
  **Default:** `$total-columns`.
- `<$from>`: The origin direction of your document flow.<br />
  **Default:** `$from-direction`.

### Omega
Apply to any omega element as an override.

    :::scss
    // omega([<$from>])
    .gallery-image { 
      @include span-columns(3,9);              // each gallery-image is 3 of 9 cols.
      &:nth-child(3n) { @include omega; } // every third image completes a row.
    }

- `<$from>`: The origin direction of your document flow.<br />
  **Default:** `$from-direction`.


# Responsive Grids

- **Breakpoint**: A min- or max- viewport width at which to change _Layouts_.
- **Media-Layout**: Shortcut for declaring _Breakpoints_ and _Layouts_ in Susy.

## Media-Layouts

    :::scss
    // $media-layout: <min-width> <layout> <max-width> <ie-fallback>;
    // - You must supply either <min> or <layout>.
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

### At-Breakpoint
At a given min- or max-width Breakpoint, use a given Layout.
    
    :::scss
    // at-breakpoint(<$media-layout> [, <$font-size>]) { <@content> }
    @include at-breakpoint(30em 12) {
      .page { @include container; }
    }

- `<$media-layout>`: The _Breakpoint/Layout_ combo to use (see above).
- `<$font-size>`: When using EMs for your grid, the font size is important.<br />
  **Default:** `$base-font-size`.
- `<@content>`: Nested `@content` block will use the given _Layout_.

### Layout
Set an arbitrary Layout to use with any block of content.

    :::scss
    // layout(<$layout-cols>) { <@content> }
    @include layout(6) {
      .narrow-page { @include container; }
    }

- `<$layout-cols>`: The number of _Columns_ to use in the _Layout_.
- `<@content>`: Nested `@content` block will use the given _Layout_.


# Grid Helpers

## Padding Mixins

### Prefix
Add Columns of empty space as `padding` before an element.

    :::scss
    // prefix(<$columns> [, <$context>, <$from>])
    .box { @include prefix(3); }

- `<$columns>`: The number of _Columns_ to be added as `padding` before.
- `<$context>`: The _Context_.<br />
  **Default:** `$total-columns`.
- `<$from>`: The origin direction of your document flow.<br />
  **Default:** `$from-direction`.

### Suffix
Add columns of empty space as padding after an element.

    :::scss
    // suffix(<$columns> [, <$context>, <$from>])
    .box { @include suffix(2); }

- `<$columns>`: The number of _Columns_ to be added as `padding` after.
- `<$context>`: The _Context_.<br />
  **Default:** `$total-columns`.
- `<$from>`: The origin direction of your document flow.<br />
  **Default:** `$from-direction`.

### Pad
Shortcut for adding both Prefix and Suffix `padding`.

    :::scss
    // pad([<$prefix>, <$suffix>, <$context>, <$from>])
    .box { @include pad(3,2); }

- `<$prefix>`: The number of _Columns_ to be added as `padding` before.
- `<$suffix>`: The number of _Columns_ to be added as `padding` after.
- `<$context>`: The _Context_.<br />
  **Default:** `$total-columns`.
- `<$from>`: The origin direction of your document flow.<br />
  **Default:** `$from-direction`.

## Margin Mixins

### Pre
Add columns of empty space as margin before an element.

    :::scss
    // pre(<$columns> [, <$context>, <$from>])
    .box { @include pre(2); }

- `<$columns>`: The number of _Columns_ to be added as `margin` before.
- `<$context>`: The _Context_.<br />
  **Default:** `$total-columns`.
- `<$from>`: The origin direction of your document flow.<br />
  **Default:** `$from-direction`.

### Post
Add columns of empty space as margin after an element.

    :::scss
    // post(<$columns> [, <$context>, <$from>])
    .box { @include post(3); }

- `<$columns>`: The number of _Columns_ to be added as `margin` after.
- `<$context>`: The _Context_.<br />
  **Default:** `$total-columns`.
- `<$from>`: The origin direction of your document flow.<br /> 
  **Default:** `$from-direction`.

### Squish
Shortcut to add empty space as margin before and after an element.

    :::scss
    // squish([<$pre>, <$post>, <$context>, <$from>])
    .box { @include squish(2,3); }

- `<$pre>`: The number of _Columns_ to be added as `margin` before.
- `<$post>`: The number of _Columns_ to be added as `margin` after.
- `<$context>`: The _Context_.<br /> 
  **Default:** `$total-columns`.
- `<$from>`: The origin direction of your document flow.<br /> 
  **Default:** `$from-direction`.

### Push
Identical to `pre`.

    :::scss
    // push(<$columns> [, <$context>, <$from>])
    .box { @include push(3); }

### Pull
Add negative margins before an element, to pull it against the flow.

    :::scss
    // pull(<$columns> [, <$context>, <$from>])
    .box { @include pull(2); }

- `<$columns>`: The number of _Columns_ to be subtracted as `margin` before.
- `<$context>`: The _Context_.<br />
  **Default:** `$total-columns`.
- `<$from>`: The origin direction of your document flow.<br />
  **Default:** `$from-direction`.

## Other Mixins

### Susy Grid Background
Show the Susy Grid as a background-image on any container.

    :::scss
    // susy-grid-background();
    .page { @include susy-grid-background; }

- **Note:** Some browsers have trouble with sub-pixel rounding on background images.
  Use it for checking general spacing, not pixel-exact alignment.

## Functions

Where a mixin returns property/value pairs, functions return simple values 
that you can put where you want, and use for advanced math.

### Columns
Similar to `span-columns` mixin, but returns the math-ready `%` multiplier.

    :::scss
    // columns(<$columns> [, <$context>])
    .item { width: columns(3,6); }

- `<$columns>`: The number of _Columns_ to span, 
- `<$context>`: The _Context_.<br />
  **Default:** `$total-columns`.

### Gutter
The `%` width of one gutter in any given context.

    :::scss
    // gutter([<$context>])
    .item { margin-right: gutter(6) + columns(3,6); }

- `<$context>`: The _Context_.<br />
  **Default:** `$total-columns`.

### Space
Total `%` space taken by Columns, including internal AND external gutters.

    :::scss
    // space(<$columns> [, <$context>])
    .item { margin-right: space(3,6); }

- `<$columns>`: The number of _Columns_ to span, 
- `<$context>`: The _Context_.<br />
  **Default:** `$total-columns`.

## Container Override Settings

### Container Width
Override the total width of your grid with an arbitrary length.

    :::scss
    // $container-width: <length> | <boolian>;
    $container-width: false;

- `<length>`: Length in em, px, %, etc.
- `<boolian>`: True or false.

### Container Style
Override the type of shell containing your grid.

    :::scss
    // $container-style: <style>;
    $container-style: magic;

- `<style>`: `magic` | `static` | `fluid`.
  - `magic`: Susy's magic grid has a set width,
    but becomes fluid rather than overflowing the viewport at small sizes.
  - `static`: Susy's static grid will retain the width defined in your settings
    at all times.
  - `fluid`: Susy's fluid grid will always be based on the viewport width.
    The percentage will be determined by your grid settings,
    or by `$container-width`, if either is set using `%` units.
    Otherwise it will default to `auto` (100%).

## Direction Override Settings

### From Direction
The side of the Susy Grid from which the flow starts.
For ltr documents, this is the left.

    :::scss
    // $from-direction: <direction>;
    $from-direction: left;

- `<direction>`: `left` | `right`

### Omega Float
The direction that Omega elements should be floated.

    :::scss
    // $omega-float: <direction>;
    $omega-float: opposite-position($from-direction);

- `<direction>`: `left` | `right`

## Compass Options

### Base Font Size
From the [Compass Vertical Rhythm][rhythm] module, 
Susy uses your base font size to help manage
em-based media-queries.

    :::scss
    // $base-font-size: <px-size>;
    $base-font-size: 16px;

- `<px-size>`: Any length in `px`. 
  This will not actually effect your font size 
  unless you use other Vertical Rhythm tools,
  we just need to know.
  See [Compass Docs][base-font-size] for further usage details.

[rhythm]: http://compass-style.org/reference/compass/typography/vertical_rhythm/
[base-font-size]: http://compass-style.org/reference/compass/typography/vertical_rhythm/#const-base-font-size

### Cross-Browser Support
Susy recognizes all the [Compass Cross-Browser Support][support] variables,
although only IE6 and IE7 have special cases attached to them currently.

    :::scss
    // $legacy-support-for-ie  : <boolian>;
    // $legacy-support-for-ie6 : <boolian>;
    // $legacy-support-for-ie7 : <boolian>;
    $legacy-support-for-ie  : true;
    $legacy-support-for-ie6 : $legacy-support-for-ie;
    $legacy-support-for-ie7 : $legacy-support-for-ie;

- `<boolian>`: `true` | `false`

[support]: http://compass-style.org/reference/compass/support/
