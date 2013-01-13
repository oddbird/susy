SUSY NEXT
============================

## Basic Guiding Tenants

Susy Next is designed to be a defining next-generation grid system, allowing for a single, unified input API that utilizes natural language input to create any grid you could possibly want. With this in mind, we adhere to the following tenants:

* We shall design the input API to be output system agnostic 
* We shall design an input API that is easy to use
* We shall not assume an output style, it shall always be user defined
* We shall design the system to be future friendly
* We shall design the system to be cross-browser compatible
* We shall not assume source HTML
  * One exception: `[dir=LNG]` for direction, as it is the only standard way to set language direction in HTML

## A Separation of Concerns

In order to accomplish our stated tenants, we shall need to separate the Susy architecture into different segments. The segments are as follows:

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