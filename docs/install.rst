Install
=======

Requirements
------------

The only requirement is `Sass`_.
See the `Sass install`_ page for details.
Note that the third-party apps usually require extra effort
to support Sass plugins,
but several of them come with Susy pre-installed.

.. _Sass: http://sass-lang.com/
.. _Sass install: http://sass-lang.com/install


Simple Install
--------------

.. code:: bash

  # command line
  gem install susy


Bundler or Rails
----------------

I recommend `Bundler`_
whether or not you are using `Rails`_.

.. code:: ruby

  # Gemfile
  gem "susy"

.. code:: bash

  # command line
  bundle install

.. _Bundler: http://bundler.io/
.. _Rails: http://rubyonrails.org/


Compass
-------

If you want to use Susy with `Compass`_,
start by following the `Compass install`_ instructions.

Create a new Compass project:

.. code:: bash

  # command line
  compass create <project name> -r susy -u susy

Update an existing Compass project:

.. code:: ruby

  # config.rb
  require "susy"

.. _Compass: http://compass-style.org/
.. _Compass install: http://compass-style.org/install/


Yeoman
------

Edit your Gruntfile.js at the root level of your project
and look for the Compass related rules.
Add the following inside the options object:

.. code:: js

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

When you are working with bundled gems and dependencies
across a number of different projects,
managing gem versions can become an issue.

If you are working in a Ruby environment, we recommend using RVM.
See our Rails troubleshooting below for some basic instructions,
or dig into RVM's installation instructions.

In a Python environment, we recommend virtualenv
with added "postactivate" and "predeactivate" scripts
to handle Ruby gems.

Once you have that in place,
Bundler can be used in either environment
to manage the actual installation and updating of the gems.
