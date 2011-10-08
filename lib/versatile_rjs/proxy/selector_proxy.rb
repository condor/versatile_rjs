module VersatileRJS
  class Proxy
    class SelectorProxy < ElementSetProxy
      def initialize(page, selector)
        super(page, selector_as_statement)
      end
    end
  end
end
