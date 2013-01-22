$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
version = File.read(File.expand_path('../../MIX_RAILS_VERSION', __FILE__)).strip

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mix-rails-vouchers"
  s.version     = version
  s.authors     = ["Rafael Garcia", "Sadjow Medeiros Leão"]
  s.email       = ["rafbgarcia@gmail.com", "sadjow@gmail.com"]
  s.homepage    = "https://github.com/mixinternet/mix-rails"
  s.summary     = "Vouchers module for mix-rails"
  s.description = "Vouchers module for mix-rails"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency 'mail_form', '~> 1.4.0'
  s.add_dependency "rails", "~> 3.2.9"
  s.add_dependency 'carrierwave-mongoid', '~> 0.3.0'
end
