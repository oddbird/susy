require 'fileutils'
require 'sass'

begin
  require 'echoe'

  Echoe.new('compass-susy-plugin', open('VERSION').read) do |p|
    p.summary = "A responsive grid system plugin for Compass."
    p.description = "Responsive web design with grids the quick and reliable way."
    p.url = "http://susy.oddbird.net/"
    p.author = "Eric Meyer"
    p.email = "eric@oddbird.net"
    p.dependencies = ["compass >=0.11.1"]
    p.has_rdoc = false
  end

rescue LoadError => boom
  puts "You are missing a dependency required for meta-operations on this gem."
  puts "#{boom.to_s.capitalize}."
end
