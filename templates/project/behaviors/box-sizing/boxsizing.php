<?php
/*
This file is a wrapper, for use in PHP environments, which serves boxsizing.htc using the
correct content-type, so that IE will recognize it as a behavior.  Simply specify the
behavior property to fetch this .php file instead of the .htc directly:

//
// Reset box sizing
//
* {
  margin: 0;
  @include box-sizing(border-box);
  *behavior: url(/sites/all/libraries/boxsizing/boxsizing.php);
}

This is only necessary when the web server is not configured to serve .htc files with
the text/x-component content-type, and cannot easily be configured to do so (as is the
case with some shared hosting providers).
*/

header( 'Content-type: text/x-component' );
include( 'boxsizing.htc' );
?>