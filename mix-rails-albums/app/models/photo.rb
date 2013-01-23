class Photo
  
  include Mongoid::Document
  include Mongoid::Timestamps
  
  attr_accessible :id, :description, :image, :image_cache

  field :description
  
  embedded_in :album

  mount_uploader :image, Albums::ImageUploader




  def id
    self._id
  end

  def as_json(options={})
    options.merge!(:except => :_id, :methods => :id)
    super(options)
  end

end