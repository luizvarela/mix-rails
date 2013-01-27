# MixRails

[![Build Status](https://travis-ci.org/mixinternet/mix-rails.png)](https://travis-ci.org/mixinternet/mix-rails)
[![Dependency Status](https://gemnasium.com/mixinternet/mix-rails.png)](https://gemnasium.com/mixinternet/mix-rails)

MixRails is a CMS based on Ruby on Rails and uses Mongoid as ORM(MongoDB).


## Usage

Create a new rails project.

    $ rails new myproject -T --skip-active-record --skip-bundle --dummy-path=spec/dummy

Add this line to your application's Gemfile:

    gem 'mix-rails'

And then execute:
    $ cd myproject
    $ bundle


In your config/application.rb add require 'mix-rails/all'.

```ruby
require "action_controller/railtie"
require "action_mailer/railtie"
require "active_resource/railtie"
require "sprockets/railtie"
require "rails/test_unit/railtie"

# After rails requiring mix-rails!!
require "mix-rails/all"
```

Configure a mongoid instance with:

    $ rails generate mongoid:config

And then run the application

    $ bundle exec rails server

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

# Assets
You can use Backbone, CoffeeScript, HAML, 

# Auth
Mix-Rails uses [Devise](https://github.com/plataformatec/devise) for auth, you can see more docs at:

Create a default user.

    $ bundle exec rake create_user[yourname@example.com,mypassword]

If you are using admix enter /admix and you will see the login page.
You can also login with page /users/sign_in

# Admix

Admix is a administrative area for any system.

## URL

You can change default path for admix setting  Admix::namespace_path
```ruby
Admix::namespace_path = "myadminpath"
# You will access http://localhost:3000/myadminpath and see Admix running!!
```

TODO: Add some docs for admix

[![Admix](http://img233.imageshack.us/img233/6731/screenshotfrom201301221.png)]
