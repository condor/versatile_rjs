module VersatileRJS
  class Proxy
    class Jquery
      class ElementByIdProxy < ElementProxy
        private
        def statement_for_id(id)
          "$('##{id}')"
        end
      end
    end
  end
end
