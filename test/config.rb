# Compass CSS framework config file
add_import_path '../sass'

project_type = :stand_alone
http_path = "/"
sass_dir = "scss"
css_dir = "css"
line_comments = false
preferred_syntax = :scss
output_style = :expanded
relative_assets = true

module Sass::Script::Functions

  # Convert a grid piece from strings to numbers
  def grid_to_numbers(columns)
    items = columns.to_s.split(' ')
    Sass::Script::List.new(items.map{|i| Sass::Script::Number.new(i.to_f)}, :comma)
  end

end