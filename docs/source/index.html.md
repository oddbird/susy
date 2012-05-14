The web is a responsive place, 
from your lithe & lively development process 
to your end-user's super-tablet-multi-magic-lap-phone. 
You need grids that are powerful yet custom, 
reliable yet responsive.

Susy grids are fluid on the inside, 
ready to respond at any moment, 
but contained in the candy shell of your choice, 
so they respond how and when and where you want them to.

We don't design your site or dictate your markup,
we just do the math and get out of your way.

## [Version 1.0.rc.0](https://rubygems.org/gems/susy)
Requires [Compass 0.12.2][compass gem] (release candidate)
and [Sass 3.2][sass gem] (alpha)

    :::bash
    gem install susy --pre

- [What's changed](https://github.com/ericam/susy/blob/master/CHANGELOG.mkdn)
- [Upgrade from 0.9](https://github.com/ericam/susy/blob/master/CHANGELOG.mkdn#v10alpha0-may-7-2012)

## [Version 0.9 (deprecated)](https://rubygems.org/gems/compass-susy-plugin)

Requires [Compass 0.11.1][compass gem]
    
    :::bash
    gem install compass-susy-plugin
- [Reference](https://github.com/ericam/susy/blob/d5b2c7e3f2505a1063977d474379380c695da8f8/docs/tutorial.rst#building-a-grid-with-susy)
- [Tutorial](https://github.com/ericam/susy/blob/d5b2c7e3f2505a1063977d474379380c695da8f8/docs/tutorial.rst)

[compass gem]: https://rubygems.org/gems/compass
[sass gem]: https://rubygems.org/gems/sass

## Complex grids made simple

With [two simple mixins](http://localhost:8000/guides/reference/#ref-basic-mixins), 
Susy can build complex grids nested as deep as you need.

<!-- 
  START DEMO.
  This is ugly markup, but you can do better.
-->
<figure class="ag-test">
  <figcaption>
    <b>10-column <a href="http://oocss.org/grids_docs.html">complex nested grid AG test</a></b>
  </figcaption>
  <div class="ag1"><b>2 of 10</b></div>
  <div class="ag2">
    <b>6 of 10</b>
    <div class="ag3"><b>3 of 6</b></div>
    <div class="ag4"><b>3 of 6 (omega)</b></div>
    <div class="ag5"><b>2 of 6</b></div>
    <div class="ag6">
      <b>4 of 6 (omega)</b>
      <div class="ag7"><b>2 of 4</b></div>
      <div class="ag8"><b>2 of 4 (omega)</b></div>
      <div class="ag9"><b>auto</b></div>
    </div>
  </div>
  <div class="ag10"><b>2 of 10 (omega)</b></div>
</figure>

<!-- END DEMO -->

## Everywhere you want to be

Susy is based on Natalie Downe's [CSS Systems][sys], 
made possible by [Sass][sass], and made easy with [Compass][compass]. 
You can use it anywhere,
from static sites to Python/Django, Ruby/Rails, and PHP/Wordpress. 
With [SMACSS][smacss] or [OOCS][oocss], [Bootstrap][bs], 
[HTML5 Boilerplate][html5bp], or [320 and up][320]. 
It even comes packaged as part of [Middleman][mm], to make your life easy.

[sys]: http://www.slideshare.net/nataliedowne/css-systems-presentation
[sass]: http://www.sass-lang.com/
[compass]: http://www.compass-style.org/
[smacss]: http://www.smacss.com/
[oocss]: http://www.oocss.org/
[bs]: http://twitter.github.com/bootstrap/
[html5bp]: http://www.html5boilerplate.com/
[320]: http://stuffandnonsense.co.uk/projects/320andup/
[mm]: http://www.middlemanapp.com/