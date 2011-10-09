require 'weakref'

module VersatileRJS
  module Container

    def add_proxy(proxy)
      proxies << proxy
      proxy.index = next_index
      relate_proxy(proxy)
    end

    def replace_on(index, proxy)
      proxies[index] = proxy
      proxy.index = index
      relate_proxy(proxy)
    end

    def proxies
      @proxies ||= []
    end

    private
    def next_index
      proxies.size
    end

    def relate_proxy(proxy)
      proxy.container = WeakRef.new(self)
      proxy
    end
  end
end
