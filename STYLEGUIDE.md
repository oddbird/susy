# Sass Styleguide

This is a styleguide for writing SCSS code in Susy.

## File Organization

This is the rough layout of things. Adjust as needed:


```scss
_susy.scss
susy
|-- _api.scss
|-- api
|   |-- _float.scss
|   |-- _background-grids.scss
|-- _helpers.scss
|-- helpers
|   |-- _sass-lists.scss
|-- _math.scss
|-- _language.scss
```

## Code

- Use soft-tabs with a two space indent.
- Put spaces after `:` in property declarations.
- Put spaces before `{` in rule declarations.
- Use `//` for comment blocks (instead of /* */).
- New line for each argument or logical action.
- Abstract logic into modular functions whenever possible.
- Keep nesting minimal, and line lengths short. (under 80 characters?)

```scss
@function column-count(
  $columns
) {
  @if type-of($columns) == number {
    @return $columns;
  }
  @if type-of($columns) == list {
    @return length($columns);
  }
}
```

## Inline Documentation

We want to document the purpose, input, and output of each section of code,
broadly for modules, and more narrowly for each mixin or function.

Each document should begin with a title, and a table of sub-sections:

```scss
// ------
// Layout
//
// - Settings
// - Basic
// - Margins
// - Padding
```

With any variable settings as the first section:


```scss
// --------
// Settings

$layout: 960px;
$columns: 12;
```

Followed by sections of function and mixin definitions:

```scss
// -------------
// Section Title

// Description of this function or mixin purpose.
//
// name($argument [, $optional])
// - $argument  : <type>
//              - Description of argument.
// - $optional  : <type> | <another-type>
//              - Description.
@function name(
  /* ...arguments... */
) {
  /* ...logic... */
}

// -------
// Example

// Return the number of columns in a grid.
//
// column-count($columns)
// - $columns : <number> | <list>
//            - Any <number> will be returned directly.
//            - Any <list> will return the list length.
@function column-count(
  $columns
) {
  @if type-of($columns) == number {
    @return $columns;
  }
  @if type-of($columns) == list {
    @return length($columns);
  }
}
```
