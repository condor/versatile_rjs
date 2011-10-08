
module VersatileRJS
  class Proxy
    attr_reader :page, :index, :statement, :container
    private :page, :index, :statement, :container

    autoload :ElementProxy, 'versatile_rjs/proxy/element_proxy'
    autoload :ElementSetProxy, 'versatile_rjs/proxy/element_set_proxy'
    autoload :VariableProxy, 'versatile_rjs/proxy/variable_proxy'
    autoload :ExpressionProxy, 'versatile_rjs/proxy/expression_proxy'
    autoload :BlockProxy, 'versatile_rjs/proxy/block_proxy'

    def initialize(page, statement, index = nil)
      @page = page
      @statement = statement
      @index =
        if index
          page.set_proxy_at(self, index)
        else
          page.add_proxy(self)
        end
    end

    def self.methods_to_implement(method_names = {})
      method_names.keys.each do |m|
        define_method(m) do |*args|
          raise "This method must be implemented to #{method_names[m]}"
        end
      end
    end

  end
end
