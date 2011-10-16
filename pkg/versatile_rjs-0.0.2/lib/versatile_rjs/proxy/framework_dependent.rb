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
          @implementation_class ||= retrieve_implementation_class
        end

        def retrieve_implementation_class
          class_name_tree = name.split('::')

          class_dirnames = class_name_tree[0...-1]
          class_basename = class_name_tree[-1]
          framework_module = VersatileRJS.javascript_framework.to_s.camelcase
          implementation_class_name = [class_dirnames, framework_module, class_basename].flatten.join('::')

          require implementation_class_name.underscore
          implementation_class_name.constantize
        end
      end
    end
  end
end
