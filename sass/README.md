SUSY NEXT
============================

## Guiding Principles

Susy Next is a next-generation css layout system,
allowing a single natural-language input API
to create any structural output you might want.

* The input API must be output-system agnostic.
* The input API must be easy to use.
* The output style must always be defined by the user.
* The system must be future friendly.
* The system must be cross-browser compatible.
* We will not assume anything about the source HTML.

## A Separation of Concerns

In order to accomplish that flexibility,
we need to split the Susy architecture into segments:

1. Input Layer
   * User facing
   * Natural language keywords/sentence structure
   * User facing global variables
2. Translation Layer
   * Translates Input into local variables to be used to calculate output
3. Plugin API
   * Architecture to allow for plugins. Ideally utilizing [Mixin Interpolation](https://github.com/nex3/sass/issues/626) but, until that's available, I suggest a system [similar to this](https://github.com/Snugug/sass-api-test)
4. Output Layer
   * Actual output of CSS
   * Defined by individual output systems
   * Shared components are allowed and encouraged (width calculations are going to be more or less the same, for instance)