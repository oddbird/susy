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
  def str_replace(needle, replace, haystack)
    result = haystack.value.gsub(needle.value, replace.value)
    Sass::Script::String.new(result)
  end

  def split_string(string, key)
    items = string.value.split(" " + key.value + " ")
    if items.count == 1
      Sass::Script::Bool.new(false)
    else
      Sass::Script::List.new(items.map{|i| Sass::Script::String.new(i)}, :comma)
    end
  end

  # def add_grid(gridDef)
  #   gridSplit = split_string(gridDef, Sass::Script::String.new('at'))
  #   puts gridSplit
  # end

  # def grid_sort(grids)
  #   grids.value.each_with_index do |elem, i|
  #     puts elem
  #     if i > 0
  #       elem[1]
  #     end
  #   end
  #   Sass::Script::String.new("hello")
  # end
end