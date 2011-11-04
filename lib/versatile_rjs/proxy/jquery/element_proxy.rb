module VersatileRJS
  class Proxy
    class Jquery
      class ElementProxy < VersatileRJS::Proxy::ElementProxy
        METHODS = {
          :replace_html => :html,
          :replace => :replaceWith,
          :insert_html => {
            :top => :prepend,
            :bottom => :append
          },
          :value => :val,
          :value= => :val,
          :select => :find
        }.freeze

        class <<self
          attr_reader :js_methods
        end
        @js_methods =
          VersatileRJS::Utils::PathThroughHash.new(METHODS)

      end
    end
  end
end
