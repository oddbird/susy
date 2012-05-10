---
title: Reference
side_content: >
  <section class="glossary">
    <h2>Susy Basics</h2>
    <h3>Settings</h3>
    <ul>
      <li><a href="#">$total-columns</li>
      <li><a href="#">$column-width</li>
      <li><a href="#">$gutter-width</li>
      <li><a href="#">$grid-padding</li>
    </ul>  
    <h3>Mixins</h3>
    <ul>
      <li><a href="#">container()</li>
      <li><a href="#">span-columns()</li>
      <li><a href="#">omega()</li>
    </ul>
    <h2>Responsive Grids</h2>
    <h3>Settings</h3>
    <ul>
      <li><a href="#">$media-layout</li>
    </ul>
    <h3>Mixins</h3>
    <ul>
      <li><a href="#">at-breakpoint()</li>
      <li><a href="#">layout()</li>
    </ul>
    <h2>Grid Helpers</h2>
    <h3>Padding Mixins</h3>
    <ul>
      <li><a href="#">prefix()</li>
      <li><a href="#">suffix()</li>
      <li><a href="#">pad()</li>
    </ul>
    <h3>Margin Mixins</h3>
    <ul>
      <li><a href="#">pre()</li>
      <li><a href="#">post()</li>
      <li><a href="#">squish()</li>
      <li><a href="#">push()</li>
      <li><a href="#">pull()</li>
    </ul>
    <h3>Grid Background Image</h3>
    <ul>
      <li><a href="#">susy-grid-background()</li>
    </ul>
    <h3>Functions</h3>
    <ul>
      <li><a href="#">span-columns()</li>
      <li><a href="#">gutter()</li>
      <li><a href="#">space()</li>
    </ul>
    <h3>Container Override Settings</h3>
    <ul>
      <li><a href="#">$container-width</li>
      <li><a href="#">$container-style</li>
    </ul>
    <h3>Direction Override Settings</h3>
    <ul>
      <li><a href="#">$from-direction</li>
      <li><a href="#">$omega-float</li>
    </ul>
  </section>
---

# Reference

### Basic Usage

    :::scss
    @import 'susy';
    
    .page { 
      @include container;
    }
    
### Terms

- **Susy Grid**: A grid that you build with Susy. 
- **Column**: The main unit of horizontal measurement on the _Grid_.
- **Layout**: The total number of _Columns_ in a grid.
- **Gutter**: The space between _Columns_.
- **Grid Padding**: Padding between the _Grid_ and the document edges.
- **Grid Element**: Any HTML element that is aligned to a _Grid_.
- **Container**: The root element of a _Grid_.
- **Context**: The number of _Columns_ spanned by the parent element.
- **Omega**: Any _Grid Element_ spanning the last _Column_ in its _Context_.