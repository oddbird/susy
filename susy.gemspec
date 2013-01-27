# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  # General Project Information
  s.name = "susy"
  s.version = "2.0.0.alpha-1"
  s.date = "2013-01-23"

  # RubyForge Information
  s.rubyforge_project = "susy"
  s.rubygems_version = "1.8.24"
  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=

  # Author Information
  s.authors = ["Eric Meyer", "Mason Wendell", "Tsachi Shlidor", "Sam Richard", "Danny Palmer", "Rachel Nabors", "Scott Kellum", "Jina Bolton"]
  s.email = ["eric@oddbird.net", "mason@zivtech.com", "tsi.shlidor@gmail.com", "snugug@gmail.com", "danny@dannyprose.com", "rachelnabors@gmail.com", "scott@scottkellum.com", "jina@sushiandrobots.com"]
  s.homepage = "http://susy.oddbird.net/"

  # Project Description
  s.summary = "Responsive grids for Sass & Compass."
  s.description = "Susy is a tool for building layouts of any type with a simple shared syntax."

  # Files to Include
  s.require_paths = ["lib"]

  s.files = Dir.glob("lib/*.*")
  s.files += Dir.glob("sass/**/*.*")
  s.files += Dir.glob("templates/**/*.*")
  s.files += Dir.glob("docs/**/*.*")
  s.files += ["CHANGELOG.mkdn", "LICENSE.txt", "README.md"]

  # Docs Information
  s.extra_rdoc_files = ["CHANGELOG.mkdn", "LICENSE.txt", "README.md", "lib/susy.rb"]
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Susy", "--main", "README.md"]

  # Project Dependencies
  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<compass>,       [">= 0.12.2"])
      s.add_runtime_dependency(%q<sass>,          [">= 3.2.0"])
      s.add_runtime_dependency(%q<breakpoint>,    [">=1.3"])
    else
      s.add_dependency(%q<compass>,       [">= 0.12.2"])
      s.add_dependency(%q<sass>,          [">= 3.2.0"])
      s.add_dependency(%q<breakpoint>,    [">=1.3"])
    end
  else
    s.add_dependency(%q<compass>,       [">= 0.12.2"])
    s.add_dependency(%q<sass>,          [">= 3.2.0"])
    s.add_dependency(%q<breakpoint>,    [">=1.3"])
  end
end
