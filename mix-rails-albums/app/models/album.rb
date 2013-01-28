class Album
  
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  extend Enumerize

  field :title,          type: String
  field :description,   type: String
  field :date,          type: Date
  field :status,        type: String
  enumerize :status, in: [:published, :unpublished], default: :published, predicates: true


  validates_presence_of :title
  validates_presence_of :date

  #slug :name, history: true

  slug :title, history: true do |current_object|
    current_object.title.parameterize
  end

  embeds_many :photos, cascade_callbacks: true

  scope :published, where(status: :published, :photos.ne => nil, :photos.exists => true)


end