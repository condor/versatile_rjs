module VersatileRJS
  class Proxy
    class Jquery
      class ElementProxy < VersatileRJS::Proxy::ElementProxy
        private
        def statement_by_id(id)
          "$('##{id}')"
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

        def _remove
          call :remove
        end

        def _value=(value)
          call :val, value
        end

        def _value
          call :val
        end

        def _inner_html
          call :html
        end

        def _remove
          call :remove
        end

        def _show
          call :show
        end

        def _hide
          call :hide
        end

        def _toggle
          call :toggle
        end

        def _select(selector)
          call :find, selector
        end
      end
    end
  end
end
