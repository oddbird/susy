Introduction
============

The world is full of overblown, one-size-fits-all "`frameworks`_"
that want to design your site for you.
We think the best layout is the one you custom-build
around your own content,
with your markup, to fit your design.

That's why we built `Susy`_
(pronounced like Suzy),
a non-invasive and un-opinionated
layout toolkit:
designed to be flexible, semantic,
simple, and responsive.

We're not here to tell you
about the magical powers of the golden-ratio,
or where to use ``em`` vs ``px``,
we just want to help keep your code `DRY`_.
Let Susy do the math, so you can focus on design.

.. _frameworks: http://getbootstrap.com/
.. _Susy: http://susy.oddbird.net/
.. _DRY: http://en.wikipedia.org/wiki/Don't_repeat_yourself


No Magic
--------

This isn't neverland,
we're still talking about web design
in a world where browsers disagree on implementation,
standards are not always the standard,
and your Sass code compiles into Boring Old CSS.
Remember CSS?

Susy can't save you from CSS,
but we can help make it easier to write and maintain.
Abstraction is great at making your code meaningful and DRY,
but don't let it fool you —
the output CSS is what matters.
If you don't know what Susy is doing,
take a look at the CSS output files.

Think of it like a toolkit.
You can't use a hammer to build your entire houes.
Sometimes you have to set it down and pick up a screw driver,
or get crazy with the table saw.


ToDo
----

These are the features we're working on next:

- Add optional ``px`` fallback for output in ``rem`` units.
- Respect Compass support settings when they are available.
- Port Susy 1 syntax to use new math and Sass features.
- Add upgrade syntax to help with the transition.
- Add padding/margin options to the ``span`` mixin, for simpler output.

We're always happy to hear your ideas as well.
Leave us a note on `GitHub Issues`_,
or fork our code, and submit a pull request!

.. _GitHub Issues: https://github.com/ericam/susy/issues


The Docs
--------

.. toctree::
   :maxdepth: 1

   install
   settings
   shorthand
   susyone/index
   syntax
   changelog
