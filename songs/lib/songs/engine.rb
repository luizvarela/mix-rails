module Songs
  class Engine < ::Rails::Engine
    
    def navigation
      if defined? Admix
        Admix::Navigation::NavBar.post_menu do
          Admix::Navigation::NavBar.find(:content) do |menu|
            menu.submenu do |submenu|
              submenu.key   = :songs
              submenu.title = I18n.t 'songs.songs'
              submenu.url   = 'admix_songs_url'
            end
          end
        end
      end
    end

  end
end
