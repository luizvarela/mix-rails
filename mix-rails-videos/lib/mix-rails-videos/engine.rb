module MixRailsVideos
  class Engine < ::Rails::Engine
    def navigation
      if defined? Admix

        Admix::Navigation::NavBar.post_menu do
          Admix::Navigation::NavBar.find(:content) do |menu|
            menu.submenu do |submenu|
              submenu.key   = :videos
              submenu.title = I18n.t 'videos.videos'
              submenu.url   = 'admix_videos_url'
            end
          end
        end

      end
    end
  end
end
