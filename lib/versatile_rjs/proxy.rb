
module VersatileRJS
  class Proxy
    attr_reader :page, :index_on_page
    private :page, :index_on_page

    autoload :ElementProxy, 'versatile_rjs/proxy/element_proxy'
    autoload :ElementSetProxy, 'versatile_rjs/proxy/element_set_proxy'
    autoload :VariableProxy, 'versatile_rjs/proxy/variable_proxy'
    autoload :ExpressionProxy, 'versatile_rjs/proxy/expression_proxy'
    autoload :BlockProxy, 'versatile_rjs/proxy/block_proxy'

    def initialize(page, index_on_page = nil)
      @page = page
      @index_on_page =
        if index_on_page
          page.set_proxy_at(self, index_on_page)
        else
          page.add_proxy(self)
        end
    end

    def replace(new_proxy)
      page.set_proxy_at(self, index_on_page)
    end
  end

end
