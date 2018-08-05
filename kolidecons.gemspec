require File.expand_path('../lib/kolidecons/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = "kolidecons"
  s.version     = Kolidecons::VERSION
  s.summary     = "Kolide's Kolidecons gem"
  s.platform    = Gem::Platform::RUBY
  s.description = "A package that distributes Kolidecons in a gem"
  s.authors     = ["Kolide Inc."]
  s.email       = ["engineering@kolide.com"]
  s.files       = Dir['{lib}/**/*'] + ['LICENSE', 'README.md']
  s.homepage    = "https://github.com/kolide/kolidecons_gem"
  s.license     = "MIT"
  s.add_dependency "nokogiri", ">= 1.6.3.1"
end
