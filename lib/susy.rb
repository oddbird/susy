require 'compass'
Compass::Frameworks.register('susy',
                             :stylesheets_directory => File.join(File.dirname(__FILE__), '..', 'sass'),
                             :templates_directory => File.join(File.dirname(__FILE__), '..', 'templates'))

module Sass::Script::Functions

  # Convert a grid piece from strings to numbers
  def grid_to_numbers(piece)
    items = piece.to_s.split(' ')
    Sass::Script::List.new(items.map{|i| Sass::Script::Number.new(i.to_f)}, :comma)
  end

end