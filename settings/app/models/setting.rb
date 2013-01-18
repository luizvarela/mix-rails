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
      Setting.find_by(key: 'app_title').value
    rescue
      false
    end
  end

  def self.app_email
    begin
      Setting.find_by(key: 'app_email').value
    rescue
      false
    end
  end
  
  def self.admix_logo
    begin
      Setting.find_by(key: 'admix_logo')
    rescue
      false
    end
  end

  def self.link_twitter
    begin
      Setting.find_by(key: 'link_twitter').value
    rescue
      false
    end
  end

  def self.link_facebook
    begin
      Setting.find_by(key: 'link_facebook').value
    rescue
      false
    end
  end

end
