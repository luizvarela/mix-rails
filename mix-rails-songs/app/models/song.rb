class Song
  
  include Mongoid::Document
  include Mongoid::Timestamps
  extend Enumerize

  field :title,         type: String
  field :author,        type: String
  field :status,        type: String
  enumerize :status, in: [:published, :unpublished], default: :published, predicates: true

  mount_uploader :mp3, Songs::SongUploader

  validates_presence_of :title
  validates_presence_of :author

  scope :published, where(status: :published)
  
end