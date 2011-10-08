module VersatileRJS
  module TemplateHandler
    def self.call(template)
      page_procedure = "lambda{|page|" + template.source + "}"
      <<-EOF
      statement = lambda do |page|
#{template.source}
        page
      end.call(VersatileRJS::TemplateHandler.new(self)).to_script
      statement = "try{" + statement + "}catch(e){alert('" + escape_javascript(statement) + "');throw e;}" if Rails.env.development?
      statement
      EOF
    end
  end
end
