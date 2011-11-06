module VersatileRJS
  class Proxy
    module Jquery
      class ElementProxy < VersatileRJS::Proxy::ElementProxy
        def self.included(base)
          base.class_eval do
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
          end
          base.extend ClassMethods
        end

        module ClassMethods
          def js_methods(method, *args)
            case method
            when :insert_html
              METHODS[method][args.first]
            else
              METHODS[method]
            end
          end

          def args(method, *args)
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
end
