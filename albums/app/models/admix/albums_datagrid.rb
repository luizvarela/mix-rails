class Admix::AlbumsDatagrid

  include Datagrid


  scope do
    Album.desc(:date)
  end

  filter :name, :string
  filter :date do |value|
    value.to_s(:created_at)
  end

  column :name, header: I18n.t('albums.name')
  column :date, header: I18n.t('albums.date') do |album|
    album.date.strftime("%d/%m/%Y") #album.date.to_s(:created_at)
  end
  column :photos_quantity, header: I18n.t('albums.photos_quantity') do |album|
    album.photos.count
  end

  column :published, header: I18n.t('albums.published') do |album|
    if album.published 
      I18n.t("albums.published_yes")
    else 
      I18n.t("albums.published_no")
    end
  end
  

  include Admix::TableActions

end