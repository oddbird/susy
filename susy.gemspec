# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{susy}
  s.version = "1.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Eric Meyer"]
  s.date = %q{2012-10-20}
  s.description = %q{Susy grids are fluid on the inside, ready to respond at any moment, but contained in the candy shell of your choice, so they respond how and when and where you want them to. We don't design your site or dictate your markup, we just do the math and get out of your way.}
  s.email = %q{eric@oddbird.net}
  s.extra_rdoc_files = ["CHANGELOG.mkdn", "LICENSE.txt", "README.md", "lib/susy.rb"]
  s.files = ["CHANGELOG.mkdn", "LICENSE.txt", "Manifest", "README.md", "Rakefile", "VERSION", "lib/susy.rb", "sass/_susy.scss", "sass/susy/_background.scss", "sass/susy/_functions.scss", "sass/susy/_grid.scss", "sass/susy/_margin.scss", "sass/susy/_media.scss", "sass/susy/_padding.scss", "sass/susy/_settings.scss", "susy.gemspec", "templates/project/_base.scss", "templates/project/manifest.rb", "templates/project/screen.scss", "test/config.rb", "test/css/background.css", "test/css/grid.css", "test/css/margin.css", "test/css/media.css", "test/css/padding.css", "test/scss/background.scss", "test/scss/grid.scss", "test/scss/margin.scss", "test/scss/media.scss", "test/scss/padding.scss"]
  s.homepage = %q{http://susy.oddbird.net/}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Susy", "--main", "README.md"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{susy}
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Responsive grids for Compass.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<compass>, [">= 0.12.2"])
      s.add_runtime_dependency(%q<sass>, [">= 3.2.0"])
    else
      s.add_dependency(%q<compass>, [">= 0.12.2"])
      s.add_dependency(%q<sass>, [">= 3.2.0"])
    end
  else
    s.add_dependency(%q<compass>, [">= 0.12.2"])
    s.add_dependency(%q<sass>, [">= 3.2.0"])
  end
end
