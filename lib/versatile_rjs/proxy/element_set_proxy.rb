require 'versatile_rjs/proxy/selectable'

module VersatileRJS
  class Proxy
    class ElementSetProxy < Proxy
      include Selectable
      include FrameworkDependent

      method_to_implement :each => "call the adequate JS statement equivalent to the block given to apply the process to the items contained."

      def initialize(page, statement)
        super
      end
    end
  end
end
