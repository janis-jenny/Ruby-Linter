class FileReader
  attr_reader :file

  def initialize(file_path)
    @file = File.open(file_path, 'r').readlines(chomp: true)
  end
end
