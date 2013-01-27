$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mix-rails-wireframe/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mix-rails-wireframe"
  s.version     = MixRailsWireframe::VERSION
  s.authors     = ["Sadjow Medeiros Leão"]
  s.email       = ["sadjow@gmail.com"]
  s.homepage    = "https://github.com/mixinternet/mix-rails"
  s.summary     = "Wireframe module for mix-rails gem"
  s.description = "Wireframe module for mix-rails gem"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.11"
  # s.add_dependency "jquery-rails"
end
