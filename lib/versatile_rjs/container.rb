require 'weakref'

module VersatileRJS
  module Container
    DELIMITER_WITH_NEW_LINE = ';\n'
    DELIMITER_WITHOUT_NEW_LINE = ';'

    def statements
      @statements ||= []
    end

    def add_statement(statement)
      statements << statement
    end

    def to_script(with_new_line = false)
      delimiter = with_new_line ? DELIMITER_WITH_NEW_LINE : DELIMITER_WITHOUT_NEW_LINE
      statement = statements.map(&:to_json).join(delimiter)
      statement += ';'
      statement_prefix(statement).to_s + statement + statement_suffix(statement).to_s
    end
  end
end
