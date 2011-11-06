module VersatileRJS
  class Proxy
    module Jquery
      class ElementByIdProxy < ElementProxy
        private
        def statement_for_id(id)
          "$('##{id}')"
        end
      end
    end
  end
end
