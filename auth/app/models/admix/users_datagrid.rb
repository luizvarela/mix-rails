class Admix::UsersDatagrid

  include Datagrid

  scope do
    User.desc(:email)
  end

  filter :email, :string
  filter :last_sign_in_at, :date

  column :email, header: I18n.t('users.fields.email')
  column :last_sign_in_at, header: I18n.t('users.fields.last_sign_in_at') do |user|
    user.last_sign_in_at.strftime('%d/%m/%Y as %H:%Mh')
  end

  include Admix::TableActions

end
