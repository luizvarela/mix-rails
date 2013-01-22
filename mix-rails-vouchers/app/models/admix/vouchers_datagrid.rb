class Admix::VouchersDatagrid
  include Datagrid

  scope do
    Voucher.all
  end
  column :name, header: I18n.t('vouchers.fields.name')

  column :date_from, header: I18n.t('vouchers.fields.date_from') do |voucher|
    voucher.date_from.strftime('%d/%m/%Y')
  end

  column :date_to, header: I18n.t('vouchers.fields.date_to') do |voucher|
    voucher.date_to.strftime('%d/%m/%Y')
  end

  include Admix::TableActions
end
