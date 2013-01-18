class MessageBoardMailer < AdmixMailer

  def message_replied(board_message)
    @board_message = board_message
    @url  = polymorphic_url(board_message)

    mail(to: board_message.email, subject: t('message_board.mailers.message_replied.subject'))
  end

end
