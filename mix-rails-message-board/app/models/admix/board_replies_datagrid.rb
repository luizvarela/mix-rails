class Admix::BoardRepliesDatagrid

  include Datagrid

  extend AdmixHelper


  scope do
    BoardReply
  end

  filter :date do |value|
    value.to_s(:created_at)
  end

  column :name, header: input_label(:board_reply, :name)
  column :email, header: input_label(:board_reply, :email)
  column :message, header: input_label(:board_reply, :message)
  column :date, header: input_label(:board_reply, :date) do |board_reply|
    board_reply.date.strftime("%d/%m/%Y")
  end

  column :approved, header: input_label(:board_reply, :approved) do |board_reply|
    board_reply.approved.text
  end

  include Admix::TableActions

end