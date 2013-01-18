module Settings
  class Engine < ::Rails::Engine
    
    initializer "settings.default_settings" do |app|

      config = app.config
      #config.action_dispatch.x_frame_options = 'SAMEORIGIN, GOFORIT'
      

      config.time_zone = 'Brasilia'
      config.i18n.available_locales = ['pt-BR', :en]

      config.action_mailer.delivery_method = :smtp

      config.action_mailer.smtp_settings = {
          :address              => "smtp.gmail.com",
          :port                 => 587,
          :domain               => "mixinternet.com.br",
          :user_name            => "noreply@mixinternet.com.br",
          :password             => "15963211",
          :authentication       => 'plain',
          :enable_starttls_auto => true  
      }

      config.action_mailer.perform_deliveries = true
      config.action_mailer.raise_delivery_errors = true
      
    end

    def navigation
      if defined? Admix
        Admix::Navigation::NavBar.post_menu do
          Admix::Navigation::NavBar.find(:general) do |menu|
            menu.submenu do |submenu|
              submenu.key   = :settings
              submenu.title = I18n.t 'settings.settings'
              submenu.url   = 'admix_settings_url'
              
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
