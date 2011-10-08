
module VersatileRJS
  class Proxy
    attr_reader :page, :statement, :container
    private :page, :statement, :container

    attr_accessor :index, :container
    protected :index=, :container=

    autoload :ElementProxy, 'versatile_rjs/proxy/element_proxy'
    autoload :ElementSetProxy, 'versatile_rjs/proxy/element_set_proxy'
    autoload :VariableProxy, 'versatile_rjs/proxy/variable_proxy'
    autoload :ExpressionProxy, 'versatile_rjs/proxy/expression_proxy'
    autoload :BlockProxy, 'versatile_rjs/proxy/block_proxy'

    def initialize(page, statement)
      @page = page
      @statement = statement
      @page.append_proxy self
    end

    def self.methods_to_implement(method_names = {})
      method_names.keys.each do |m|
        define_method(m) do |*args|
          raise "This method must be implemented to #{method_names[m]}"
        end
      end
    end

    def call(method, *arguments)
      self.statement << ".#{method}(#{arguments.to_json.join(', ')})"
    end

    private
    def append_to(container)
      self.index = container.next_index
      container.add_proxy(self)
      self.container = WeakRef.new container
    end

    def replace_with(another)
      another.index = index
      container.replace_on(index, another)
      another.container = WeakRef.new container
    end
  end
end
