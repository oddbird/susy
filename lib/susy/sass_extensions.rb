require 'sass'

module Sass::Script::Functions

  # some helpful constants
  PERCENT = Sass::Script::Number.new(100, ["%"])
  ONE = Sass::Script::Number.new(1)
  TWO = Sass::Script::Number.new(2)

  # set the Susy column and gutter widths and number of columns
  # return total width of container
  def container(total_columns, column_width, gutter_width, side_gutter_width)
    @@susy_total_columns = total_columns
    @@susy_column_width = column_width
    @@susy_gutter_width = gutter_width
    @@susy_side_gutter_width = side_gutter_width
    context
  end

  # return the width of 'n' columns plus 'n - 1' gutters 
  # plus page padding in non-nested contexts
  def context(n = false)
    raise Sass::SyntaxError, "container() must be called before context() - should be called in susy/susy.sass" unless defined?(@@susy_total_columns)
    sg = Sass::Script::Number.new(0)
    if !n or !n.value
      n = @@susy_total_columns
      sg = @@susy_side_gutter_width
    end
    c, g = [@@susy_column_width, @@susy_gutter_width]
    n.times(c).plus(n.minus(ONE).times(g)).plus(sg.times(TWO))
  end

  # return the percentage width of 'n' columns in a context of
  #  'context_columns'
  def columns(n, context_columns = false)
    raise Sass::SyntaxError, "container() must be called before columns() - should be called in susy/susy.sass" unless defined?(@@susy_column_width)
    w = context(context_columns)
    c, g = [@@susy_column_width, @@susy_gutter_width]
    n.times(c).plus(n.minus(ONE).times(g)).div(w).times(PERCENT)
  end

  # return the percentage width of a single gutter in a context of
  #  'context_columns'
  def gutter(context_columns = false)
    raise Sass::SyntaxError, "container() must be called before columns() - should be called in susy/susy.sass" unless defined?(@@susy_gutter_width)
    w = context(context_columns)
    g = @@susy_gutter_width
    g.div(w).times(PERCENT)
  end

  # return the percentage width of a single side gutter in a context of
  #  'context_columns'
  def side_gutter(context_columns = false)
    raise Sass::SyntaxError, "container() must be called before side_gutter() - should be called in susy/susy.sass" unless defined?(@@susy_side_gutter_width)
    w = context(context_columns)
    sg = @@susy_side_gutter_width
    sg.div(w).times(PERCENT)
  end

  # return the percentage width of a single column in a context of
  #  'context_columns'
  def column(context_columns = false)
    raise Sass::SyntaxError, "container() must be called before column() - should be called in susy/susy.sass" unless defined?(@@susy_column_width)
    w = context(context_columns)
    c = @@susy_column_width
    c.div(w).times(PERCENT)
  end
end
