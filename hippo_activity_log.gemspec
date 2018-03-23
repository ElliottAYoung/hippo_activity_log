$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "hippo_activity_log/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "hippo_activity_log"
  s.version     = HippoActivityLog::VERSION
  s.authors     = ["ElliottAYoung"]
  s.email       = ["elliott.a.young@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of HippoActivityLog."
  s.description = "TODO: Description of HippoActivityLog."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.5"

  s.add_development_dependency "sqlite3"
end
