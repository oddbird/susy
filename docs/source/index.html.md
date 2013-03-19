
<pre class="download">gem install susy</pre>
<div class="intro">
  <p class="highlight">Your markup. Your design. Our math.</p>
  <p>
    The web is a responsive place,
    from your lithe <span class="amp">&</span> lively development process
    to your end-user's super-tablet-multi-magic-lap-phone.
    You need grids that are powerful yet custom,
    reliable yet responsive.
  </p>
</div>
<div class="info">
  <p class="highlight">Recent News:</p>
  <ul class="news">
    <li class="newsitem">
      <a href="https://rubygems.org/gems/susy/versions/1.0.6">
        <strong>v1.0.6:</strong> Added bleed and isolation mixins.
      </a>
    </li>
    <li class="newsitem">
      <a href="http://cognition.happycog.com/article/its-alive-prototyping-in-the-browser">
        <strong>Happy Cog Article:</strong> "It’s Alive: Prototyping in the Browser"
      </a>
    </li>
    <li class="newsitem">
      <a href="http://oddbird.net/2012/11/27/susy-off-canvas/">
        <strong>Tutorial:</strong> "Off-Canvas Layout with Susy"
      </a>
    </li>
    <li class="newsitem">
      <a href="https://rubygems.org/gems/susy/versions/1.0.5">
        <strong>v1.0.5:</strong> Added support for rem units.
      </a>
    </li>
    <li class="newsitem">
      <a href="http://net.tutsplus.com/tutorials/html-css-techniques/responsive-grids-with-susy/">
        <strong>Nettuts+ Tutorial:</strong> "Responsive Grids With Susy"
      </a>
    </li>
  </ul>
</div>
<div class="ag-test">
  <h2>10-column <a href="http://oocss.org/grids_docs.html">complex nested grid AG test</a></h2>
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
</div>

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

<div class="andmore">
  <h2>We're just getting warmed up.</h2>
  <p>
    Quickly add media-query breakpoints for new layouts with
    <a href="guides/reference/#ref-at-breakpoint">at-breakpoint</a>,
    or create your own math
    using Susy's array of
    <a href="guides/reference/#ref-helper">grid helpers</a>.
    Build a one-off site in minutes,
    or create your own scalable grid library
    for large projects.
  </p>
  <p>
    Susy provides the power-tools,
    what you build is up to you.
  </p>
</div>
