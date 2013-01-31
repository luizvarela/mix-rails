class Admix::RolesDatagrid

  include Datagrid
  extend AdmixHelper

  scope do
    Role.all
  end

  column :name, header: input_label(:role, :name)

  include Admix::TableActions

end
