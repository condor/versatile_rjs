module VersatileRJS
  class Page

    include Container

    class ProxyStack < Array
      def peek
        self[-1]
      end
    end

    attr_reader :view, :stack
    private :stack

    def initialize(view)
      @view = view
      @stack = ProxyStack.new
      @stack.push self
    end

    def push_container(container)
      add_proxy container
      stack.push container
    end

    def pop_container
      stack.pop
    end

    def append_proxy(proxy)
      stack.peek.add_proxy proxy
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
      return '' if args_for_rendering.size == 0
      return args_for_rendering.first if args_for_rendering.size == 1 &&
        args_for_rendering.first.kind_of?(String)
      return render_on_view(*args_for_rendering)
    end

    private
    def render_on_view(*args_for_rendering)
      view.instance_eval{render *args_for_rendering}
    end
  end
end
