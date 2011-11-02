require 'versatile_rjs/proxy/framework_dependent'
require 'versatile_rjs/proxy/selectable'
require 'versatile_rjs/proxy/default_responder'

module VersatileRJS
  class Proxy
    class ElementByIdProxy < ElementProxy
      include FrameworkDependent
      include Selectable
      include DefaultResponder

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
