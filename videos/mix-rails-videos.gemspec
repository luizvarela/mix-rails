$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
version = MixRails::VERSION

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mix-rails-videos"
  s.version     = version
  s.authors     = ["Rafael Garcia", "Sadjow Medeiros Leão"]
  s.email       = ["rafbgarcia@gmail.com", "sadjow@gmail.com"]
  s.homepage    = "https://github.com/mixinternet/mix-rails"
  s.summary     = "This is the videos module of mix-rails"
  s.description = "This is the videos module of mix-rails"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.11"
  s.add_dependency "simple_youtube", "~> 3.0.0"
  # s.add_dependency "jquery-rails"
end
