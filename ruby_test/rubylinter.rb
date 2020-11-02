## checks file
require 'colorize'
require_relative 'file_reader'

class CheckErrror
  attr_reader :errors

  def initialize(file_path)
    @checker = FileReader.new(file_path)
    @errors = []
    @file_name = file_path
  end

  # if you want to remove only leading and trailing whitespace (like PHP's trim)
  # you can use .strip, but if you want to remove all whitespace, you can use .gsub(/\s+/, "") instead
  # this means only at the end

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

      index_colon = element.index(':') # use the index method to get the specific character
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

      element.slice!('/*') # the new string or result of the method, is gonna stored inside the element again
      index_comment = element.index('*')
      unless element[index_comment - 1] == ' ' || index_comment.zero?
        @errors << "#{@file_name.colorize(:magenta)} line: #{(line + 1).to_s.colorize(:blue)}: Error: Missing space after the comment"
      end
      return true
    end
    false
  end
end

##main file

# frozen_string_literal: true

# start interaction between the user and the program
require 'colorize'
require_relative '../lib/checks'

ARGV.each do |path|
  next unless File.exist?(path) && File.extname(path) == '.css'

  check_error = CheckErrror.new(path) # is an objet
  check_error.check_trailing_space
  check_error.check_space_after_colon
  check_error.check_space_before_open_bracket
  check_error.check_before_comment
  check_error.check_after_comment
  puts check_error.errors
end

# create a loop to find all the css files and then run all the methods on each file
# then u can puts the errors array

##file_reader file
# rubocop:disable Style/Documentation
# frozen_string_literal: true

class FileReader
    attr_reader :file
  
    def initialize(file_path)
      @file = File.open(file_path, 'r').readlines(chomp: true)
    end
  end
  
  # rubocop:enable Style/Documentation
  