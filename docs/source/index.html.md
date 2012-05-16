<div class="intro">
  <p>
    The web is a responsive place, 
    from your lithe & lively development process 
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
      <a href="https://rubygems.org/gems/susy">Version 1.0<i>.rc.0</i></a>
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
<figure class="ag-test">
  <figcaption>
    <b>10-column <a href="http://oocss.org/grids_docs.html">complex nested grid AG test</a></b>
  </figcaption>
  <div class="ag1"><b>2 of 10</b></div>
  <div class="ag2">
    <b>6 of 10</b>
    <div class="ag4"><b>3 of 6</b></div>
    <div class="ag5"><b>3 of 6 (omega)</b></div>
    <div class="ag6"><b>2 of 6</b></div>
    <div class="ag7">
      <b>4 of 6 (omega)</b>
      <div class="ag8"><b>2 of 4</b></div>
      <div class="ag9"><b>2 of 4 (omega)</b></div>
      <div class="ag10"><b>auto</b></div>
    </div>
  </div>
  <div class="ag3"><b>2 of 10 (omega)</b></div>
</figure>

    :::scss
    // The AG Layout, brought to you by Susy:
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
