module VersatileRJS
  class TemplateHandler
    def self.call(template)
      new.call(template)
    end

    def call(template)
      page_procedure = "lambda{|page|" + template.source + "}"
      "lambda{|page|#{template.source};page}.call(VersatileRJS::Page.new(self)).to_script(true)"
    end
  end
end
