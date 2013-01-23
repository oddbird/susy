# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  # General Project Information
  s.name = "susy"
  s.version = "2.0.beta-1"
  s.date = "2013-01-23"

  # RubyForge Information
  s.rubyforge_project = "susy"
  s.rubygems_version = "1.8.24"
  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=

  # Author Information
  s.authors = ["Eric Meyer", "Sam Richard"]
  s.email = ["eric@oddbird.net", "snugug@gmail.com"]
  s.homepage = "http://susy.oddbird.net/"

  # Project Description
  s.summary = "Responsive grids for Compass."
  s.description = "Susy grids are fluid on the inside, ready to respond at any moment, but contained in the candy shell of your choice, so they respond how and when and where you want them to. We don't design your site or dictate your markup, we just do the math and get out of your way."

  # Files to Include
  s.require_paths = ["lib"]

  s.files = Dir.glob("lib/*.*")
  s.files += Dir.glob("sass/**/*.*")
  s.files += Dir.glob("templates/**/*.*")
  s.files += Dir.glob("docs/**/*.*")
  s.files += ["CHANGELOG.mkdn", "LICENSE.txt", "README.md"]

  # s.files = ["CHANGELOG.mkdn", "LICENSE.txt", "Manifest", "README.md", "Rakefile", "VERSION", "lib/susy.rb", "sass/_susy.scss", "sass/susy/_background.scss", "sass/susy/_functions.scss", "sass/susy/_grid.scss", "sass/susy/_margin.scss", "sass/susy/_media.scss", "sass/susy/_padding.scss", "sass/susy/_settings.scss", "sass/susy/_support.scss", "sass/susy/_units.scss", "susy.gemspec", "templates/project/_base.scss", "templates/project/manifest.rb", "templates/project/screen.scss", "test/config.rb", "test/css/background.css", "test/css/functions.css", "test/css/grid.css", "test/css/margin.css", "test/css/media.css", "test/css/padding.css", "test/scss/background.scss", "test/scss/functions.scss", "test/scss/grid.scss", "test/scss/margin.scss", "test/scss/media.scss", "test/scss/padding.scss"]

  # Docs Information
  s.extra_rdoc_files = ["CHANGELOG.mkdn", "LICENSE.txt", "README.md", "lib/susy.rb"]
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Susy", "--main", "README.md"]

  # Project Dependencies
  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<compass>,       [">= 0.12.2"])
      s.add_runtime_dependency(%q<sass>,          [">= 3.2.0"])
      s.add_runtime_dependency(%q<sassy-strings>, [">=0.3.1"])
      s.add_runtime_dependency(%q<sassy-math>,    [">=0.1.5"])
      s.add_runtime_dependency(%q<breakpoint>,    [">=1.3"])
    else
      s.add_dependency(%q<compass>,       [">= 0.12.2"])
      s.add_dependency(%q<sass>,          [">= 3.2.0"])
      s.add_dependency(%q<sassy-strings>, [">=0.3.1"])
      s.add_dependency(%q<sassy-math>,    [">=0.1.5"])
      s.add_dependency(%q<breakpoint>,    [">=1.3"])
    end
  else
    s.add_dependency(%q<compass>,       [">= 0.12.2"])
    s.add_dependency(%q<sass>,          [">= 3.2.0"])
    s.add_dependency(%q<sassy-strings>, [">=0.3.1"])
    s.add_dependency(%q<sassy-math>,    [">=0.1.5"])
    s.add_dependency(%q<breakpoint>,    [">=1.3"])
  end
end
