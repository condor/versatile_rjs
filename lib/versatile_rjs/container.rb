module VersatileRJS
  module Container

    def next_index
      proxies.size
    end

    def add_proxy(proxy)
      proxies << proxy
      relate_proxy(proxy)
    end

    def replace_on(index, new)
      proxies[index] = new
      relate_proxy(new)
    end

    def proxies
      @proxies ||= []
    end

    private
    def relate_proxy(proxy)
      proxy.container = self
    end
  end
end
