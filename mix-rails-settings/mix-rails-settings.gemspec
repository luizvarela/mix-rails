$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
version = File.read(File.expand_path('../../MIX_RAILS_VERSION', __FILE__)).strip

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mix-rails-settings"
  s.version     = version
  s.authors     = ["Sadjow Leão", 'Rafael Garcia']
  s.email       = ["sadjow@gmail.com", 'rafbgarcia@gmail.com']
  s.homepage    = "https://github.com/mixinternet/mix-rails"
  s.summary     = "Settings module"
  s.description = "Settings module"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.9"
  #s.add_dependency "mix-rails", version

  # s.add_dependency "jquery-rails"
  
end
