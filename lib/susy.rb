require 'compass'
require 'sassy-strings'
require 'sassy-math'
require 'breakpoint'
Compass::Frameworks.register('susy',
                             :stylesheets_directory => File.join(File.dirname(__FILE__), '..', 'sass'),
                             :templates_directory => File.join(File.dirname(__FILE__), '..', 'templates'))

module Sass::Script::Functions
  # Compare Media Queries
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

  # Convert a grid piece from strings to numbers
  def grid_to_numbers(piece)
    items = piece.to_s.split(' ')
    Sass::Script::List.new(items.map{|i| Sass::Script::Number.new(i.to_f)}, :comma)
  end
end