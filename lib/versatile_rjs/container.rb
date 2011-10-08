module VersatileRJS
  module Container

    def next_index
      proxies.size
    end

    def add_proxy(proxy)
      proxies << proxy
    end

    def replace_on(index, new)
      proxies[index] = new
    end

    private
    def proxies
      @proxies ||= []
    end
  end
end
