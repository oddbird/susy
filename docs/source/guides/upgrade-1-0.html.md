---
title: Upgrade to Susy 1.0
side_content: >
  <p class="version">Version <span>1.0.9</span></p>
  <h2>Upgrading from 0.9</h2>
  <ul>
    <li><a href="#ref-gem">the gem</a></li>
    <li><a href="#ref-semantics">semantics</a></li>
    <li><a href="#ref-upgrade">upgrade</a></li>
  </ul>
  <h2>New Features</h2>
  <ul>
    <li><a href="#ref-span-columns">span-columns</a></li>
    <li><a href="#ref-rwd">responsive grids</a></li>
    <li><a href="#ref-box-sizing">border-box sizing</a></li>
    <li><a href="#ref-grid">grid shortcuts</a></li>
    <li><a href="#ref-omega">omega shortcuts</a></li>
    <li><a href="#ref-container">container settings</a></li>
  </ul>
---

## Upgrade to Susy 1.0

This release is loaded with new features,
but don't let that fool you.
Susy has become shockingly simple to use.

The interface and syntax have been simplified
so that the language is consistent and easy to understand.
We also cleaned-up the output,
taking into account your Compass browser-support settings,
and giving you more control over exactly how your grids are built.
Then we added a load of responsive tools
and optional new settings
to make Susy as absolutely flexible as possible.

I'll cover the basics here, but you should
check out the [reference docs][docs] and [demos][demos]
for more detail.

[docs]: http://susy.oddbird.net/guides/reference/
[demos]: http://susy.oddbird.net/demos/

### <a href="#ref-gem" id="ref-gem">The Gem</a>

To start with,
the gem name has changed from `compass-susy-plugin`
to simply `susy`.

    :::bash

    # uninstall the old gem !important
    gem uninstall compass-susy-plugin

    # install the new gem
    gem install susy

If you don't uninstall the old gem, you will get errors.

This new gem depends on [Compass 0.12.2][compass]
and [Sass 3.2.0][sass].
However, Compass 0.13.0 alpha
has [some advantages][13]
when it comes to Vertical Rhythms
and em-based media-queries.

[compass]: http://compass-style.org/
[sass]: http://sass-lang.com/
[13]: https://github.com/ericam/susy/issues/27

### <a href="#ref-semantics" id="ref-semantics">Semantic Simplifications</a>

We re-arranged the code
in order to make the syntax simpler and more consistent:

* `$total-cols` is now `$total-columns`.
* `$col-width` is now `$column-width`.
* `$side-gutter-width` is now `$grid-padding`
  and gets applied directly to the grid container.
* `un-column` & `reset-column` mixins have merged into `reset-columns`.
* `columns` has been renamed `span-columns` to resolve the conflict with CSS3 columns.
  See other improvements to span-columns below.

We also removed several bothersome requirements:

* The `alpha` mixin is no longer needed. Ever.
* The `omega` no longer takes a `$context` argument.
* `full` has been removed entirely.
  Elements will be full-width by default.
  You can add `clear: both;` back in as needed.
* `side-gutter()` is no longer needed.
  You can use the `$grid-padding` setting directly.

### <a href="#ref-upgrade" id="ref-upgrade">Upgrade</a>

That's all you need in order to upgrade from Susy 0.9.

1. Uninstall and re-install the gem.
2. Find and replace the "semantic simplifications" listed above.

You're done! Stop worrying about all that "nested vs. root" bullshit,
and start playing with the new toys!

If you use the `$from` directional arguments
directly in the `span-columns` mixin,
there may be one more change to make.
See below:

### <a href="#ref-span-columns" id="ref-span-columns">Span Columns</a>

The `span-columns` mixin now handles many additional use-cases:

    :::scss

    // span-columns(<$columns> [<omega> , <$context>, <$padding>, <$from>])
    article { @include span-columns(9); }

This means "omega" can be applied directly through the `$columns` argument,
for much more compact input and output:

    :::scss

    // The OLD way
    @include columns(4);
    @include omega;

    // The NEW way
    @include span-columns(4 omega);

The `omega` mixin still exists as a stand-alone option when needed.

Internal padding can also be added to the element
through the `$padding` argument,
without breaking the set column width:

    :::scss

    // The units for $padding must match your grid setup
    @include span-columns(4, 12, 3em);

    // You can also pass two values for different left and right padding:
    // The first value will be from-direction, the second is the to-direction.
    @include span-columns(4, 12, 3em .5em);

This pushes the `$from` argument from third position into fourth.
If you were using e.g. `span-columns(6,8,right)`,
you will need to adjust slightly to accompodate the new argument.
This should not be a common problem.

### <a href="#ref-rwd" id="ref-rwd">Responsive Web Design</a>

Version 1.0 is loaded with responsive tools.
The main feature is the `at-breakpoint` mixin,
which can be used to set media-layout combinations:
For such-and-such media, use such-and-such layout.

    :::scss

    // at-breakpoint(<$media-layout> [, <$font-size>]) { <@content> }
    // - example: a 12-column grid at the media-query min-width of 30em.
    @include at-breakpoint(30em 12) {
      .page { @include container; }
    }

You can also apply `layout` to use an arbitrary layout,
or `with-grid-settings` to change any grid settings.
You can also add breakpoint media-layouts directly to your `container` as a shortcut,
or use `set-container-width` inside breakpoints
to adjust the container to it's new context
without the repetative output from multiple applications of `container`.

Use the global
`$breakpoint-media-output`, `$breakpoint-ie-output`, and `$breakpoint-raw-output`
settings
to turn on and off the different outputs from `at-breakpoint`.
This is useful when you have IE-overrides living in a file of their own.

[Mason Wendell][Mason Wendell] and [Sam Richard][Sam Richard]
have created their own [breakpoint][breakpoint] plugin
based on the same ideas.
It's the perfect complement,
for quickly handling your non-grid media-query needs
without learning a whole new syntax.

[Mason Wendell]: https://twitter.com/codingdesigner/
[Sam Richard]: http://twitter.com/snugug/
[breakpoint]: http://github.com/canarymason/breakpoint

### <a href="#ref-box-sizing" id="ref-box-sizing">Border-Box Sizing</a>

Apply the `border-box-sizing` mixin at the root of your document
(before any other grid mixins)
to set the border-box model on all elements.

    :::scss

    @include border-box-sizing;

    // other grid code should come after...

This will apply the popular
`* { box-sizing: border-box }`
universal box-model fix,
as well as changing the Susy
`$border-box-model` setting to `true` for you.
Susy will make all the necessary grid adjustments from there.

### <a href="#ref-grid" id="ref-grid">Grid Shortcuts</a>

The `space()` function can be used anywhere you need column+gutter math.
Unlike the `columns()` function,
this math will include the column-adjacent gutter.

    :::scss

    article {
      position: absolute;
      left: space(3);
    }

In addition to the padding mixins
(`prefix`, `suffix`, and `pad`),
you can now manage margins with
`push`, `pull`, `pre`, `post`, and `squish`.

### <a href="#ref-omega" id="ref-omega">Omega Shortcuts</a>

Omega is often applied to the `nth` element in a set.

    :::scss

    .item {
      @include span-columns(3,12);
      &:nth-child(4) {
        @include omega;
      }
    }

Now you can use the `nth-omega` mixin
to set omega on any
nth-child, nth-of-type, first, last, or only element.

    :::scss

    // nth-omega([<$n>, <$selector>, <$from>])
    // $selector options: child (default), last-child, of-type, last-of-type, only.
    .item {
      @include span-columns(3,12);
      @include nth-omega(4);
    }

You can also remove the omega-specific styles from an element,
returning it to the regular grid flow,
with `remove-omega` and `remove-nth-omega`.

### <a href="#ref-container" id="ref-container">Container Settings</a>

* `$container-width` will override the width of your container
  with any arbitrary length.
* `$container-style` will override the type of grid container
  (magic, fluid, fixed, static, etc) to use.
  All the internals remain fluid,
  no matter what container style you choose.
  That's the entire reason Susy exists.

### That's All

We want Susy to be the most flexible,
semantic, and responsive grid system available.
While the other systems
focus on speed by cutting corners
and making decisions for you,
our goal is to do the math and get out of your way.

If you see bugs,
or have ideas for an important new feature,
or simply have questions,
come talk to us.
You can message us on [twitter][twitter],
or file an issue on [github][github].
Even better, submit a patch!

Happy coding!

[twitter]: http://twitter.com/CompassSusy/
[github]: https://github.com/ericam/susy/
