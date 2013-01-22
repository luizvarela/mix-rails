module MixRailsMessageBoard
  class Engine < ::Rails::Engine
    
    def navigation
      if defined? Admix
        Admix::Navigation::NavBar.post_menu do
          Admix::Navigation::NavBar.find(:content) do |menu|
            menu.submenu do |submenu|
              submenu.key   = :message_board
              submenu.title = I18n.t 'message_board.message_board'
              submenu.url   = 'admix_board_messages_url'
            end
          end
        end
      end
    end

  end
end
