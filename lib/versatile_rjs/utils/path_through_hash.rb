module VersatileRJS
  module Utils
    class PathThroughHash < Hash
      def initialize(hash = {})
        super(){|h, k|k}
        merge!(hash)
        freeze
      end
    end
  end
end
