require 'sass'

module Sass::Script::Functions
  # set the Susy column and gutter widths and number of columns
  #  column, gutter and padding widths should be sent as unitless numbers, 
  #  though they may "really" be ems or pixels (_grid.sass handles units).
  # return total width of container (without units)
  def container(total_columns, column_width, gutter_width, side_gutter_width)
    @@susy_total_columns = total_columns.value
    @@susy_column_width = Float(column_width.value)
    @@susy_gutter_width = Float(gutter_width.value)
    @@susy_side_gutter_width = Float(side_gutter_width.value)
    context
  end

  # return the width of 'n' columns plus 'n - 1' gutters 
  # plus page padding in non-nested contexts
  def context(n = nil)
    raise Sass::SyntaxError, "container() must be called before context() - should be called in susy/susy.sass" unless defined?(@@susy_side_gutter_width)
    begin
      n = n.value
    rescue NoMethodError
      n = false
    end
    sg = 0
    if !n
      n = @@susy_total_columns
      sg = @@susy_side_gutter_width
    end
    c, g = [@@susy_column_width, @@susy_gutter_width]
    Sass::Script::Number.new(((n * c) + ((n - 1) * g)) + (sg * 2))
  end

  # return the percentage width of 'number' columns in a context of
  #  'context_columns'
  def columns(number, context_columns = nil)
    raise Sass::SyntaxError, "container() must be called before columns() - should be called in susy/susy.sass" unless defined?(@@susy_column_width)
    n = number.value
    context_width = context(context_columns).value
    c, g = [@@susy_column_width, @@susy_gutter_width]
    Sass::Script::Number.new((((n * c) + ((n - 1) * g)) / context_width) * 100)
  end

  # return the percentage width of a single gutter in a context of
  #  'context_columns'
  def gutter(context_columns = nil)
    raise Sass::SyntaxError, "container() must be called before columns() - should be called in susy/susy.sass" unless defined?(@@susy_gutter_width)
    context_width = context(context_columns).value
    g = @@susy_gutter_width
    Sass::Script::Number.new((g / context_width) * 100)
  end

  # return the percentage width of a single side gutter in a context of
  #  'context_columns'
  def side_gutter(context_columns = nil)
    raise Sass::SyntaxError, "container() must be called before side_gutter() - should be called in susy/susy.sass" unless defined?(@@susy_side_gutter_width)
    context_width = context(context_columns).value
    sg = @@susy_side_gutter_width
    Sass::Script::Number.new((sg / context_width) * 100)
  end

  # return the percentage width of a single column in a context of
  #  'context_columns'
  def column(context_columns = nil)
    raise Sass::SyntaxError, "container() must be called before column() - should be called in susy/susy.sass" unless defined?(@@susy_column_width)
    context_width = context(context_columns).value
    c = @@susy_column_width
    Sass::Script::Number.new((c / context_width) * 100)
  end
end
