module VersatileRJS
  class Proxy
    module Selectable
      def select(locator)
        page.append_statement call(js_methods(:select), selector)
      end
    end
  end
end
