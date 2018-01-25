# The Susy3 Philosophy

**We no longer recommend using Susy as a primary layout solution.**

With the advent of [flexbox] and the [CSS Grid module],
there are fewer and fewer reasons
to use a grid library like Susy,
and that’s wonderful!
Grid libraries were always a temporary fix,
waiting for the browser to take over.
Still, not everyone can play with the latest specs,
and there will always be edge-cases
that require manual grid-math.

[flexbox]: https://css-tricks.com/snippets/css/a-guide-to-flexbox/
[CSS Grid module]: https://css-tricks.com/snippets/css/complete-guide-grid/

Susy3 is trimmed down to the most basic features:
a lightweight library of functions
that can be used along with float, flexbox,
or any other CSS.
Susy can be used for on-the-fly grid-math,
or used to generate a class-based system --
so that your grids are built to spec
for the requirements of your team and application.


## Not For Everyone

Much of the power and flexibility in Susy
is now available directly in the browser
with additional benefits and lower overhead.

### CSS Grids

The CSS Grid module is relatively new,
but has gained [browser-support][caniuse-grid] quickly --
and there is no third-party tool available
with the same power and simplicity it provides.
Rachel Andrew and Jen Simmons have compiled
a comprehensive set of articles, examples,
and even copy-paste templates (with fallbacks built in)
on their gridbyexample.com site.

[caniuse-grid]: https://caniuse.com/#feat=css-grid

### Flexbox

Flexbox also provides intrinsic sizing and relationships,
with near-complete [support in modern browsers][caniuse-flex]
which can help make strict/explicit grids obsolete.

[caniuse-flex]: https://caniuse.com/#feat=flexbox

### Fractions

If you need a grid system
that works with legacy browsers,
I recommend an approach similar to [OOCSS].
While their code is out of date,
the approach is worth adopting to modern practices:

[OOCSS]: https://github.com/stubbornella/oocss/wiki/Grids

- Remove gutters (or use padding for gutters)
  to dramatically simplify the grid math.
- Use simple fractions to create a robust nested grid.
- Optionally create class-names as needed.

Those techniques can be used with floats, flexbox,
display-tables, and more.
In Sass it might looks something like this:

```scss
.span1of2 {
  width: percentage(1/2);
}

.span3of12 {
  width: percentage(3/12);
}
```

This is the same technique used by
previous versions of Susy
when you set `gutter-position` to `inside` or `inside-static`.
In order to create a class-based system in Sass,
you can run a loop like this one:

```scss
$columns: 12;

[class^='span'] {
  float: left;
}

@for $i from 1 through $columns {
  .span#{$i}of#{$columns} {
    width: percentage($i / $columns);
  }
}
```

*Without ever loading a third-party tool*,
you can design your own grid system
in a few lines of code.


## Susy as a Fallback

Susy3 works similarly
to the `percentage()` technique,
but provides support for margin-gutters
and (simple) mixed-unit grids:

```scss
.span1of2 {
  width: span(1 of 2);
  margin-right: gutter(of 2);
}

.span3of12 {
  width: span(3 of 12);
  margin: 0 (gutter() / 2);
}
```

When the math gets complicated,
Susy can be there to step in --
but **there is no need for Susy if you can keep the math simple**.


### No Mixins

The biggest change in Susy3 is that we've removed all the mixins.
On initial upgrade, most projects will run into errors
with missing mixins --
`container`, `span`, or otherwise.
While mixins can provide a nice shortcut for common use-cases,
they also make the actual CSS more opaque,
and quickly become out-of-date --
discouraging incremental improvements to your application.

In a world with growing browser support for
any number of powerful CSS layout techniques,
it would be neglegent of us to push everyone
into a single one-size-fits-all solution.
There are other frameworks that provide that service,
but Susy was never intended to be one of them.


## Resources

- [Welcome to Susy3](http://oddbird.net/2017/06/28/susy3)
- [Understanding `Spread` in Susy](http://oddbird.net/2017/06/13/susy-spread)
- [Media Queries in Susy](http://oddbird.net/2017/09/25/susy-use)

See our full list of [Susy News & Tutorials]
for more details.

[Susy News & Tutorials]: http://oddbird.net/susy/articles/
