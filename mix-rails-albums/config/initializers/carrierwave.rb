require 'mongoid/railtie'

CarrierWave.configure do |config|

  config.storage              = :grid_fs
  config.grid_fs_access_url   = "/system"
  #config.cache_dir = "uploads"
  config.root = Rails.root.join('public')
end