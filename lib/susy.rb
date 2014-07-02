base_directory  = File.expand_path(File.join(File.dirname(__FILE__), '..'))
susy_stylesheets_path = File.join(base_directory, 'sass')
susy_templates_path = File.join(base_directory, 'templates')

if (defined? Compass)
  Compass::Frameworks.register('susy', :stylesheets_directory => susy_stylesheets_path, :templates_directory => susy_templates_path)
else
  # compass not found, register on the Sass path via the environment.
  if ENV.has_key?("SASS_PATH")
    ENV["SASS_PATH"] = ENV["SASS_PATH"] + File::PATH_SEPARATOR + susy_stylesheets_path
  else
    ENV["SASS_PATH"] = susy_stylesheets_path
  end
end

#
# Sass 3.3 performance tweaks, overrides methods defined in sass code
#
require 'sass/plugin' if defined?(Sass)
module Sass::Script::Functions
  def rb_susy_deep_has_key(map, *keys)
    v = nil
    h = map.to_h
    keys.each do |key|
      v = h[key]
      if (type_of(v).to_s == "map")
        h = v.to_h
      elsif (v != nil)
        v = Sass::Script::Value::Bool.new(true)
        break
      end
    end
    return Sass::Script::Value::Bool.new(v != nil)
  end


  def rb_susy_deep_get(map, *keys)
    v = Sass::Script::Value::Null.new
    h = map.to_h
    keys.each do |key|
      v = h[key]
      if (type_of(v).to_s == "map")
        h = v.to_h
      else
        break
      end
    end
    return v
  end

  def rb_valid_columns(columns, silent = Sass::Script::Value::Bool.new(FALSE))
    val = Sass::Script::Value::Null.new
    if (type_of(columns).to_s == "number" && columns.unitless?)
      val = columns
    else
      if (type_of(columns).to_s == "list")
        fail = false
        columns.to_a.each do |col|
          fail = (!type_of(col).to_s.eql?("number")) || !col.unitless? || fail
        end
        val = (fail ? val : columns)
      end
    end

    if (val != columns && silent.to_s.eql?("false"))
      val = Sass::Script::Value::Null.new
      warn("$columns must be a unitless number or list of unitless numbers. Current value [#{type_of(columns)}]: #{columns}")
    end
    val
  end
end