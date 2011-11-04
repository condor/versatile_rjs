module VersatileRJS
  class Proxy
    module Jquery
      class EachProxy < VersatileRJS::Proxy::EachProxy
        def initialize(page)
          super
          add_statement(ActiveSupport::JSON::Variable.new("var #{variable_name} = $(#{tmp_variable_name})"))
        end

        def tmp_variable_name
          @tmp_variable_name ||= "_tmp" + variable_name
        end

        def statement_prefix(statement)
          loop_variable_name = "_loop" + variable_name
          "$.each(function(#{loop_variable_name}, #{tmp_variable_name}){"
        end

        def statement_suffix(statement)
          "})"
        end
      end
    end
  end
end
