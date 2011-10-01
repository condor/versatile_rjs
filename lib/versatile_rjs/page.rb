module VersatileRJS
  class Page
    def [](id)
      VersatileRJS::Proxy::ElementProxy.new(self, id)
    end

    def select(selector)
      VersatileRJS::Proxy::ElementSetProxy.new(self, selector)
    end
  end
end
