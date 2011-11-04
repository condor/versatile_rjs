require 'versatile_rjs/proxy/jquery/selectable'
require 'versatile_rjs/proxy/jquery/element_set'

module VersatileRJS
  class Proxy
    module Jquery
      class ElementSetProxy < ::VersatileRJS::Proxy::ElementSetProxy

        def invoke(method_name)
          page.append_statement call(method_name)
        end
      end
    end
  end
end
