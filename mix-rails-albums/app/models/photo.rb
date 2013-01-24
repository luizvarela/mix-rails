class Photo
  
  include Mongoid::Document
  include Mongoid::Timestamps
  
  attr_accessible :description, :image, :image_cache

  field :description
  
  embedded_in :album

  mount_uploader :image, Albums::ImageUploader

end