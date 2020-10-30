require_relative 'file_reader.rb'

class CheckErrror
    attr_reader: @checker

    def initialize(file_path)
      @checker = FileReader.new(file_path)
      @errors = []
    end

    def check_trailing_space
        @checker.each_with_index do |element, line|
                if element[-2] == '' && !element.empty?
                    @errors << "line: #{element +1}: #{line.size -1}: Error: Trailing whitespace detected"
                end
    end
end
