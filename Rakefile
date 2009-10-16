require 'fileutils'
require 'sass'
require 'lib/susy/sass_extensions'

begin
  require 'echoe'
 
  Echoe.new('compass-susy-plugin', open('VERSION').read) do |p|
    # p.rubyforge_name = 'susy'
    p.summary = "A Compass grid system plugin."
    p.description = "Susy is a ground-up native Compass plugin grid system that takes full advantage of Sass' capabilities to remove the tedium from grid-based web design."
    p.url = "http://github.com/ericam/compass-susy-plugin"
    p.author = ['Eric Meyer']
    p.email = "eric@oddbird.net"
    p.dependencies = ["compass"]
    p.has_rdoc = false
  end
 
rescue LoadError => boom
  puts "You are missing a dependency required for meta-operations on this gem."
  puts "#{boom.to_s.capitalize}."
end
