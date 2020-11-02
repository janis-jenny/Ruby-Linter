# rubocop:disable Style/Documentation
# frozen_string_literal: true

class FileReader
  attr_reader :file

  def initialize(file_path)
    @file = File.open(file_path, 'r').readlines(chomp: true)
  end
end
# file operations: r is module to open the file in read mode,
# if i want to write it, use +, if i want to read and write, use r+

# rubocop:enable Style/Documentation
