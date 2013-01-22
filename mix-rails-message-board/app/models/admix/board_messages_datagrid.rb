class Admix::BoardMessagesDatagrid

  include Datagrid
  extend AdmixHelper

  scope do
    BoardMessage.desc(:date)
  end

  filter :date do |value|
    value.to_s(:created_at)
  end

  column :name, header: input_label(:board_message, :name)
  column :email, header: input_label(:board_message, :email)
  column :message, header: input_label(:board_message, :message)
  column :date, header: input_label(:board_message, :date) do |board_message|
    board_message.date.strftime("%d/%m/%Y")
  end

  column :replies_count, header: input_label(:board_message, :replies_count) do |board_message|
    board_message.board_replies.count
  end

  column :approved, header: input_label(:board_message, :approved) do |board_message|
    board_message.approved.text
  end

  include Admix::TableActions

end