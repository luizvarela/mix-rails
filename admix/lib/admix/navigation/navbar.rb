module Admix
  module Navigation
    class NavBar
      # Menus
      mattr_accessor :menus
      @@menus = Array.new
      # Menus Procs
      # are executed after default menus are added
      mattr_accessor :menus_procs
      @@menus_procs = Array.new

      def self.post_menu(&block)
        @@menus_procs << block
      end

      def self.insert_post_menus
        Rails.application.railties.engines.select do |e|
          if e.respond_to?(:navigation)
            e.navigation
          end
        end
        @@menus_procs.each do |proc|
          proc.call()
        end
      end

      def self.add(*menus)
        menus.each do |menu|
          self.add_menu menu
        end
      end

      def self.add_menu(menu)
        if menu.is_a? Admix::Navigation::Menu
          @@menus << menu
        end
      end

      def self.find(key)
        @@menus.each do |menu|
          submenu = self.deeply_find(key, menu)

          if submenu
            yield submenu
            return submenu
          elsif menu.key == key
            yield menu
            return menu
          end
        end
      end

      def self.deeply_find(key, menu)
        return false if menu.children.length == 0

        i = 0
        while i < menu.children.length do
          submenu = menu.children[i]
          self.deeply_find(key, submenu)

          return submenu if submenu.key == key

          i += 1
        end

        false
      end

      def self.all
        @@menus
      end

      def self.clear!
        @@menus  = []
        @@menus_procs  = []
      end


    end
  end
end
