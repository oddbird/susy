require 'sass'

module Sass::Script::Functions
  def enumerate(prefix, from_index, to_index)
    Sass::Script::String.new(((from_index.value)..(to_index.value)).map{|i| "#{prefix}#{i}"}.join(", "))
  end
end