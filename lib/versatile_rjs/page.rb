module VersatileRJS
  class Page
    attr_reader :proxies, :view
    private :proxies

    def initialize(view)
      @proxies = []
      @view = view
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
      VersatileRJS::Proxy::ElementProxy.new(self, id)
    end

    def select(selector)
      VersatileRJS::Proxy::ElementSetProxy.new(self, selector)
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

    def execute_rendering(*args_for_rendering)
      return args_for_rendering.first if args_for_rendering.size == 0 &&
        args_for_rendering.first.kind_of?(String)
      return render_on_view(*args_for_rendering)
    end

    private
    def render_on_view(*args_for_rendering)
      view.instance_eval{capture{render *args_for_rendering}}
    end
  end
end
