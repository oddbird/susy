---
title: Getting Started
side_content: >
  <nav class="glossary">
    <h2>Getting Started</h2>
    <h3>Installation</h3>
    <ul>
      <li><a href="#">New Compass Project</a></li>
      <li><a href="#">Existing Compass Project</a></li>
      <li><a href="#">Rails 3.x</a></li>
    </ul>
    <h3>Usage</h3>
    <ul>
      <li><a href="#">Settings</a></li>
      <li><a href="#">Basic Grids</a></li>
      <li><a href="#">Responsive Grids</a></li>
      <li><a href="#">Advanced</a></li>
    </ul>
  </nav>
---

# Installation

    :::bash
    # command line
    sudo gem install susy

## New [Compass](http://www.compass-style.org) Project

    :::bash
    # command line
    compass create <project name> -r susy -u susy

## Existing [Compass](http://www.compass-style.org) Project

    :::ruby
    # config.rb
    require "susy"
    
## Rails 3.x

    :::ruby
    # Gemfile
    gem "susy"

And run:

    :::bash
    # command line
    bundle install

# Usage

    :::scss
    @import "susy";

## Settings
Set up your default grid values: total columns, column width, and gutter width.

    :::scss
    $total-columns  : 12;             // a 12-column grid
    $column-width   : 4em;            // each column is 4em wide
    $gutter-width   : 1em;            // 1em gutters between columns
    $grid-padding   : $gutter-width;  // grid-padding equal to gutters

## Basic Grid
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

## Responsive Grid
Responsive Susy grids allow you to change the number of columns in a layout 
at different window sizes, using @media-quries with min and max widths.
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

## Advanced
Susy is built to handle your unique markup, and any number of edge cases.
It includes the standard [push()][push] and [pull()][pull] mixins,
along with other useful functions and shortcuts,
supoprt for various grid styles, 
and even bi-directional grids for multi-lingual sites.
Check the [reference documentation][reference] for details.

[reference]: reference
[container]: reference#container
[span-columns]: reference#span-columns
[at-breakpoint]: reference#at-breakpoint
[push]: reference#push
[pull]: reference#pull
