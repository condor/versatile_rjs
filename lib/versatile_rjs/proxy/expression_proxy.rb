module VersatileRJS
  class Proxy
    class ExpressionProxy
      attr_reader :expression
      private :expression

      alias_method :to_s, :expression

      def initialize(page, expression)
        super(page)
        @expression = expression
      end
    end
  end
end
