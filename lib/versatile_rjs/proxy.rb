
module VersatileRJS
  class Proxy
    attr_reader :page, :index_on_page, :statement
    private :page, :index_on_page, :statement

    autoload :ElementProxy, 'versatile_rjs/proxy/element_proxy'
    autoload :ElementSetProxy, 'versatile_rjs/proxy/element_set_proxy'
    autoload :VariableProxy, 'versatile_rjs/proxy/variable_proxy'
    autoload :ExpressionProxy, 'versatile_rjs/proxy/expression_proxy'
    autoload :BlockProxy, 'versatile_rjs/proxy/block_proxy'

    def initialize(page, statement, index_on_page = nil)
      @page = page
      @statement = statement
      @index_on_page =
        if index_on_page
          page.set_proxy_at(self, index_on_page)
        else
          page.add_proxy(self)
        end
    end

    def self.methods_to_implement(*method_names)
      method_names.map(&:to_sym).each do |m|
        define_method(m) do |*args|
          raise "This method must be implemented"
        end
      end
    end

    def replace(new_proxy)
      page.set_proxy_at(self, index_on_page)
    end
  end

end
