class Setting
  include Mongoid::Document

  field :name,      type: String
  field :key,       type: String
  field :value
  field :activated,  type: Boolean
  field :system,    type: Boolean, default: false

  validates_uniqueness_of :key

  mount_uploader :image, Settings::ImageUploader

  def self.app_title
    begin
      Setting.find_by(key: 'app_title', activated: true).value
    rescue
      false
    end
  end

  def self.app_email
    begin
      Setting.find_by(key: 'app_email', activated: true).value
    rescue
      false
    end
  end
  
  def self.admix_logo
    begin
      Setting.find_by(key: 'admix_logo', activated: true)
    rescue
      false
    end
  end

  def self.link_twitter
    begin
      Setting.find_by(key: 'link_twitter', activated: true).value
    rescue
      false
    end
  end

  def self.link_facebook
    begin
      Setting.find_by(key: 'link_facebook', activated: true).value
    rescue
      false
    end
  end

  def self.albums_watermark
    begin
      Setting.find_by(key: 'albums_watermark', activated: true)
    rescue
      false
    end
  end

  def self.albums_title
    begin
      Setting.find_by(key: 'albums_title', activated: true).value
    rescue
      false
    end
  end

end
