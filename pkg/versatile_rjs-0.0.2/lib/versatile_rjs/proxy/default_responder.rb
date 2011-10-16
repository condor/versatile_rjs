module VersatileRJS
  class Proxy
    module DefaultResponder
      def method_missing(name, *args)
        if name.to_s =~ /=$/
          assign(name, args.first)
        else
          call(name, *args)
        end
      end
    end
  end
end
