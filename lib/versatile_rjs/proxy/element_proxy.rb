module VersatileRJS
  class Proxy
    class ElementProxy < Proxy
      include FrameworkDependent

      attr_reader :id
      private :id

      methods_to_implement :_replace_html, :_replace,
        :_insert_html, :remove, :value=, :value, :inner_html,
        :select

      def initialize(page, id, statement)
        super(page, statement)
        @id = id
      end

      def replace_html(*args)
        _replace_html(page.execute_rendering(*args))
      end

      def replace(*args)
        _replace(page.execute_rendering(*args))
      end

      def insert_html(position, *args)
        _insert_html(position, page.execute_rendering(*args))
      end

      def inner_html=(html)
        replace(html)
      end
    end
  end
end
