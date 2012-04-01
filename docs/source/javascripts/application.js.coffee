#= require "vendor/jquery-1.7.1.min"

#= require "vendor/plugins/waypoints.min"
  
$ ->
  
  # scrolling header navigation on scroll (using waypoints JQuery plugin)
  $.waypoints.settings.scrollThrottle = 30
  $("#main section.nav").waypoint ((event, direction) ->
    $(this).toggleClass "fixed", direction is "down"
  ),
    offset: "0"