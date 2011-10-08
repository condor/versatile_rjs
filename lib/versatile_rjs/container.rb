module VersatileRJS
  module Container

    def add_proxy(proxy)
      proxy.index = proxies.size
      proxies << proxy
    end

    def replace_proxy(prev, new)
      new.index = prev.index
      proxies[prev.index] = new
    end

    private
    def proxies
      @proxies ||= []
    end
  end
end
