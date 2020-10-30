require_relative 'file_reader.rb'

class CheckErrror
    attr_reader: @checker

    def initialize(file_path)
      @checker = FileReader.new(file_path)
      @errors = []
    end

    def check_trailing_space
        @checker.each_with_index do |element, line|
          if element[-1] == ' ' && !element.empty?
              @errors << "line: #{line +1}}: Error: Trailing whitespace detected"
          end
    end
end

#spaces around the comment 2 checks for the beggining for the comment and at the end
#space befor open a bracket 
#check if after a colon there is a space
#method to chech a space at the end of semicolon and bracket

use the index method to get the specific character