# Susy Documenation

Susy's documentation source is written with [Middleman](https://github.com/middleman/middleman) (3.x). For the actual documentation on using Susy, visit [Susy's web site](http://susy.oddbird.net/). For help learning Middleman and to contribute to the docs, [visit the Middleman web site](https://github.com/middleman/middleman).

## Editing Susy's Docs

Susy's docs are all marked up with (GitHub Flavored) [Markdown](http://daringfireball.net/projects/markdown/syntax), and templated with [HAML](http://haml-lang.com/).

### Adding Content

Add all content to the `/docs/source/guides/` directory. All files will take an .html.md extension, and are written with in [Markdown](http://daringfireball.net/projects/markdown/syntax):

    /docs/source/guides/foobar.html.md
    
All page titles and sidebar content are handled with [YAML](http://yaml.org/) at the top of a specific page. If `title` and/or `side_content` are not defined, defaults will be provided.

**Example:** (e.g. `/docs/source/guides/example.html.md`)

    ---
    title: I'm an awesome title
    side_content: >
      <p>Regular ol' HTML goes here</p>
      <ul>
        <li><a href="#">Include Subnav</a></li>
      </ul>
    ---

    # Title
    
    And some content

Note that the `>` in `side_content: >` is required to render HTML.
    
### Doc-wide Navigation

To add a page to the doc-wide navigation, add it to `/docs/source/partials/_navigation.haml`.

### Default URL for /guides/

Edit `/docs/source/config.rb` to change the default landing page for `/docs/source/guides/`.

### Indentation

As all of Susy's docs use pre-processors that are whitespace-sensitive, please use 2 Soft Tabs for indentation.

### Code Highlighting

Susy's docs uses [Rack::Codehighlighter](https://github.com/wbzyl/rack-codehighlighter) (and [pygments.rb](https://github.com/tmm1/pygments.rb)) to automatically highlight Markdown code blocks. You just have to indicate the type in a code block:

    :::scss
    $total-columns  : 12;
    $column-width   : 4em;
    $gutter-width   : 1em;
    $grid-padding   : $gutter-width;