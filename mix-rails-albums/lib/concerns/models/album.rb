module MixRailsAlbums::Concerns::Models::Album
  extend ActiveSupport::Concern

  included do

    include Mongoid::Document
    include Mongoid::Timestamps
    include Mongoid::Slug

    extend Enumerize

    field :title,         type: String
    field :description,   type: String
    field :date,          type: Date
    field :status,        type: String
    enumerize :status, in: [:published, :unpublished], default: :published, predicates: true

    validation_for_title
    validation_for_date

    slug :title, history: true do |current_object|
      current_object.title.parameterize
    end

    embeds_many :photos, cascade_callbacks: true
    
    scope :published, where(status: :published, :photos.ne => nil, :photos.exists => true)

  end

  module ClassMethods
    
    def validation_for_title
      validates_presence_of :title
    end

    def validation_for_date
      validates_presence_of :date
    end

  end

end