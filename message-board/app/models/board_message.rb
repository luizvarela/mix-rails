class BoardMessage
  
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia

  extend Enumerize

  field :name,          type: String
  field :email,         type: String
  field :message,       type: String
  field :date,          type: DateTime, default: -> { Time.now }
  field :approved,      type: String
  enumerize :approved, in: [:pending, :approved, :disapproved], default: :pending, predicates: true


  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :message
  validates_presence_of :date

  validates :email, email: true

  scope :approved, where(approved: :approved)
  scope :pending, where(approved: :pending)

  embeds_many :board_replies, cascade_callbacks: true

end
