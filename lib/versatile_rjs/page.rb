require 'versatile_rjs/container'

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
      proxy
    end

    def <<(expression)
      append_proxy VersatileRJS::Proxy.new(self, expression)
    end

    def [](id)
      append_proxy VersatileRJS::Proxy::ElementProxy.new_instance(self, id)
    end

    def select(selector)
      append_proxy VersatileRJS::Proxy::SelectorProxy.new_instance(self, selector)
    end

    def assign(variable, value)
      self << "var #{variable} = #{value.to_json}"
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

    def to_script(with_new_line = false)
      statement = proxies.map(&:to_json).join(";#{"\n" if with_new_line}") + ';'
      statement = "try{" + statement + "}catch(e){alert('" + view.__send__(:escape_javascript, statement) + "');throw e;}" if VersatileRJS.debug_rjs
      statement
    end

    private
    def render_on_view(*args_for_rendering)
      view.instance_eval{render *args_for_rendering}
    end
  end
end
