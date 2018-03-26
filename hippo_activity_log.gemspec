$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "hippo_activity_log/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "hippo_activity_log"
  s.version     = HippoActivityLog::VERSION
  s.authors     = ["ElliottAYoung"]
  s.email       = ["elliott.a.young@gmail.com"]
  s.homepage    = "https://github.com/ElliottAYoung/hippo_activity_log.git"
  s.summary     = "The short-term storage POC for events from the Hippo Webhook"
  s.description = "The short-term storage POC for events from the Hippo Webhook"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency 'rails', '~> 4.2'
  s.add_dependency 'ransack', '~> 1.8', '>= 1.8.7'
  s.add_dependency 'active_model_serializers', '~> 0.10'

  s.add_development_dependency "sqlite3"
end
