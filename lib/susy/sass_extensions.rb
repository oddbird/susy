require 'sass'

module Sass::Script
  class Number < Literal
    def ceil
      Number.new(value.ceil, numerator_units, denominator_units)
    end
  end
end

module Sass::Script::Functions

  # some helpful constants
  PERCENT = Sass::Script::Number.new(100, ["%"])
  ONE = Sass::Script::Number.new(1)
  TWO = Sass::Script::Number.new(2)
  ZERO = Sass::Script::Number.new(0)
  NUDGE_PX = Sass::Script::Number.new(0.25,["px"])
  NUDGE_EM = Sass::Script::Number.new(0.025,["em"])

  # set the Susy column and gutter widths and number of columns
  # return total width of container
  def container(total_columns, column_width, gutter_width, side_gutter_width)
    @@susy_total_columns = total_columns
    @@susy_column_width = column_width
    @@susy_gutter_width = gutter_width
    @@susy_side_gutter_width = side_gutter_width
    if @@susy_column_width.numerator_units.include?('em')
      @@nudge = NUDGE_EM
    elsif @@susy_column_width.numerator_units.include?('px')
      @@nudge = NUDGE_PX
    else
      @@nudge = ZERO
    end
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
    n.times(c).plus(n.minus(ONE).ceil.times(g)).plus(sg.times(TWO))
  end

  # return the percentage width of 'n' columns in a context of
  #  'context_columns'
  def columns(n, context_columns = false)
    raise Sass::SyntaxError, "container() must be called before columns() - should be called in susy/susy.sass" unless defined?(@@susy_column_width)
    w = context(context_columns)
    c, g = [@@susy_column_width, @@susy_gutter_width]
    n.times(c).plus(n.minus(ONE).ceil.times(g)).plus(nudge).div(w).times(PERCENT)
  end

  # return the percentage width of a single gutter in a context of
  #  'context_columns'
  def gutter(context_columns = false)
    raise Sass::SyntaxError, "container() must be called before columns() - should be called in susy/susy.sass" unless defined?(@@susy_gutter_width)
    w = context(context_columns)
    g = @@susy_gutter_width
    g.plus(nudge).div(w).times(PERCENT)
  end

  # return the percentage width of a single side gutter in a context of
  #  'context_columns'
  def side_gutter(context_columns = false)
    raise Sass::SyntaxError, "container() must be called before side_gutter() - should be called in susy/susy.sass" unless defined?(@@susy_side_gutter_width)
    w = context(context_columns)
    sg = @@susy_side_gutter_width
    sg.plus(nudge).div(w).times(PERCENT)
  end

  # return the percentage width of a single column in a context of
  #  'context_columns'
  def column(context_columns = false)
    raise Sass::SyntaxError, "container() must be called before column() - should be called in susy/susy.sass" unless defined?(@@susy_column_width)
    w = context(context_columns)
    c = @@susy_column_width
    c.div(w).times(PERCENT)
  end

  # nudge methods

  def columns_nudge(n, context_columns = false)
    with_nudge {columns(n, context_columns)}
  end

  def gutter_nudge(context_columns = false)
    with_nudge {gutter(context_columns)}
  end

  def side_gutter_nudge(context_columns = false)
    with_nudge {side_gutter(context_columns)}
  end

  private

  # applies a nudge factor to a block
  def with_nudge(&block)
    @nudge = @@nudge
    value = yield block
    @nudge = ZERO
    value
  end

  def nudge
    @nudge ||= ZERO
  end

end
