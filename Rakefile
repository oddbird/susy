require 'fileutils'
require 'sass'

begin
  require 'echoe'

  Echoe.new('susy', open('VERSION').read) do |p|
    p.summary = "Responsive grids for Compass."
    p.description = "Susy grids are fluid on the inside, ready to respond at any moment, but contained in the candy shell of your choice, so they respond how and when and where you want them to. We don't design your site or dictate your markup, we just do the math and get out of your way."
    p.url = "http://susy.oddbird.net/"
    p.author = "Eric Meyer"
    p.email = "eric@oddbird.net"
    p.dependencies = ["compass >=0.12.2", "sass >=3.2.0"]
  end

rescue LoadError => boom
  puts "You are missing a dependency required for meta-operations on this gem."
  puts "#{boom.to_s.capitalize}."
end
