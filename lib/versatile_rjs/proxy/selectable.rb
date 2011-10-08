module VersatileRJS
  class Proxy
    module Selectable
      def self.included(base)
        base.class_eval do
          methods_to_implement :_select => "call the adequate JS method by using method :call, depending on the JS framework you decide to use, to get the descedent nodes of the element specified by me that are specified by the argument CSS selector."
        end
      end


      def select(locator)
        _select(locator)
        replace_with ElementSetProxy.new(page, statement)
      end
    end
  end
end
