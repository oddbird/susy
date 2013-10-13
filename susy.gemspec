# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  # General Project Information
  s.name = "susy"
  s.version = "2.0.0.alpha.4"
  s.date = "2013-09-04"

  # RubyForge Information
  s.rubyforge_project = "susy"
  s.rubygems_version = "2.0.3"
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
  s.files += ["CHANGELOG.mkdn", "LICENSE.txt", "README.md"]

  # Docs Information
  s.extra_rdoc_files = ["CHANGELOG.mkdn", "LICENSE.txt", "README.md", "lib/susy.rb"]
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Susy", "--main", "README.md"]

  dependencies = {
    "compass" => "~> 0.13.alpha.7",
    "sass"    => "~> 3.3.0.rc.1"
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
