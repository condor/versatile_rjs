module VersatileRJS
  class TemplateHandler
    def self.call(template)
      new.call(template)
    end

    def call(template)
      "VersatileRJS::Page.new(self).evaluate{|page|#{template.source}}.to_script(true)"
    end
  end
end
