class Post
  
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia
  include Mongoid::Slug

  field :title,         type: String
  field :text,          type: String
  field :source,        type: String
  field :date,          type: DateTime
  field :published,     type: Boolean, default: true


  validates_presence_of :title
  validates_presence_of :date

  slug :title, history: true do |current_object|
    current_object.title.parameterize
  end

  scope :published, where(published: true)

  mount_uploader :image, Writer::ImageUploader
  
end