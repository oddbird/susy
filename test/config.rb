# Compass CSS framework config file
require "sassy-strings"
require "breakpoint"
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
  def mq_compare(mq1, mq2, operator)
    mq1 = mq1.value.to_i
    mq2 = mq2.value.to_i

    if operator.value == 'lte'
      if mq1 <= mq2
        Sass::Script::Bool.new(true)
      else
        Sass::Script::Bool.new(false)
      end
    elsif operator.value == 'gte'
      if mq1 >= mq2
        Sass::Script::Bool.new(true)
      else
        Sass::Script::Bool.new(false)
      end
    elsif operator.value == 'lt'
      if mq1 < mq2
        Sass::Script::Bool.new(true)
      else
        Sass::Script::Bool.new(false)
      end
    elsif operator.value == 'gt'
      if mq1 > mq2
        Sass::Script::Bool.new(true)
      else
        Sass::Script::Bool.new(false)
      end
    else
      if mq1 == mq2
        Sass::Script::Bool.new(true)
      else
        Sass::Script::Bool.new(false)
      end
    end
  end

  def grid_to_numbers(columns)
    items = columns.to_s.split(' ')
    Sass::Script::List.new(items.map{|i| Sass::Script::Number.new(i.to_f)}, :comma)
  end

  # def str_replace(needle, replace, haystack)
  #   result = haystack.value.gsub(needle.value, replace.value)
  #   Sass::Script::String.new(result)
  # end

  # def split_string(string, key)
  #   items = string.value.split(" " + key.value + " ")
  #   if items.count == 1
  #     Sass::Script::Bool.new(false)
  #   else
  #     Sass::Script::List.new(items.map{|i| Sass::Script::String.new(i)}, :comma)
  #   end
  # end

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