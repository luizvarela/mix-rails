require "mix-rails-albums/engine"

require "mongoid/railtie"
require "carrierwave/mongoid"
require "mini_magick"

require "haml_coffee_assets"

module MixRailsAlbums
  module Concerns
    module Models
    end
  end
end

require 'concerns/models/album'