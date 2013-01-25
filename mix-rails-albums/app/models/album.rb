class Album
  
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  field :name,          type: String
  field :description,   type: String
  field :date,          type: Date
  field :published,     type: Boolean, default: true


  validates_presence_of :name
  validates_presence_of :date

  #slug :name, history: true

  slug :name, history: true do |current_object|
    current_object.name.parameterize
  end

  embeds_many :photos, cascade_callbacks: true


  scope :published, where(published: true)


end