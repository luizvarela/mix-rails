# encoding: utf-8
require 'carrierwave/processing/mini_magick'
require 'mix-rails-core/gridfs'

class Albums::ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  include Sprockets::Helpers::RailsHelper
  include Sprockets::Helpers::IsolatedHelper

  # Choose what kind of storage to use for this uploader:
  storage :grid_fs
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def cache_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :resize_to_fit => [80, 80]
  # end

  def watermark
    manipulate! do |img|
      
      albums_watermark = Setting.albums_watermark
      
      watermark_image = if albums_watermark
        gridfs_file = MixRailsCore::Gridfs::read_file(albums_watermark.image.url)
        MiniMagick::Image.read(gridfs_file, "png")
      else
        # We can read a file from system too.
        #MiniMagick::Image.open("#{Rails.root}/app/assets/images/watermarks/watermark.png", "png")
        false
      end

      if watermark_image
        result = img.composite(watermark_image) do |c|
          c.gravity "SouthEast"
        end
        result
      else
        img
      end

    end
  end

  version :medium do
    process :resize_to_fill => [640,420]
    process :watermark
  end

  version :thumb do
    process :resize_to_fill => [190,143]
  end

  version :small_thumb do
    process :resize_to_fill => [82,62]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
