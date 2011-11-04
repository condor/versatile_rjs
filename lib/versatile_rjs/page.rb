require 'versatile_rjs/container'

module VersatileRJS
  class Page

    include Container

    def method_missing(name, *args)
      if name.to_s =~ /=$/
        assign(name, args.first)
      else
        view.__send__ name, *args
      end
    end

    class ContainerStack < Array
      def peek
        self[-1]
      end
    end

    attr_reader :view, :stack
    private :stack

    def initialize(view)
      @view = view
      @stack = ContainerStack.new
      @stack.push self
    end

    def push_container(container)
      stack.push container
    end

    def pop_container
      stack.pop
    end

    def append_statement(statement)
      stack.peek.add_statement statement
      statement
    end

    def <<(statement)
      append_statement(ActiveSupport::JSON::Variable.new(statement))
    end

    def [](id)
      VersatileRJS::Proxy::ElementByIdProxy.new_instance(self, id)
    end

    def select(selector)
      VersatileRJS::Proxy::SelectorProxy.new_instance(self, selector)
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

    def evaluate(&block)
      view.instance_exec(self, &block)
      self
    end

    def execute_rendering(*args_for_rendering)
      return '' if args_for_rendering.size == 0
      return args_for_rendering.first if args_for_rendering.size == 1 &&
        args_for_rendering.first.kind_of?(String)
      return render_on_view(*args_for_rendering)
    end

    def statement_prefix(statement)
      "try{" if VersatileRJS.debug_rjs?
    end

    def statement_suffix(statement)
      if VersatileRJS.debug_rjs
        <<-EOS
        }catch(e){
          alert('RJS Error: ' + e);
          alert('#{view.__send__(:escape_javascript, statement)}');
          throw e;
        }
        EOS
      end
    end

    private
    def render_on_view(*args_for_rendering)
      view.instance_eval{render *args_for_rendering}
    end
  end
end
