class BoardMessagesController < ApplicationController

  def index
    @board_message = BoardMessage.new
    @board_messages = BoardMessage.approved.paginate(:page => params[:page], :per_page => 12)
  end

  def create
    @board_message = BoardMessage.new(params[:board_message])
    if @board_message.save
      flash[:notice] = t('message_board.flashes.success_wait_moderation')
      redirect_to board_messages_path
    else
      @board_messages = BoardMessage.approved.paginate(:page => params[:page], :per_page => 12)
      render 'index'
    end
  end

  def show
    @board_message = BoardMessage.find(params[:id])
  end

end