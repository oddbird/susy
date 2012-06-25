<div class="intro">
  <p>
    The web is a responsive place,
    from your lithe <span class="amp">&</span> lively development process
    to your end-user's super-tablet-multi-magic-lap-phone.
    You need grids that are powerful yet custom,
    reliable yet responsive.
  </p>
  <p>
    Susy grids are fluid on the inside,
    ready to respond at any moment,
    but contained in the candy shell of your choice,
    so they respond how and when and where you want them to.
  </p>
  <p>
    We don't design your site or dictate your markup,
    we just do the math and get out of your way.
  </p>
</div>
<section class="info">
  <div class="v1-0">
    <h2>
      <a href="https://rubygems.org/gems/susy">Version 1.0<i>.rc.2</i></a>
    </h2>
    <div class="highlight">
      <pre>gem install susy --pre</pre>
    </div>
    <ul>
      <li><a href="https://github.com/ericam/susy/blob/master/CHANGELOG.mkdn">What's changed</a></li>
      <li><a href="https://github.com/ericam/susy/blob/master/CHANGELOG.mkdn#upgrade">Upgrade</a></li>
    </ul>
  </div>
  <div class="v0-9">
    <h2>
      <a href="https://rubygems.org/gems/compass-susy-plugin">Version 0.9</a> (deprecated)
    </h2>
    <div class="highlight">
      <pre>gem install compass-susy-plugin</pre>
    </div>
    <ul>
      <li><a href="https://gist.github.com/1163918">Reference</a></li>
      <li><a href="https://gist.github.com/1163463">Tutorial</a></li>
    </ul>
  </div>
</section>
<section class="why">
  <h2>Why is 1.0 a release candidate?</h2>
  <p>
    Susy 1.0 is stable, tested, <span class="amp">&</span> feature complete;
    but our launch depends on unreleased Sass features.
    We think those features are stable as well,
    and you should <a href="guides/getting-started/">get started</a>
    with Susy 1.0 RC right now.
    We'll make sure the final upgrade is as painless as possible.
  </p>
</section>
<figure class="ag-test">
  <figcaption>
    <p>10-column <a href="http://oocss.org/grids_docs.html">complex nested grid AG test</a></p>
  </figcaption>
  <div class="ag1"><p><strong>ag1</strong> 2 of 10</p></div>
  <div class="ag2">
    <p><strong>ag2</strong> 6 of 10</p>
    <div class="ag4"><p><strong>ag4</strong> 3 of 6</p></div>
    <div class="ag5"><p><strong>ag5</strong> 3 of 6 (omega)</p></div>
    <div class="ag6"><p><strong>ag6</strong> 2 of 6</p></div>
    <div class="ag7">
      <p><strong>ag7</strong> 4 of 6 (omega)</p>
      <div class="ag8"><p><strong>ag8</strong> 2 of 4</p></div>
      <div class="ag9"><p><strong>ag9</strong> 2 of 4 (omega)</p></div>
      <div class="ag10"><p><strong>ag10</strong> auto</p></div>
    </div>
  </div>
  <div class="ag3"><p><strong>ag3</strong> 2 of 10 (omega)</p></div>
</figure>

    :::scss
    // Complex AG grid, brought to you by Susy:
    .ag1 { @include span-columns(2,10); }
    .ag2 { @include span-columns(6,10); }
    .ag3 { @include span-columns(2 omega, 10); }
    .ag4 { @include span-columns(3,6); }
    .ag5 { @include span-columns(3 omega,6); }
    .ag6 { @include span-columns(2,6); }
    .ag7 { @include span-columns(4 omega,6); }
    .ag8 { @include span-columns(2,4); }
    .ag9 { @include span-columns(2 omega,4); }
    .ag10 { clear: both; }

<section class="andmore">
  <h2>We're just getting warmed up.</h2>
  <p>
    Quickly add media-query breakpoints for new layouts with
    <a href="guides/reference/#ref-at-breakpoint">at-breakpoint</a>,
    or create your own custom math
    using Susy's full array of
    <a href="guides/reference/#ref-helper">grid helpers</a>.
    Build a one-off site in minutes,
    or create your own scalable object-oriented grid library
    for large projects.
  </p>
  <p>
    Susy provides the power-tools,
    what you build is up to you.
  </p>
</section>
