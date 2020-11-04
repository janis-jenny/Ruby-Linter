# rubocop:disable Layout/LineLength

require 'colorize'
require_relative 'file_reader'

class CheckErrror
  attr_reader :errors

  def initialize(file_path)
    @checker = FileReader.new(file_path)
    @errors = []
    @file_name = file_path
  end

  def check_trailing_space
    @checker.file.each_with_index do |element, line|
      next unless element[-1] == ' ' && !element.empty?

      @errors << "#{@file_name.colorize(:magenta)} line: #{(line + 1).to_s.colorize(:blue)} : Error: Trailing whitespace detected"
      return true
    end
    false
  end

  def check_space_after_colon
    @checker.file.each_with_index do |element, line|
      next unless element.include?(':')

      index_colon = element.index(':')
      unless element[index_colon + 1] == ' '
        @errors << "#{@file_name.colorize(:magenta)} line: #{(line + 1).to_s.colorize(:blue)}: Error: Missing space after colon"
      end
      return true
    end
    false
  end

  def check_space_before_open_bracket
    @checker.file.each_with_index do |element, line|
      next unless element.include?('{')

      index_bracket = element.index('{')
      unless element[index_bracket - 1] == ' ' || index_bracket.zero?
        @errors << "#{@file_name.colorize(:magenta)} line: #{(line + 1).to_s.colorize(:blue)}: Error: Missing space before the bracket"
      end
      return true
    end
    false
  end

  def check_before_comment
    @checker.file.each_with_index do |element, line|
      next unless element.include?('/*')

      index_char = element.index('*')
      unless element[index_char + 1] == ' '
        @errors << "#{@file_name.colorize(:magenta)} line: #{(line + 1).to_s.colorize(:blue)}: Error: Missing space before the comment"
      end
      return true
    end
    false
  end

  def check_after_comment
    @checker.file.each_with_index do |element, line|
      next unless element.include?('*/')

      element.slice!('/*')
      index_comment = element.index('*')
      unless element[index_comment - 1] == ' ' || index_comment.zero?
        @errors << "#{@file_name.colorize(:magenta)} line: #{(line + 1).to_s.colorize(:blue)}: Error: Missing space after the comment"
      end
      return true
    end
    false
  end
end

# rubocop:enable Layout/LineLength
