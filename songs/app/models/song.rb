class Song
  
  include Mongoid::Document
  include Mongoid::Timestamps
  extend Enumerize

  field :name,          type: String
  field :author,        type: String
  field :status,        type: String
  enumerize :status, in: [:published, :unpublished], default: :published, predicates: true


  validates_presence_of :name
  validates_presence_of :author

  scope :published, where(status: :published)
  
end