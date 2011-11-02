require 'versatile_rjs/proxy/element_proxy'

module VersatileRJS
  class Proxy
    class ElementByIdProxy < ElementProxy

      attr_reader :id

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
    end
  end
end
