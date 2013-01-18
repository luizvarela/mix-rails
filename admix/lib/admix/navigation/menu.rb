module Admix
  module Navigation
    class Menu
      attr_accessor :url, :title, :key, :icon, :parent, :children, :can_render

      def initialize
        @children = []
      end

      def submenu
        submenu = Admix::Navigation::Menu.new
        submenu.parent = self

        yield submenu if block_given?

        @children << submenu
      end

    end
  end
end
