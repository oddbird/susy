Susy
====

We're not here to tell you
about the magical powers of the golden-ratio,
or where to use ``em`` vs ``px``,
we just want to help keep your code maintainable.
We're just here do help with the math,
so you can focus on design.


Versions
--------

*Release:* |release|

If you are using Susy ``1.x``,
see :doc:`susyone` for complete documentation
of the old syntax.
Susy ``2.x`` supports
a new syntax, along side the old one.
See the :doc:`upgrade` for details.


Contents
--------

.. toctree::
   :maxdepth: 1

   install
   settings
   shorthand
   toolkit
   susyone
   upgrade
   diy
   changelog


ToDo
----

These are the features we're working on next:

- Add IE support to new syntax.
- Move SusyOne syntax onto new math/output modules.
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
