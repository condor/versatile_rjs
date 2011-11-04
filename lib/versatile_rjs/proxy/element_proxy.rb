require 'versatile_rjs/proxy/framework_dependent'
require 'versatile_rjs/proxy/selectable'
require 'versatile_rjs/proxy/default_responder'

module VersatileRJS
  class Proxy
    class ElementProxy < Proxy
      include FrameworkDependent
      include Selectable

      def replace_html(*args)
        page.append_statement call(js_methods[:replace_html], page.execute_rendering(*args))
      end

      def replace(*args)
        page.append_statement call(js_methods[:replace], page.execute_rendering(*args))
      end

      def insert_html(position, *args)
        page.append_statement call(js_methods[:insert_html][position], self.args[:insert_html][position])
      end

      def remove
        page.append_statement call(js_methods[:remove])
      end

      def value
        call(js_methods[:value])
      end

      def value=(value)
        page.append_statement call(js_methods[:value=], value)
      end

      def show
        page.append_statement call(js_methods[:show])
      end

      def hide
        page.append_statement call(js_methods[:hide])
      end

      def toggle
        page.append_statement call(js_methods[:toggle])
      end

      def inner_html=(html)
        replace_html(html)
      end

      def js_methods
        self.class.js_methods
      end

    end
  end
end
