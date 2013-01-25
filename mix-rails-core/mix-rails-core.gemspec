$:.push File.expand_path("../lib", __FILE__)
# Maintain your gem's version:
version = File.read(File.expand_path("../../MIX_RAILS_VERSION", __FILE__)).strip

# Describe your gem and declare its dependencies:
Gem::Specification.new do |gem|
  gem.name        = "mix-rails-core"
  gem.version     = version
  gem.authors     = ["Sadjow Leão"]
  gem.email       = ["sadjow@gmail.com"]
  gem.homepage    = "https://github.com/mixinternet/mix-rails"
  gem.summary     = "This is the core of the mix-rails"
  gem.description = "This is the core of the mix-rails"

  gem.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  gem.add_dependency "rails", "~> 3.2.9"

  gem.add_dependency "mail_form",    "~> 1.4.0"
  gem.add_dependency "simple_form",  "~> 2.0.0"
  
  gem.add_dependency "enumerize"

  gem.add_dependency "activevalidators"

  gem.add_dependency "i18n_routing"

  gem.add_dependency "rails-i18n"

  gem.add_dependency "mongoid"
  # mongoid should be loaded before cancan
  gem.add_dependency "cancan"
  
  gem.add_dependency "mongoid_slug"
  gem.add_dependency "bson_ext"
  gem.add_dependency "mongo"
  gem.add_dependency "carrierwave-mongoid"
  gem.add_dependency "mini_magick"
  gem.add_dependency "haml_coffee_assets"
  
  gem.add_dependency "rspec-rails"
  gem.add_dependency "database_cleaner"

  gem.add_dependency "breadcrumbs"
  gem.add_dependency "simple-navigation"
  gem.add_dependency "simple-navigation-bootstrap"
  gem.add_dependency "datagrid", "~> 0.7.0"
  gem.add_dependency "will_paginate_mongoid"

  gem.add_dependency "jquery-rails"
  gem.add_dependency "jquery-ui-rails"

  gem.add_dependency "coffee-script"
  gem.add_dependency "coffee-filter"
  gem.add_dependency "rails-backbone"
  #gem.add_dependency "sass-rails"

  gem.add_dependency "jquery-qtip2-rails", "~> 0.4.0"

end
