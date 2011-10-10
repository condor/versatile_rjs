require 'action_view/helpers/javascript_helper'

module ActionView::Helpers::JavaScriptHelper

  def button_to_function_with_block(name, function = nil, html_options={}, &block)
    function =
      _versatile_rjs_function_block_extraction(block) if block_given?
    button_to_function_without_block(name, function, html_options)
  end

  def link_to_function_with_block(name, function = nil, html_options={}, &block)
    function =
      _versatile_rjs_function_block_extraction(block) if block_given?
    link_to_function_without_block(name, function, html_options)
  end

  def _versatile_rjs_function_block_extraction(block)
    page = VersatileRJS::Page.new(self)
    block.call(page)
    page.to_script
  end

  alias_method_chain :button_to_function, :block
  alias_method_chain :link_to_function, :block
end
