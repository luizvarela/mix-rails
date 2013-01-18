$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
version = MixRails::VERSION

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mix-rails-writer"
  s.version     = version
  s.authors     = ["Sadjow Leão"]
  s.email       = ["sadjow@gmail.com"]
  s.homepage    = "https://github.com:mixinternet/mix-writer"
  s.summary     = "Mix Writer is a group of models, views, controllers for rails applications that added News, Blogs, Articles funcionality."
  s.description = "Mix Writer is a group of models, views, controllers for rails applications that added News, Blogs, Articles funcionality."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.11"
  
  # s.add_dependency "jquery-rails"
end
