# MixRails

MixRails is a CMS based on Ruby on Rails and uses Mongoid as ORM(MongoDB).

## Installation

Add this line to your application's Gemfile:

    gem 'mix-rails'

And then execute:

    $ bundle

## Usage

Create a new rails project.

    $ rails new myproject

In your config/application.rb add these after require 'rails/all'.

    ```ruby
    require 'mix-rails/all'
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
