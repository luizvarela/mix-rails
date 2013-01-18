class Breadcrumbs
  module Render
    class List < Base # :nodoc: all
      def render
        options = {:class => "breadcrumb", :separator => "/"}.merge(default_options)

        tag(list_style, options) do
          html = ""
          items = breadcrumbs.items
          size = items.size

          items.each_with_index do |item, i|
            html << render_item(item, i, size, options)
          end


          html
        end
      end

      def list_style
        :ul
      end

      def render_item(item, i, size, opts)
        css    = "active" if i == size - 1
        length = breadcrumbs.items.length - 1

        text, url, options = *item

        # If the item is the last, doesn't wrap with <a>
        if i < length
          text = wrap_item(url, CGI.escapeHTML(text), options)
        else
          text = CGI.escapeHTML text
        end

        # If the item is not last, add divider
        if i < length
          text += tag(:span, opts[:separator], :class => "divider")
        end

        tag(:li, text, :class => css)
      end
    end
  end
end


# class Breadcrumbs
#   module Render
#     class List < Base # :nodoc: all
#       def render
#         options = {:class => "breadcrumbs", :separator => "&#187;"}.merge(default_options)

#         html = []
#         items = breadcrumbs.items
#         size = items.size

#         items.each_with_index do |item, i|
#           html << render_item(item, i, size)
#         end

#         separator = tag(:span, options[:separator], :class => "separator")

#         html.join(" #{separator} ")
#       end

#       def render_item(item, i, size)
#         text, url, options = *item
#         options[:class] ||= ""

#         css = []
#         css << "first" if i == 0
#         css << "last" if i == size - 1
#         css << "item-#{i}"

#         options[:class] << " #{css.join(" ")}"
#         options[:class].gsub!(/^ *(.*?)$/, '\\1')

#         wrap_item(url, CGI.escapeHTML(text), options)
#       end
#     end
#   end
# end
