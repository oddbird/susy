require 'rubygems/package_task'

task :default => :test

spec = eval(File.read("susy.gemspec"), binding, "susy.gemspec")

def spec.bump!
  segments = version.to_s.split(".")
  segments[-1] = segments.last.succ
  self.version = Gem::Version.new(segments.join("."))
end

# Set SAME_VERSION when moving to a new major version and you want to specify the new version
# explicitly instead of bumping the current version.
# E.g. rake build SAME_VERSION=True
spec.bump! unless ENV["SAME_VERSION"]

desc "Run tests and build susy-#{spec.version}.gem"
task :build => [:test, :gem]

desc "Make make the prebuilt gem susy-#{spec.version}.gem public."
task :publish => [:record_version, :push_gem, :tag]

desc "Build & Publish version #{spec.version}"
task :release => [:build, :publish]

Gem::PackageTask.new(spec) do |pkg|
  pkg.need_zip = true
  pkg.need_tar = true
end

desc "run the tests"
task :test do
  sh "bundle install --quiet && npm install && cd test && bundle exec sass scss/test.scss css/test.css 2> error.output > /dev/null --force && cd - > /dev/null", :verbose => false
  open("test/error.output") do |f|
    if f.read =~ /(.*):\d+.* (\d+) Passed.* (\d+) Failed/
      unless $3 == "0"
        puts File.read("test/css/test.css")
        fail "#{$3} Tests Failed"
      else
        puts "#{$2} Tests Passed"
      end
    else
      raise "unexpected output"
    end
  end
  sh "rm test/error.output", :verbose => false
end

desc "Record the new version in version control for posterity"
task :record_version do
  unless ENV["SAME_VERSION"]
    open(FileList["VERSION"].first, "w") do |f|
      f.write(spec.version.to_s)
    end
    sh "git add VERSION bower.json"
    sh %Q{git commit -am "Bump version to #{spec.version}."}
  end
end

desc "Tag the repo as #{spec.version} and push the code and tag."
task :tag do
  sh "git tag -a -m 'Version #{spec.version}' #{spec.version}"
  sh "git push --tags origin #{`git rev-parse --abbrev-ref HEAD`}"
end

desc "Push susy-#{spec.version}.gem to the rubygems server"
task :push_gem do
  sh "gem push pkg/susy-#{spec.version}.gem"
end
