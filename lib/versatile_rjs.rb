$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'versatile_rjs/page'
require 'versatile_rjs/proxy'
require 'versatile_rjs/template_handler'
require 'versatile_rjs/railtie'

module VersatileRJS
  VERSION = '0.1.0'

  class <<self
    attr_accessor :javascript_framework, :debug_rjs
    alias_method :debug_rjs?, :debug_rjs
  end

  def self.framework_module
    javascript_framework.to_s.camelcase
  end

  def self.implementation_class_of(mod)
    class_name_tree = mod.name.split('::')

    class_dirnames = class_name_tree[0...-1]
    class_basename = class_name_tree[-1]
    implementation_class_name = [class_dirnames, framework_module, class_basename].flatten.join('::')

    implementation_class_name.constantize
  end
end
