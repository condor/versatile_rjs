module VersatileRJS
  class Page
    attr_reader :proxies
    private :proxies

    def initialize
      @proxies = []
    end

    def add_proxy(proxy)
      proxies << proxy
      proxies.size - 1
    end

    def set_proxy_at(proxy, index)
      proxy[index] = proxy
      index
    end

    def <<(expression)
      VersatileRJS::Proxy::ExpressionProxy.new(self, expression)
    end

    def [](id)
      VersatileRJS::Proxy::ElementProxy.new_instance(self, id)
    end

    def select(selector)
      VersatileRJS::Proxy::ElementSetProxy.new_instance(self, selector)
    end

    def assign(variable, value)
      self << "var #{variable} = #{value.to_json}")
    end

    def replace_html(id, *args)
      self[id].replace_html(*args)
    end

    def replace(id, *args)
      self[id].replace(*args)
    end

    def insert_html(id, *args)
      self[id].insert_html(*args)
    end

    def remove(id, *args)
      self[id].remove(*args)
    end
  end
end
