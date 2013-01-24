$:.push File.expand_path("../lib", __FILE__)
# Maintain your gem's version:
version = File.read(File.expand_path('../../MIX_RAILS_VERSION', __FILE__)).strip

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mix-rails-core"
  s.version     = version
  s.authors     = ["Sadjow Leão"]
  s.email       = ["sadjow@gmail.com"]
  s.homepage    = "https://github.com/mixinternet/mix-rails"
  s.summary     = "This is the core of the mix-rails"
  s.description = "This is the core of the mix-rails"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.9"

  s.add_dependency 'mail_form',    '~> 1.4.0'
  s.add_dependency 'simple_form',  '~> 2.0.0'
  
  s.add_dependency 'enumerize'

  s.add_dependency "activevalidators"

  s.add_dependency "i18n_routing"

  s.add_dependency "rails-i18n"

  s.add_dependency 'mongoid'
  # mongoid should be loaded before cancan
  s.add_dependency "cancan"
  
  s.add_dependency 'mongoid_slug'
  s.add_dependency 'bson_ext'
  s.add_dependency 'mongo'
  s.add_dependency 'carrierwave-mongoid'
  s.add_dependency 'mini_magick'
  s.add_dependency 'haml_coffee_assets'
  
  s.add_dependency 'rspec-rails'
  s.add_dependency 'database_cleaner'

  s.add_dependency 'breadcrumbs'
  s.add_dependency 'simple-navigation'
  s.add_dependency 'simple-navigation-bootstrap'
  s.add_dependency 'datagrid', '~> 0.7.0'
  s.add_dependency 'will_paginate_mongoid'

  s.add_dependency "jquery-rails"
  s.add_dependency "jquery-ui-rails"

  s.add_dependency "coffee-script"
  s.add_dependency "coffee-filter"
  s.add_dependency "rails-backbone"
  #s.add_dependency "sass-rails"

end
