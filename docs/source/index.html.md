# Susy: A Plugin for Compass

Susy is a semantic CSS grid system for designers.

Use Susy anywhere. Static sites, Rails sites, Django sites, PHP sites, etc. You name it. Susy just helps you with the grid - without ever touching your markup. You'll never have to write `<div class="span-24 last">` ever again.
  
Susy defaults to a magic grid: The magic grid begins as a simple fixed or elastic grid, but becomes fluid when the window is too small to contain it (you can also easily make it a fixed grid), **without any additional markup**. It's based on Natalie Downe's "[CSS Systems](http://www.slideshare.net/nataliedowne/css-systems-presentation)" - this otherwise math-heavy technique becomes simple with Susy.

## Installation

Susy is a plugin for [Compass](http://www.compass-style.org). After installing Compass, run from the command line:

    :::bash
    gem install susy
    
Or add it to your Gemfile:

**Gemfile**

    :::ruby
    gem "susy"
    
**And then [bundle](http://gembundler.com/) from the command line:**

    :::bash
    bundle install
    
## Basic Usage

Susy comes preloaded with the following defaults, which you can overwrite in your SASS/SCSS anytime:

    :::scss
    $total-columns  : 12;             /* a 12-column grid */
    $column-width   : 4em;            /* each column is 4em wide */
    $gutter-width   : 1em;            /* 1em gutters between columns */
    $grid-padding   : $gutter-width;  /* 1em padding on the grid */
    
So for a basic two column layout, with a full width header and footer:

    :::scss
    #page {
      @include container;
    
      header { clear:both; }
    
      #content { @include columns(9); }
    
      aside { @include columns(9 omega); }
    
      footer { clear:both; }
    }
    
That's it. Nothing to add to your markup. Now go and resize your browser window for smaller devices and smile.