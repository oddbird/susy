#= require "vendor/jquery-1.7.1.min"

#= require "vendor/plugins/waypoints.min"
  
$ ->
  $("#main section.nav").waypoint handler: (event, direction) ->
    $(this).toggleClass "fixed", direction is "down"