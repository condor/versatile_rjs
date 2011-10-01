
module VersatileRJS
  class Proxy
    autoload :ElementProxy, 'versatile_rjs/proxy/element_proxy'
    autoload :ElementSetProxy, 'versatile_rjs/proxy/element_set_proxy'
    autoload :VariableProxy, 'versatile_rjs/proxy/variable_proxy'
    autoload :LiteralProxy, 'versatile_rjs/proxy/literal_proxy'
    autoload :ExpressionProxy, 'versatile_rjs/proxy/expression_proxy'
  end
end
