module VersatileRJS
  class Proxy
    class Jquery
      class ElementProxy < VersatileRJS::Proxy::ElementProxy
        def initialize(page, id)
          super(page, id, "$('##{id}')")
        end

        def _replace_html(content)
          call :html, content
        end

        def _replace(content)
          call :replaceWith, content
        end

        def _insert_html(position, content)
          case position
          when :top
            call :prepend, content
          when :bottom
            call :append, content
          end
        end

        def value=(value)
          call :val, value
        end

        def value
          call :val
        end

        def inner_html
          call :html
        end
      end
    end
  end
end
