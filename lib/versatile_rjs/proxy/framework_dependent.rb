module VersatileRJS
  class Proxy
    module FrameworkDependent
      def self.included(base)
        base.instance_eval do
          attr_accessor :implementation_class

          def self.new_insance(*args)
            implementation_class.new(*args)
          end

          class <<self
            alias_method :new, :new_instance
          end
        end

        class_name_tree = base.name.split('::')

        class_dirnames = class_name_tree[0...-1]
        class_basename = class_name_tree[-1]

        implementation_class_name = [class_dirnames, VersatileRJS.framework.to_s.downcase.split('_').map{|s|s.gsub(/^[a-z]/, &:upcase)}, class_basename].flatten.join('::')
        base.implementation_class = implementation_class_name.constantize
      end
    end
  end
end
