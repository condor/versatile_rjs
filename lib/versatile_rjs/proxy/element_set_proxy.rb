require 'versatile_rjs/proxy/selectable'

module VersatileRJS
  class Proxy
    class ElementSetProxy < Proxy
      include Selectable
      include FrameworkDependent

      def initialize(page, statement)
        super
      end

      def each(&block)
        EachProxy.new_instance(page).each(&block)
      end

      def invoke(method_name)
        raise NotImplementedError, "invoke must be implemented in each class."
      end
    end
  end
end
