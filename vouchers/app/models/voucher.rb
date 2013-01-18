class Voucher
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  scope :actives, -> { where({:date_from.lte => Date.today, :date_to.gte => Date.today}) }

  field :name, type: String
  field :rules, type: Array
  field :date_from, type: Date
  field :date_to, type: Date
  mount_uploader :photo, Vouchers::PhotoUploader
  mount_uploader :partner_photo, Vouchers::PhotoUploader

  has_many :users, class_name: 'VoucherUser', dependent: :delete

  validates_presence_of :name, :rules, :photo

  slug :name, history: true do |voucher|
    voucher.name.parameterize
  end
end
