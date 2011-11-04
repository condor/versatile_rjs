module VersatileRJS
  class Proxy
    module Jquery
      class EachProxy < VersatileRJS::Proxy::EachProxy
        def statement_prefix(statement)
          loop_variable_name = "_loop" + variable_name
          "$.each(function(#{loop_variable_name}, #{variable_name}){"
        end

        def statement_suffix(statement)
          "})"
        end
      end
    end
  end
end
