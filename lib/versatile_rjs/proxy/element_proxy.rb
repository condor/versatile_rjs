require 'versatile_rjs/proxy/framework_dependent'
require 'versatile_rjs/proxy/selectable'

module VersatileRJS
  class Proxy
    class ElementProxy < Proxy
      include FrameworkDependent
      include Selectable

      attr_reader :id
      private :id

      methods_to_implement :_replace_html => "call the adequate JS method by using method :call, depending on the JS framework you decide to use, to replace the innerHTML of the element that specified by me",
        :_replace => "call the adequate JS method by using method :call, depending on the JS framework you decide to use, to replace the whole of the element that specified by me",
        :_insert_html => "call the adequate JS method by using method :call, depending on the JS framework you decide to use, to insert the child element",
        :_remove => "call the adequate JS method by using method :call, depending on the JS framework you decide to use, to remove the element that specified by me",
        :_value= => "call the adequate JS method by using method :call, depending on the JS framework you decide to use, to set the value of the element specified by me",
        :_value => "call the adequate JS method by using method :call, depending on the JS framework you decide to use, to set the value of the element that specified by me",
        :_inner_html => "call the adequate JS method by using method :call, depending on the JS framework you decide to use, to get the content of the element that specified by me",
        :_show => "call the adequate JS method by using method :call, depending on the JS framework you decide to use, to show the element that specified by me",
        :_hide => "call the adequate JS method by using method :call, depending on the JS framework you decide to use, to hide the element that specified by me",
        :_toggle => "call the adequate JS method by using method :call, depending on the JS framework you decide to use, to change the visibility of the element that specified by me"

      def self.inherited(derived)
        derived.class_eval do
          def initialize(page, id)
            super(page, id, statement_by_id(id))
          end
        end
        derived.instance_eval{def inherited(*args);end}
      end

      def initialize(page, id, statement)
        super(page, statement)
        @id = id
      end

      def replace_html(*args)
        _replace_html(page.execute_rendering(*args))
        as_expression
      end

      def replace(*args)
        _replace(page.execute_rendering(*args))
        as_expression
      end

      def insert_html(position, *args)
        _insert_html(position, page.execute_rendering(*args))
        as_expression
      end

      def remove
        _remove
        as_expression
      end

      def value
        _value
        as_expression
      end

      def value=(value)
        self._value = value
        as_expression
      end

      def show
        _show
        as_expression
      end

      def hide
        _hide
        as_expression
      end

      def toggle
        _toggle
        as_expression
      end

      def inner_html=(html)
        replace_html(html)
      end

    end
  end
end
