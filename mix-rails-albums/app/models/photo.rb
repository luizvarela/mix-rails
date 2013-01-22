class Photo
  
  include Mongoid::Document
  include Mongoid::Timestamps
  
  attr_accessible :image, :image_cache

  field :legend
  
  embedded_in :album

  mount_uploader :image, Albums::ImageUploader

end