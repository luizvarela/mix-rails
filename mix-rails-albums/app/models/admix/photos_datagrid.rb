class Admix::PhotosDatagrid

  include Datagrid

  scope do
    Photo.desc(:date)
  end

  filter :name, :string
  filter :date, :date

  column :name 
  column :date
  
end