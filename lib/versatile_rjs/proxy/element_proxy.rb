module VersatileRJS
  class Proxy
    class ElementProxy < Proxy
      include FrameworkDepedent

      attr_reader :id
      private :id

      methods_to_implement :_replace_html => "return the adequate statement, depending on the JS framework you decide to use, to replace the innerHTML of the element that specified by me",
        :_replace => "return the adequate statement, depending on the JS framework you decide to use, to replace the whole of the element that specified by me",
        :_insert_htm => "return the adequate statement, depending on the JS framework you decide to use, to insert the child element",
        :remove => "return the adequate statement, depending on the JS framework you decide to use, to remove the element that specified by me",
        :value= => "return the adequate statement, depending on the JS framework you decide to use, to set the value of the element specified by me",
        :value => "return the adequate statement, depending on the JS framework you decide to use, to set the value of the element that specified by me",
        :inner_html => "return the adequate statement, depending on the JS framework you decide to use, to get the content of the element that specified by me",
        :select => "return the adequate statement, depending on the JS framework you decide to use, to get the descedent nodes of the element specified by me that are specified by the argument CSS selector."

      def initialize(page, id, statement)
        super(page, statement)
        @id = id
      end

      def replace_html(*args)
        _replace_html(page.execute_rendering(*args))
        nil
      end

      def replace(*args)
        _replace(page.execute_rendering(*args))
        nil
      end

      def insert_html(position, *args)
        _insert_html(position, page.execute_rendering(*args))
        nil
      end

      def inner_html=(html)
        replace(html)
      end

      def select(locator)
        
      end
    end
  end
end
