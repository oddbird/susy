---
title: Demos
stylesheet: "demos/magic.css"
aside: >
  <h3>In this demo:</h3>
  <p>
    Build a mobile-first layout
    with a combination fluid/elastic grid,
    responding smoothly to font and browser sizes,
    without doing any math.
  </p>
pagenav: >
  <h3>Skip to:</h3>
  <ul>
    <li><a href="#demo-settings">Basic Settings</a></li>
    <li><a href="#demo-mobile">Mobile Layout</a></li>
    <li><a href="#demo-breakpoints">Breakpoints</a></li>
    <li><a href="#demo-layout">Large-Screens</a></li>
    <li><a href="#demo-complete">Complete Layout</a></li>
  </ul>
---

## Magic Grids

All Susy sites are fluid on the inside,
but my favorite of the Susy options is 
what I call the Magic Grid.
Fluid on the inside and elastic on the outside,
the magic grid responds to both font and window size
while keeping you in control of typographic line lengths.

This demo will lay out the steps
for building its own mobile-first layout
based on Susy's default Magic Grid.

### Basic Settings

    :::scss
    // Defaults 
    $total-columns  : 12;
    $column-width   : 4em;
    $gutter-width   : 1em;
    $grid-padding   : $gutter-width;

If we're going mobile-first,
we want to start with a smaller grid.
In this case I decided that 7 columns
was a good line-length for the main content.
While that's larger than most mobile devices,
the site will flex to fit them as well.

Think of this setting as a max-width
for your initial linear layout.

    :::scss
    // Mobile First
    $total-columns  : 7;
    $column-width   : 4em;
    $gutter-width   : 1em;
    $grid-padding   : $gutter-width;

### Mobile Layout

The first step with Susy is always to 
define your [container][container]:

    :::scss
    .page { @include container; }

There's not much else to the mobile layout,
since we don't have room to place things side by side.

I've decided that the in-page navigation (`.pagenav`)
isn't useful on mobile. 
So let's get rid of it for now:

    :::scss
    .pagenav { display: none; }

I also want the footer to have a red background
that encompasses the [grid-padding][grid-padding].
In order to do that,
I apply negative margins equal to the grid padding
and add it to the padding instead:

    :::scss
    [role="contentinfo"] {
      margin: 0 0 - $grid-padding;
      padding: rhythm() $grid-padding;
    }

The `rhythm()` function comes from 
the Compass [Vertical Rhythms][rhythms] module,
which I happen to be using as well.
You should look into it.

[container]: #
[grid-padding]: #
[rhythms]: #

### Breakpoints

I'm only adding one layout [breakpoint][breakpoint] to this page,
although you can add as many as you want.

As soon as there is enough room for 12 columns,
we'll jump to a 12-column grid,
and bring our two sidebars into play.

Let's set that breakpoint as a variable,
since we'll need it several times:

    :::scss
    $break: 12;

We could get more complex,
switching to 12 columns at an arbitrary min-width (`$break: 40em 12`),
or adding a fallback class for older versions of IE (`$break: 12 lt-ie9`),
but I don't think we need either one in this case.

Let's update the container
to respond to our new breakpoint:

    :::scss
    .page {
      @include container($total-columns, $break);
    }

We're using the shortcut here,
setting multiple containers in a single command.
The first container uses the default layout (`$total-columns`)
which doesn't trigger any media-queries,
the second uses our breakpoint.
This serves the same function as the longhand:

    :::scss
    .page {
      @include container;
      @include at-breakpoint($break) {
        @include container;
      }
    }

However, the shorthand also performs some optomizations for us,
using `set-container-width` instead of `container` inside the breakpoint.
Since we know the other container settings are already in place,
all we need to override is the containers width.
you can also do that longhand if you like:

    :::scss
    .page {
      @include container;
      @include at-breakpoint($break) {
        @include set-container-width;
      }
    }

The longhand can be useful 
if you have other opperations to perform inside the breakpoint.
In our case, we can move on to laying out our 12-column grid.

[breakpoint]: #

### Large-Screen Layout

Let's start with the banner.
It should span the full width,
but have 2 of 12 columns of padding [prefixed][prefix] on the left.

Since the banner didn't have any layout styles
in our mobile layout,
we can place the entire selector block
inside a breakpoint:

    :::scss
    @include at-breakpoint($break) {
      [role="banner"] { 
        @include prefix(2,12); 
      }
    }

**Note**:
Due to a known Sass bug,
You can only use `at-breakpoint` at the document root like this
when you are not using an IE fallback class
as part of the argument.
This should be fixed soon.
In the meantime,
breakpoints with fallback classes must be nested
inside another selector.

Next, we need the main content off to the side
so that we have room to bring back our page nav.
We can do that in the same breakpoint block
as the banner:

    :::scss
    @include at-breakpoint($break) {
      [role="banner"] {
        @include prefix(2,12);
      }
      [role="main"] {
        @include span-columns(10 omega, 12);
      }
    }

Even though it comes first in the markup,
we want the main content floating to the end of our grid,
[spanning][span-columns] 10 of 12 columns
including the final ([omega][omega]) column.

Now we can bring back the pagenav
as a sidebar on the left,
spanning the remaining 2 of 12 columns.
Let's add that to what we had before:
    
    :::scss
    .pagenav {
      // remove pagenav from mobile
      display: none;
      @include at-breakpoint($break){
        // bring it back as a sidebar on larger screens
        @include span-columns(2,12);
        display: block;
      }
    }

Inside the main content
we have an article which should get ample space, 
and an aside that can act as a second sidebar.
We'll add those in the same block 
as the banner and the main content.
The article spans 7 of the main 10,
while the aside spans the remaining 3 (omega) of 10:

    :::scss
    @include at-breakpoint($break) {
      [role="banner"] {
        @include prefix(2,12);
      }

      [role="main"] {
        @include span-columns(10 omega, 12);
        article { @include span-columns(7,10) }
        aside { @include span-columns(3 omega, 10) }
      }
    }

All we have left is the footer.
We'll replace that grid-padding trick
with a few columns of padding on either side
to match the sidebars.
Placing that inside the footer block we already have:

    :::scss
    [role="contentinfo"] {
      clear: both;
      margin: 0 0 - $grid-padding;
      padding: rhythm() $grid-padding;
      @include at-breakpoint($break) {
        margin: 0;
        @include pad(2,3,12);
      }
    }

And we're done. The rest is [stylish icing][styles].

[prefix]: #
[span-columns]: #
[omega]: #
[styles]: #

### Complete Layout Styles

In the end, we have all our layouts defined
together in one place:

    :::scss
    // Settings ------------------

    $total-columns  : 7;
    $column-width   : 4em;
    $gutter-width   : 1em;
    $grid-padding   : $gutter-width;

    $break          : 12;

    // Container -----------------

    .page {
      @include container($total-columns, $break);
    }

    // Layout --------------------

    @include at-breakpoint($break) {
      [role="banner"] {
        @include prefix(2,12);
      }

      [role="main"] {
        @include span-columns(10 omega, 12);
        article { @include span-columns(7,10) }
        aside { @include span-columns(3 omega, 10) }
      }
    }

    .pagenav {
      display: none;
      @include at-breakpoint($break){
        @include span-columns(2,12);
        display: block;
      }
    }

    [role="contentinfo"] {
      clear: both;
      margin: 0 0 - $grid-padding;
      padding: rhythm() $grid-padding;
      @include at-breakpoint($break) {
        margin: 0;
        @include pad(2,3,12);
      }
    }