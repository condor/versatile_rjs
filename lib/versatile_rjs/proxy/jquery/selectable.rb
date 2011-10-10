module VersatileRJS
  class Proxy
    module Jquery
      module Selectable
        private
        def _select(locator)
          call :find, locator
        end
      end
    end
  end
end
