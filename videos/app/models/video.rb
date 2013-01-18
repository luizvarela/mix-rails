class Video
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  scope :most_recent, order_by(published_at: -1, name: 1)

  field :url, type: String
  field :title, type: String
  field :description, type: String
  field :title, type: String
  field :likes, type: Integer
  field :dislikes, type: Integer
  field :views, type: Integer
  field :youtube_code, type: String
  field :published_at, type: Time
  field :seconds, type: Integer
  field :category, type: String
  field :active, type: Boolean, default: true

  validates :url, presence: true, youtube: true

  slug :title, history: true do |video|
    video.title.parameterize
  end

  after_validation :insert_youtube_data

  def insert_youtube_data
    if self.errors.blank?
      yt_code = self.extract_youtube_code

      video = Youtube::Video.find(scope: yt_code, params: {v: '2'})
      video = video.entry.first

      self.title        = video.title
      self.description  = video.group.description
      self.seconds      = video.group.duration.seconds
      self.views        = video.statistics.viewCount
      self.likes        = video.rating.last.numLikes
      self.dislikes     = video.rating.last.numDislikes
      self.published_at = video.published.to_time
      self.youtube_code = yt_code
      self.category     = video.group.category
    end
  end

  # Atualmente validando URLs nos formatos:
  # http://www.youtube.com/watch?v=9bZkp7q19f0
  # TODO adicionar formato http://youtu.be/9bZkp7q19f0
  def extract_youtube_code
    url = self.url

    url = URI(url)
    query = CGI.parse(url.query)
    query['v'].first
  end

  def iframe(params = {})
    defaults = {
      width: '100%',
      height: '400'
    }
    params = defaults.merge(params)
    "<iframe width='#{params[:width]}' height='#{params[:height]}' src='http://www.youtube-nocookie.com/embed/#{self.youtube_code}?rel=0' frameborder='0' allowfullscreen></iframe>"
  end

  def thumb(type = :p)
    thumbs = {
      # 120x90
      p: 'http://i.ytimg.com/vi/:code/default.jpg',
      # 320x180
      m: 'http://i.ytimg.com/vi/:code/mqdefault.jpg',
      # 480x360
      g: 'http://i.ytimg.com/vi/:code/hqdefault.jpg',
      # 640x480
      gg: 'http://i.ytimg.com/vi/:code/sddefault.jpg'
    }

    thumbs[type].sub(':code', self.youtube_code)
  end

end
