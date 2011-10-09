
module VersatileRJS
  class Proxy
    attr_reader :page, :statement, :container
    attr_accessor :index, :container
    private :page, :statement, :container, :index

    autoload :ElementProxy, 'versatile_rjs/proxy/element_proxy'
    autoload :ElementSetProxy, 'versatile_rjs/proxy/element_set_proxy'
    autoload :SelectorProxy, 'versatile_rjs/proxy/selector_proxy'
    autoload :BlockProxy, 'versatile_rjs/proxy/block_proxy'
    autoload :FrameworkDependent, 'versatile_rjs/proxy/framework_dependent'
    autoload :Selectabl, 'versatile_rjs/proxy/selectable'

    def initialize(page, statement)
      @page = page
      @statement = statement
    end

    def self.methods_to_implement(method_names = {})
      method_names.keys.each do |m|
        define_method(m) do |*args|
          raise "This method must be implemented to #{method_names[m]}"
        end
      end
    end

    def call(method, *arguments)
      statement << ".#{method}(#{arguments.map(&:to_json).join(', ')})"
    end

    def to_json
      ActiveSupport::JSON::Variable.new(statement)
    end

    alias_method :to_s, :to_json

    def as_expression
      replace_with ::VersatileRJS::Proxy.new(page, statement)
    end

    private
    def replace_with(another)
      container.replace_on(index, another)
      another
    end
  end
end
