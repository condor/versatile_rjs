module VersatileRJS
  class Proxy
    module FrameworkDependent
      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
        def new_instance(*args)
          implementation_class.new(*args)
        end

        private
        def implementation_class
          @implementation_class ||= VersatileRJS.implementation_class_of(self)
        end

      end
    end
  end
end
