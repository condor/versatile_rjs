require 'versatile_rjs/proxy/jquery/selectable'
require 'versatile_rjs/proxy/jquery/element_set'

module VersatileRJS
  class Proxy
    module Jquery
      class SelectorProxy < ::VersatileRJS::Proxy::SelectorProxy
        include Selectable
        include ElementSet
        private
        def statement_by_selector(selector)
          "$('#{selector}')"
        end
      end
    end
  end
end
