class Admix::SongsDatagrid

  include Datagrid
  
  extend AdmixHelper

  scope do
    Song.desc(:date)
  end

  column :title, header: input_label(:songs, :title)
  column :author, header: input_label(:songs, :author)

  column :status, header: input_label(:songs, :status) do |record|
    record.status.text
  end

  include Admix::TableActions

end