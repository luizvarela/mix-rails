class Admix::SettingsDatagrid

  include Datagrid

  scope do
    Setting.desc(:name)
  end

  filter :name, :string

  column :name, header: I18n.t('settings.fields.name')
  column :key, header: I18n.t('settings.fields.key')
  column :value, header: I18n.t('settings.fields.value')

  column :image, header: I18n.t('settings.fields.image'), html: true do |post|
    if post.image?
      image_tag post.image.url
    else
      "--"
    end
  end

  column :activated, header: I18n.t('settings.fields.activated')

  include Admix::TableActions

end
