require 'versatile_rjs/proxy/jquery/element_set_proxy'

module VersatileRJS
  class Proxy
    module Jquery
      class SelectorProxy < ElementSetProxy
        include ::VersatileRJS::Proxy::SelectorProxy
        private
        def statement_for_selector(selector)
          "$('#{selector}')"
        end
      end
    end
  end
end
