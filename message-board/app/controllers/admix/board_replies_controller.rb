class Admix::BoardRepliesController < Admix::InheritedController

  polymorphic_belongs_to :board_message, param: :board_message_id

  after_filter :message_replied, only: [:create]

  def message_replied
    if resource.errors.empty?
        MessageBoardMailer.message_replied(parent).deliver
    end
  end

  def report
    datagrid = @datagrid_class.new(params[:guess_datagrid_params])
    datagrid.scope do
      parent.board_replies
    end
    datagrid
  end

end