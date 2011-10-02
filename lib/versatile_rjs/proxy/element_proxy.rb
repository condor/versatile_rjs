module VersatileRJS
  class Proxy
    class ElementProxy < Proxy
      include FrameworkDependent

      attr_reader :id
      private :id

      def initialize(page, id)
        super(page)
        @id = id
      end

      def replace_html(*args)
    end
  end
end
