module VersatileRJS
  class Proxy
    module Jquery
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

        def self.js_methods(method, *args)
          case method
          when :insert_html
            METHODS[method][args.first]
          else
            METHODS[method]
          end
        end

        def self.args(method, *args)
          case method
          when :insert_html
            args.second
          else
            args
          end
        end
      end
    end
  end
end
