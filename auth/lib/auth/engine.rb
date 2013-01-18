module Auth
  class Engine < ::Rails::Engine
    puts "==================================="
    puts "auth"
    puts "==================================="
    def navigation
      if defined? Admix
        Admix::Navigation::NavBar.post_menu do
          Admix::Navigation::NavBar.find(:general) do |menu|
            menu.submenu do |submenu|
              submenu.key   = :users
              submenu.title = I18n.t 'users.users'
              submenu.url   = 'admix_users_url'

              submenu.instance_eval do
                def can_render?(current_user)
                  current_user.is?(:admin)  
                end
              end

            end
          end
        end
      end
    end

  end
end
