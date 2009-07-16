require 'sass'

module Sass::Script::Functions
  # set the Susy column and gutter widths and number of columns
  #  column, gutter and padding widths should be sent as unitless numbers, 
  #  though they may "really" be ems or pixels (_grid.sass handles units).
  # return total width of container (without units)
  def container(total_columns, column_width, gutter_width, page_padd)
    @@susy_total_columns = total_columns.value
    @@susy_column_width = Float(column_width.value)
    @@susy_gutter_width = Float(gutter_width.value)
    @@susy_page_padd = Float(page_padd.value)
    context
  end

  # return the width of 'n' columns plus 'n - 1' gutters 
  # plus page padding in non-nested contexts
  def context(n = nil)
    begin
      n = n.value
    rescue NoMethodError
      n = @@susy_total_columns
    end
    if n == @@susy_total_columns
      p = @@susy_page_padd
    else
      p = 0
    end
    c, g = [@@susy_column_width, @@susy_gutter_width]
    Sass::Script::Number.new(((n * c) + ((n - 1) * g)) + (p*2))
  end

  # return the percentage width of 'number' columns in a context of
  #  'context_columns'
  def columns(number, context_columns = nil)
    n = number.value
    context_width = context(context_columns).value
    c, g = [@@susy_column_width, @@susy_gutter_width]
    Sass::Script::Number.new((((n * c) + ((n - 1) * g)) / context_width) * 100)
  end

  # return the percentage width of a single gutter in a context of
  #  'context_columns'
  def gutter(context_columns = nil)
    context_width = context(context_columns).value
    g = @@susy_gutter_width
    Sass::Script::Number.new((g / context_width) * 100)
  end

  # return the percentage width of a single gutter in a context of
  #  'context_columns'
  def padd(context_columns = nil)
    context_width = context(context_columns).value
    p = @@susy_page_padd
    Sass::Script::Number.new((p / context_width) * 100)
  end

  # return the percentage width of a single column in a context of
  #  'context_columns'
  def column(context_columns = nil)
    context_width = context(context_columns).value
    c = @@susy_column_width
    Sass::Script::Number.new((c / context_width) * 100)
  end
end
