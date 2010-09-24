# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{compass-susy-plugin}
  s.version = "0.8.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Eric Meyer"]
  s.date = %q{2010-09-24}
  s.description = %q{Responsive web design with grids the quick and reliable way.}
  s.email = %q{eric@oddbird.net}
  s.extra_rdoc_files = ["LICENSE.txt", "README.mkdn", "lib/susy.rb", "lib/susy/compass_plugin.rb", "lib/susy/sass_extensions.rb"]
  s.files = ["LICENSE.txt", "Manifest", "README.mkdn", "Rakefile", "VERSION", "compass-susy-plugin.gemspec", "lib/susy.rb", "lib/susy/compass_plugin.rb", "lib/susy/sass_extensions.rb", "sass/susy/_grid.scss", "sass/susy/_inline_block_list.scss", "sass/susy/_reset.scss", "sass/susy/_susy.scss", "sass/susy/_text.scss", "sass/susy/_utils.scss", "sass/susy/_vertical_rhythm.scss", "templates/project/_base.scss", "templates/project/_defaults.scss", "templates/project/grid.png", "templates/project/ie.scss", "templates/project/manifest.rb", "templates/project/print.scss", "templates/project/screen.scss"]
  s.homepage = %q{http://susy.oddbird.net/}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Compass-susy-plugin", "--main", "README.mkdn"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{compass-susy-plugin}
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{A responsive grid system plugin for Compass.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<compass>, [">= 0.10.0"])
    else
      s.add_dependency(%q<compass>, [">= 0.10.0"])
    end
  else
    s.add_dependency(%q<compass>, [">= 0.10.0"])
  end
end
