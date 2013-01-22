module Admix
  class VideosDatagrid
    include Datagrid

    scope do
      Video.most_recent
    end

    column :thumb, header: I18n.t('videos.fields.thumb') do |video|
      ActionController::Base.helpers.image_tag(video.thumb)
    end

    column :title, header: I18n.t('videos.fields.title')

    column :published_at, header: I18n.t('videos.fields.published_at') do |video|
      video.published_at.strftime('%d/%m/%Y')
    end

    include Admix::TableActions
  end
end
