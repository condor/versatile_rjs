require 'versatile_rjs/proxy/jquery/selectable'
require 'versatile_rjs/proxy/jquery/element_set'

module VersatileRJS
  class Proxy
    module Jquery
      class ElementSetProxy < ::VersatileRJS::Proxy::ElementSetProxy
        include Selectable
        include ElementSet
      end
    end
  end
end
