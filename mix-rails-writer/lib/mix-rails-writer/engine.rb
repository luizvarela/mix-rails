module MixRailsWriter
  class Engine < ::Rails::Engine
    
    def navigation
      if defined? Admix
        Admix::Navigation::NavBar.post_menu do
          Admix::Navigation::NavBar.find(:content) do |menu|
            menu.submenu do |submenu|
              submenu.key   = :news
              submenu.title = I18n.t 'news.news'
              submenu.url   = 'admix_news_index_url'
            end
          end
        end
      end
    end

  end
end
