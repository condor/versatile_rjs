require 'versatile_rjs/proxy/element_proxy'

module VersatileRJS
  class Proxy
    module ElementByIdProxy
      include FrameworkDependent

      def self.included(base)
        base.class_eval do
          attr_accessor :id
        end
      end

      def initialize(page, id)
        self.id = id
        super(page, statement_for_id(id))
      end
    end
  end
end
