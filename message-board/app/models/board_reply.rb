class BoardReply
  
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia

  extend Enumerize

  field :name,          type: String, default: -> { Setting.app_title }
  field :email,         type: String, default: -> { Setting.app_email }
  field :message,       type: String
  field :date,          type: DateTime, default: -> { Time.now }
  field :approved,      type: String
  enumerize :approved, in: [:pending, :approved, :disapproved], default: :approved, predicates: true
  

  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :date

  validates :email, email: true

  scope :approved, where(approved: :approved)
  scope :pending, where(approved: :pending)

  embedded_in :board_message

end