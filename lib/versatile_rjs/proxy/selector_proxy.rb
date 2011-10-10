module VersatileRJS
  class Proxy
    class SelectorProxy < ElementSetProxy
      def initialize(page, selector)
        super(page, statement_by_selector(selector))
      end
    end
  end
end
