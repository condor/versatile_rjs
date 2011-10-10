require 'rails'

module VersatileRJS
  class Railtie < Rails::Railtie
    config.versatile_rjs = ActiveSupport::OrderedOptions.new

    initializer "versatile_rjs.enable_debug_rjs" do |app|
      VersatileRJS.javascript_framework = app.config.versatile_rjs.javascript_framework || :jquery
      VersatileRJS.debug_rjs = app.config.versatile_rjs.debug_rjs
    end

    initialier "versatile_rjs.register_template_handler" do |app|
      ActiveSupport.on_load(:action_view) do
        ActionView::Template.register_template_handler :rjs, VersatileRJS::TemplateHandler
      end
    end
  end
end
