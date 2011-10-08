require 'versatile_rjs/proxy/selectable'

module VersatileRJS
  class Proxy
    class ElementSetProxy < Proxy
      include Selectable

      def initialize(page, statement)
        super
      end
    end
  end
end
