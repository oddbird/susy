# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  # General Project Information
  s.name = "susy"
  s.version = File.read(File.join(File.dirname(__FILE__), "VERSION"))
  s.licenses = ['BSD-3-Clause']
  s.date = "2015-09-01"

  # RubyForge Information
  s.rubyforge_project = "susy"
  s.rubygems_version = "2.0.3"
  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=

  # Author Information
  s.authors = ["Miriam Eric Suzanne"]
  s.email = ["miriam@oddbird.net"]
  s.homepage = "http://susy.oddbird.net/"

  # Project Description
  s.summary = "Responsive layout toolkit for Sass."
  s.description = "Susy is a toolkit for building layouts of all types with a simple, natural syntax."

  # Files to Include
  s.require_paths = ["lib"]

  s.files = Dir.glob("lib/*.*")
  s.files += Dir.glob("sass/**/*.*")
  s.files += Dir.glob("templates/**/*.*")
  s.files += ["docs/changelog.rst", "LICENSE.txt", "README.md", "VERSION"]

  # Docs Information
  s.extra_rdoc_files = ["docs/changelog.rst", "LICENSE.txt", "README.md", "lib/susy.rb"]
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Susy", "--main", "README.md"]

  dependencies = {
    "sass"    => [">= 3.3.0", "< 3.5"]
  }
  # Project Dependencies
  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      dependencies.each do |project, version|
        s.add_runtime_dependency(project, version)
      end
    else
      dependencies.each do |project, version|
        s.add_dependency(project, version)
      end
    end
  else
    dependencies.each do |project, version|
      s.add_dependency(project, version)
    end
  end
end
