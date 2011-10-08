$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'versatile_rjs/page'
require 'versatile_rjs/proxy'
require 'versatile_rjs/template_handler'

module VersatileRjs
  VERSION = '0.0.1'

  class <<self
    attr_accessor :javascript_framework
  end
  self.javascript_framework = :jquery
end
