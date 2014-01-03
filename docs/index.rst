Introduction
============

The best layout is the one that fits your content
and the needs of your users.
The best web layout technique
is the one that achieves your goals.
We're not here to tell you
about the magical powers of the golden-ratio,
or where to use ``em`` vs ``px``,
we just want to help keep your code maintainable.

Let Susy do the math, so you can focus on design.


Contents
--------

.. toctree::
   :maxdepth: 1

   install
   settings
   shorthand
   toolkit
   susyone/index
   diy
   changelog


ToDo
----

These are the features we're working on next:

- Add optional ``px`` fallback for output in ``rem`` units.
- Respect Compass support settings when they are available.
- Port Susy 1 syntax to use new math and Sass features.
- Add syntax to help with the transition from Susy 1.
- Add padding/margin options to the ``span`` mixin, for simpler output.

We're always happy to hear your ideas as well.
Leave us a note on `GitHub Issues`_,
or fork our code, and submit a pull request!

.. _GitHub Issues: https://github.com/ericam/susy/issues

.. note::

  This isn't neverland,
  and Susy isn't magic.
  We're still talking about web design
  in a world where browsers disagree on implementation,
  standards are not always the standard,
  and your Sass code compiles into Boring Old CSS.

  Don't rely on Susy to solve all your problems —
  the table-saw can't build your house for you.
  If you don't understand what Susy is doing,
  take a look at the output CSS files,
  dig around, and find your own path.
  Nothing here is sacred,
  just a set of tools to help make your life easier.
