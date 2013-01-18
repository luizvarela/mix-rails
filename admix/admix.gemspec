$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
version = MixRails::VERSION

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "admix"
  s.version     = version
  s.authors     = ["Sadjow Leão", 'Rafael Garcia']
  s.email       = ["sadjow@gmail.com", 'rafbgarcia@gmail.com']
  s.homepage    = "https://github.com/mixinternet/mix-rails"
  s.summary     = "Admix administrive area for mix-rails"
  s.description = "Admix administrive area for mix-rails"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.9"
  #s.add_dependency 'mix-rails', version

  s.add_dependency "inherited_resources"
  s.add_dependency 'will_paginate_mongoid'
  s.add_dependency 'simple_form'
  s.add_dependency 'datagrid'

  s.add_dependency 'haml-rails'
  s.add_dependency "jquery-rails"
  s.add_dependency "jquery-ui-rails"

  # TODO Retirar isso aqui, ta quebrando quando tira
  s.add_dependency 'formtastic'
  s.add_dependency 'formtastic-bootstrap'

end
