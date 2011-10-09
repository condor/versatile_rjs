require 'rails'

module VersatileRJS
  class Railtie < Rails::Railtie
    initializer "versatile_rjs.enable_debug_rjs", :before => "action_view.set_configs" do |app|
      ActiveSupport.on_load(:action_view) do
        class << ActionView::Base
          superclass_delegating_accessor :debug_rjs
          self.debug_rjs = false
        end
      end
    end
  end
end
