$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
version = File.read(File.expand_path('../../MIX_RAILS_VERSION', __FILE__)).strip

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mix-rails-auth"
  s.version     = version
  s.authors     = ["Sadjow", 'Rafael']
  s.email       = ["sadjow@gmail.com", 'rafbgarcia@gmail.com']
  s.homepage    = "http://github.com/mixinternet/mix-rails"
  s.summary     = "This is the auth module of mix-rails"
  s.description = "This is the auth module of mix-rails"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.9"
  # s.add_dependency "jquery-rails"
  #
  s.add_dependency "devise", "~> 2.1.2"
  s.add_dependency "devise-i18n"

  #s.add_dependency 'mix-rails-core', version 

end
