---
title: Getting Started
class: guide
side_content: >
  <p class="version">Version <span>1.0.9</span></p>
  <h2><a href="#start-install">Installation</a></h2>
  <ul>
    <li><a href="#start-compass">Compass</a></li>
    <li><a href="#start-rails">Rails 3.x</a></li>
    <li><a href="#start-yeoman">Yeoman</a></li>
    <li><a href="#start-simple">Manual Start</a></li>
  </ul>
  <h2><a href="#start-usage">Usage</a></h2>
  <ul>
    <li><a href="#start-settings">Settings</a></li>
    <li><a href="#start-basic">Basic Grids</a></li>
    <li><a href="#start-responsive">Responsive Grids</a></li>
    <li><a href="#start-advanced">Advanced</a></li>
  </ul>
  <h2><a href="#troubleshooting">Troubleshooting</a></h2>
  <ul>
    <li><a href="#troubleshooting-versions">Version Management</a></li>
    <li><a href="#troubleshooting-compass-install">Compass Install</a></li>
    <li><a href="#troubleshooting-rails-install">Rails 3.x  Install</a></li>
  </ul>
---

## <a href="#start-install" id="start-install">Installation</a>

### <a href="#start-compass" id="start-compass">Compass</a>

Install from the command line:

    :::bash
    # command line
    gem install susy

Create a new [Compass][compass] project:

    :::bash
    # command line
    compass create <project name> -r susy -u susy

Or update an existing [Compass][compass] project:

    :::ruby
    # config.rb
    require "susy"

[compass]: http://compass-style.org/

### <a href="#start-rails" id="start-rails">Rails 3.x</a>

    :::ruby
    # Gemfile
    gem "susy"

You may also need:

    :::ruby
    # Gemfile
    gem 'compass', '>= 0.12.2'
    gem 'compass-rails', '>= 1.0.3'


And run:

    :::bash
    # command line
    bundle install

### <a href="#start-yeoman" id="start-yeoman">Yeoman</a>
Edit your **Gruntfile.js** at the root level of your project and look for the Compass related rules, add the following inside the options object:

    :::javascript
    // Gruntfile.js
    compass: {
      dist: {
        options: {
          config: '.config.rb'
        }
      }
    }

Now create a **.config.rb** file at the same level as your Gruntfile with this:

    :::ruby
    # .config.rb
    require "susy"

And you are good to go!

### <a href="#start-manual" id="start-manual">Manual Start</a>
You can use this method if you're not using Compass from Terminal and/or Rails. This is going to work with CodeKit.

* Simply <a href="https://github.com/ericam/susy/archive/master.zip">download</a> the zip file from GitHub
* Copy the contents of the "sass" folder *feel free to remove everything else
* Paste the files in your projects "sass" folder (or whatever you call it)
* And import Susy! ( See <a href="#start-usage">Usage</a> )
And you're good to go!



## <a href="#start-usage" id="start-usage">Usage</a>

    :::scss
    @import "susy";



### <a href="#start-settings" id="start-settings">Settings</a>
Set up your default grid values: total columns, column width, and gutter width.

    :::scss
    $total-columns  : 12;             // a 12-column grid
    $column-width   : 4em;            // each column is 4em wide
    $gutter-width   : 1em;            // 1em gutters between columns
    $grid-padding   : $gutter-width;  // grid-padding equal to gutters

### <a href="#start-basic" id="start-basic">Basic Grids</a>
The basic Susy grid is composed using two simple mixins:

- Use the [container()][container] mixin to create your initial grid context.
- Use the [span-columns()][span-columns] mixin to declare
  the width of an element on the grid.

Here's a simple page layout:

    :::scss
    .page {
      // page acts as a container for our grid.
      @include container;

      // header and footer are full-width by default.
      header, footer { clear: both; }

      // nav spans 3 columns of total 12.
      nav { @include span-columns(3,12); }

      .content {
        // content spans the final (omega) 9 columns of 12.
        @include span-columns(9 omega,12);

        // main content spans 6 of those 9 columns.
        .main { @include span-columns(6,9); }

        // secondary content spans the final 3 (omega) of 9 columns.
        .secondary { @include span-columns(3 omega,9); }
      }
    }

### <a href="#start-responsive" id="start-responsive">Responsive Grids</a>
Responsive Susy grids allow you to change the number of columns in a layout
at different window sizes, using @media-queries with min and max widths.
This requires one more mixin:

- Use [at-breakpoint()][at-breakpoint] to set different layouts
  at min- and max-width breakpoints.

Here's a mobile-first example:

    :::scss
    $total-columns: 4;

    .page {
      // Establish our default 4-column grid container.
      @include container;

      // Create a media-query breakpoint at a min-width of 30em
      // And use a larger 8-column grid within that media-query.
      @include at-breakpoint(30em 8) {
        // Establish our new 8-column container.
        @include container;
      }
    }

### <a href="#start-advanced" id="start-advanced">Advanced</a>
Susy is built to handle your unique markup, and any number of edge cases.
It includes the standard [push()][push] and [pull()][pull] mixins,
along with other useful functions and shortcuts,
support for various grid styles,
and even bi-directional grids for multi-lingual sites.
Check the [reference documentation][reference] for details.

[reference]: /guides/reference/
[container]: /guides/reference/#ref-container
[span-columns]: /guides/reference/#ref-span-columns
[at-breakpoint]: /guides/reference/#ref-at-breakpoint
[push]: /guides/reference/#ref-push
[pull]: /guides/reference/#ref-pull

## <a href="#troubleshooting" id="troubleshooting">Troubleshooting</a>

### <a href="#troubleshooting-versions" id="troubleshooting-versions">Version Management</a>

When you are working with bundled gems and dependencies
across a number of different projects,
managing gem versions can become an issue.

If you are working in a **Ruby** environment,
we recommend using [RVM](http://rvm.io/rvm/install/).
See our [Rails troubleshooting](#troubleshooting-rails-install)
below for some basic instructions, or
[dig into RVM's installation instructions](http://rvm.io/rvm/install/).

In a **Python** environment,
we recommend [virtualenv](http://www.virtualenv.org/en/latest/index.html)
in conjunction with these
["postactivate" and "predeactivate" scripts](https://gist.github.com/1078601)
to add support for Ruby gems.

Once you have that in place,
[Bundler](http://gembundler.com/)
can be used in either environment
to manage the actual installation
and updating of the gems.

### <a href="#troubleshooting-compass-install" id="troubleshooting-compass-install">Compass Install</a>

The old gem and the new gem have different names,
but are required simply as ``susy``.
That can cause a conflict if both gems are present.

If you have installed Susy in the past,
make sure you've uninstalled older versions:

    :::bash
    # command line
    gem uninstall compass-susy-plugin
    # "compass-susy-plugin" was the gem name for 0.9.x and lower
    # Susy 1.0 switches to "susy" as the gem name

And then install 1.0:

    :::bash
    # command line
    gem install susy

Then use Compass as normal.

### <a href="#troubleshooting-rails-install" id="troubleshooting-rails-install">Rails 3.x Install</a>

We recommend you use [RVM](http://rvm.io)
for using Susy with Rails projects.
It has become the standard gem management system for Rails,
it's very easy to install and use,
and it helps create and manage Gemsets
among different developers working on different branches.

[Here are some RVM best practices](http://rvm.io/rvm/best-practices/):

If you have installed Susy in the past,
make sure you've uninstalled older versions.
See [Compass Install](#troubleshooting-compass-install) above.

[Install RVM](http://rvm.io/rvm/install/)
(These are basics,
if you do not have Ruby and Rails already installed in your environment,
we [recommend you use RVM's installation instructions](http://rvm.io/rvm/install/)):

    :::bash
    # command line
    # from your system's root:
    curl -L get.rvm.io | bash -s stable

Create a gemset for your site:

    :::bash
    # command line
    rvm gemset create fooBar

Create an ``.rvmrc`` file at your site's root:

    :::bash
    # .rvmrc
    rvm use 1.9.3@fooBar
    # Use whatever Ruby version number your app uses

Now whenever you ``cd`` into your site's root,
RVM will pick up and use that Gemset.

``cd`` to your site and install [Bundler](http://gembundler.com/):

    :::bash
    # command line
    gem install bundler

Add Susy to your ``Gemfile``
([more info on Gemfiles](http://gembundler.com/gemfile.html)):

    :::ruby
    gem "susy", "~> 1.0.9"

And finally run your bundle:

    :::bash
    # command line
    bundle
