class Admix::AlbumsDatagrid

  include Datagrid

  extend AdmixHelper


  scope do
    Album.desc(:date)
  end

  filter :title, :string
  filter :date do |value|
    value.to_s(:created_at)
  end

  column :title, header: input_label(:albums, :title)
  column :date, header: input_label(:albums, :date) do |album|
    album.date.strftime("%d/%m/%Y") #album.date.to_s(:created_at)
  end
  column :photos_quantity, header: input_label(:albums, :photos_quantity) do |album|
    album.photos.count
  end

  column :published, header: input_label(:albums, :status) do |album|
    album.status.text
  end
  

  include Admix::TableActions

end