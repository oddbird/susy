susy_stylesheets_path = File.expand_path(File.join(File.dirname(__FILE__), '..', 'sass'))
begin
  require 'compass'
  Compass::Frameworks.register('susy', :stylesheets_directory => susy_stylesheets_path)
rescue LoadError
  # compass not found, register on the Sass path via the environment.
  if ENV.has_key?("SASS_PATH")
    ENV["SASS_PATH"] = ENV["SASS_PATH"] + File::PATH_SEPARATOR + susy_stylesheets_path
  else
    ENV["SASS_PATH"] = susy_stylesheets_path
  end
end
