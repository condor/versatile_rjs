module VersatileRJS
  class Proxy
    class EachProxy < Proxy

      attr_reader :variable_name

      include Container

      def initialize(page)
        super(page, nil)
        self.variable_name = "_v#{next_variable_count}"
      end

      def each
        page.push_container(self)
        element = ElementProxy.new_instance(page, variable_name)
        begin
          yield element
          page.append_statement statement
        ensure
          page.pop_container
        end
      end

      def statement
      end

      def statement_prefix(statement);end
      def statement_suffix(statement);end

      def next_variable_count
        count = Thread.current[:__versatile_rjs_each_var_counter] || -1
        Thread.current[:__versatile_rjs_each_var_counter] += 1
      end
    end
  end
end
