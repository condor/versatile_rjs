require 'rails'

class Rails::Application::Configuration
  def versatile_rjs
    @versatile_rjs ||= ActiveSupport::OrderedOptions.new
  end
end

module VersatileRJS
  class Railtie < Rails::Railtie

    initializer "versatile_rjs.enable_debug_rjs" do |app|
      VersatileRJS.debug_rjs = app.config.versatile_rjs.debug_rjs
    end

    initializer "versatile_rjs.register_template_handler" do |app|
      ActiveSupport.on_load(:action_view) do
        ActionView::Template.register_template_handler :rjs, VersatileRJS::TemplateHandler
      end
    end

    initializer "versatile_rjs.extend_link_and_button_to_function" do |app|
      ActiveSupport.on_load(:action_view) do
        require 'versatile_rjs/to_function_ext'
      end
    end

    initializer "versatile_rjs.setup_framework" do |app|
      VersatileRJS.javascript_framework = app.config.versatile_rjs.javascript_framework || VersatileRJS.default_javascript_framework
      VersatileRJS.require_framework
    end
  end
end
