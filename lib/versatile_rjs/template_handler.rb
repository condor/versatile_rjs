module VersatileRJS
  class TemplateHandler
    def self.call(template)
      new.call(template)
    end

    def call(template)
      page_procedure = "lambda{|page|" + template.source + "}"
      script =<<-EOF
      statement = lambda{|page|#{template.source}
        page}.call(VersatileRJS::Page.new(self)).to_script(true)
      statement = "try{" + statement + "}catch(e){alert('" + escape_javascript(statement) + "');throw e;}" if VersatileRJS.debug_rjs
      statement
      EOF
      script
    end
  end
end
