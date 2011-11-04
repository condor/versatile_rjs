module VersatileRJS
  class Proxy
    module SelectorProxy
      include FrameworkDependent

      def self.included(base)
        base.class_eval do
          attr_accessor :selector
        end
      end

      def initialize(page, selector)
        super(page, statement_for_selector(selector))
      end
    end
  end
end
