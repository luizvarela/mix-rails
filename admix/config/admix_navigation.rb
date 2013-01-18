# Default menus

# Clear menus
# TODO don't let add repeated menu keys
Admix::Navigation::NavBar.clear!

# Dashboard
dashboard = Admix::Navigation::Menu.new
dashboard.key   = :dashboard
dashboard.title = t 'dashboard.dashboard'
dashboard.url   = admix_root_url
dashboard.icon  = 'icon-flag'

# General
general = Admix::Navigation::Menu.new
general.key   = :general
general.title = t 'general.general'
general.url   = 'javascript:;'
general.icon  = 'icon-flag'

# Content
content = Admix::Navigation::Menu.new
content.key   = :content
content.title = t 'content.content'
content.url   = 'javascript:;'
content.icon  = 'icon-flag'

Admix::Navigation::NavBar.add dashboard, general, content

Admix::Navigation::NavBar.insert_post_menus

# Add menus in navigation bar
SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.dom_class = 'nav'

    Admix::Navigation::NavBar.all.each do |menu|
      key = ('menu_' + menu.key.to_s).to_sym
      # Primary menus
      if menu.children.length > 0
        primary.item key, menu.title, menu.url do |sec|
          menu.children.each do |submenu|
            if submenu.respond_to?(:can_render?)
              if submenu.can_render?(current_user)
                sec.item submenu.key, submenu.title, send(submenu.url)  
              end
            else
              sec.item submenu.key, submenu.title, send(submenu.url)
            end
          end
        end
      else
        primary.item key, menu.title, menu.url
      end
    end

  end
end


