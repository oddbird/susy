susy_stylesheets_path = File.expand_path(File.join(File.dirname(__FILE__), '..', 'sass'))
begin
  require 'compass'
  Compass::Frameworks.register('susy', :stylesheets_directory => susy_stylesheets_path)
rescue LoadError
  # compass not found, register on the Sass path via the environment.
  if ENV.has_key?("SASSPATH")
    ENV["SASSPATH"] = ENV["SASSPATH"] + File::PATH_SEPARATOR + susy_stylesheets_path
  else
    ENV["SASSPATH"] = susy_stylesheets_path
  end
end
