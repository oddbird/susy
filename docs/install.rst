Install
=======

The only requirement is `Sass`_,
but Susy was built to be part of the `Compass`_ ecosystem,
and we recommend pairing with tools like
`Breakpoint`_
and `Vertical Rhythms`_.

.. _Sass: http://sass-lang.com/
.. _Compass: http://compass-style.org/
.. _Breakpoint: breakpoint-sass.com/‎
.. _Vertical Rhythms: http://compass-style.org/reference/compass/typography/vertical_rhythm/


Simple Install
--------------

.. code-block:: bash

  # command line
  gem install susy


Bundler or Rails
----------------

.. code-block:: ruby

  # Gemfile
  gem "susy"

.. code-block:: bash

  # command line
  bundle install

.. _Bundler: http://bundler.io/
.. _Rails: http://rubyonrails.org/


Compass
-------

If you want to use Susy with `Compass`_,
start by following the `Compass install`_ instructions.

Create a new Compass project:

.. code-block:: bash

  # command line
  compass create <project name> -r susy -u susy

Update an existing Compass project:

.. code-block:: ruby

  # config.rb
  require "susy"

.. _Compass: http://compass-style.org/
.. _Compass install: http://compass-style.org/install/


Yeoman
------

Edit your Gruntfile.js at the root level of your project
and look for the Compass related rules.
Add the following inside the options object:

.. code-block:: js

  // Gruntfile.js
  compass: {
      options: {
        require: 'susy',
        ...
      }
    }
  }

Assuming you've already installed Susy,
it will now be added to the project
and will not clash with Yeomans grunt rules.


Manual Start
------------

You can use this method if you're not using Compass from Terminal and/or Rails.
This is going to work with CodeKit.

- Download the zip file from GitHub.
- Copy the contents of the "sass" folder (feel free to remove everything else).
- Paste the files in your project "sass" folder (whatever you call it).


Version Management
------------------

When you work with bundled gems
across a number of different projects,
managing gem versions can become an issue.

If you are in a Ruby environment, check out `RVM`_.
In a Python environment, we recommend `virtualenv`_
with these `scripts`_ added to your
"postactivate" and "predeactivate" files.

Once you have that in place,
`Bundler`_ can be used in either environment
to manage the actual installation and updating of the gems.

.. _RVM: https://rvm.io/
.. _virtualenv: http://www.virtualenv.org/en/latest/index.html
.. _scripts: https://gist.github.com/1078601
