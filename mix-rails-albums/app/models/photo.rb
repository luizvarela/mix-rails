class Photo
  
  include Mongoid::Document
  include Mongoid::Timestamps

  field :description
  
  embedded_in :album

  mount_uploader :image, Albums::ImageUploader

end