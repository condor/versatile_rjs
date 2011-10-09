
module VersatileRJS
  class Proxy
    attr_reader :page, :statement, :container
    private :page, :statement, :container

    attr_accessor :index, :container
    protected :index=

    autoload :ElementProxy, 'versatile_rjs/proxy/element_proxy'
    autoload :ElementSetProxy, 'versatile_rjs/proxy/element_set_proxy'
    autoload :SelectorProxy, 'versatile_rjs/proxy/selector_proxy'
    autoload :BlockProxy, 'versatile_rjs/proxy/block_proxy'
    autoload :FrameworkDependent, 'versatile_rjs/proxy/framework_dependent'
    autoload :Selectabl, 'versatile_rjs/proxy/selectable'

    def initialize(page, statement)
      @page = page
      @statement = statement
      append_to(page)
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

    def as_expression
      replace_with ::VersatileRJS::Proxy.new(page, statement)
    end

    private
    def append_to(container)
      self.index = container.next_index
      container.add_proxy(self)
    end

    def replace_with(another)
      another.index = index
      container.replace_on(index, another)
      another
    end
  end
end
