$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module VersatileRjs
  VERSION = '0.0.1'

  attr_accessor :javascript_framework
end