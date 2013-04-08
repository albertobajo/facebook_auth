$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "facebook_auth/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "facebook_auth"
  s.version     = FacebookAuth::VERSION
  s.authors     = ["Alberto Bajo"]
  s.email       = ["albertobajo@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "Facebook Authentication Engine."
  s.description = "Facebook Authentication Engine."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.12"
  s.add_dependency "hashie", "~> 1.2"
  s.add_dependency "omniauth", "~> 1.1.3"
  s.add_dependency "omniauth-facebook", "~> 1.4.1"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails", "~> 2.13.0"
end
