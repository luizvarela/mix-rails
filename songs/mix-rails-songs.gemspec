$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require File.expand_path('../../lib/mix-rails/version', __FILE__)

# Maintain your gem's version:
version = MixRails::VERSION

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mix-rails-songs"
  s.version     = version
  s.authors     = ["Sadjow Medeiros Leão"]
  s.email       = ["sadjow@gmail.com"]
  s.homepage    = "https://github.com/mixinternet/mix-rails"
  s.summary     = "Songs module for mix-rails"
  s.description = "Songs module for mix-rails"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.11"
  # s.add_dependency "jquery-rails"
end
