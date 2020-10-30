require_relative 'file_reader.rb'

class CheckErrror
  attr_reader :checker, :errors

  def initialize(file_path)
    @checker = FileReader.new(file_path)
    @errors = []
  end
  #if you want to remove only leading and trailing whitespace (like PHP's trim) you can use .strip, but if you want to remove all whitespace, you can use .gsub(/\s+/, "") instead 
  def check_trailing_space #this means only at the end
    @checker.file.each_with_index do |element, line|
      if element[-1] == ' ' && !element.empty?
          @errors << "line: #{line +1}: Error: Trailing whitespace detected" 
      end 
    end
  end

  def check_space_after_colon 
    @checker.file.each_with_index do |element, line|
      if element.include?(':') 
        index_colon = element.index(':')
        unless element[index_colon + 1] == ' '
        @errors << "line: #{line + 1}: Error: Missing space after colon"
        end
      end 
    end
  end

  def check_space_before_open_bracket
    @checker.file.each_with_index do |element, line|
      if element.include?('{') 
        index_bracket = element.index('{')
        unless element[index_bracket - 1] == ' ' || index_bracket == 0
          @errors << "line: #{line + 1}: Error: Missing space before the bracket"
        end
      end 
    end
  end

  def check_before_comment
    @checker.file.each_with_index do |element, line|
      if element.include?('/*') 
        index_char = element.index('*')
        unless element[index_char + 1] == ' ' 
          @errors << "line: #{line + 1}: Error: Missing space before the comment"
        end
      end 
    end
  end

  def check_after_comment
    @checker.file.each_with_index do |element, line|
      if element.include?('*/') 
        element.slice!('/*') #the new string or result of the method, is gonna stored inside the element again
        index_comment = element.index('*')
        unless element[index_comment - 1] == ' ' || index_comment == 0
          @errors << "line: #{line + 1}: Error: Missing space after the comment"
        end
      end 
    end
  end
  #spaces around the comment 2 checks for the beggining for the comment and at the end
  #space befor open a bracket 
  #check if after a colon there is a space
  #method to chech a space at the end of semicolon and bracket

  # use the index method to get the specific character
end