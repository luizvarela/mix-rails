module MixRailsVouchers
  class Engine < ::Rails::Engine

    def navigation
      if defined? Admix

        Admix::Navigation::NavBar.post_menu do
          Admix::Navigation::NavBar.find(:content) do |menu|
            menu.submenu do |submenu|
              submenu.key   = :vouchers
              submenu.title = I18n.t 'vouchers.vouchers'
              submenu.url   = 'admix_vouchers_url'
            end
          end
        end

      end
    end

  end
end
