class FileReader
  attr_reader :file
  def initialize(file_path)
    @file = File.open(file_path, 'r').readlines(chomp: true) #file operations: r is module to open the file in read mode, if i want to write it, use +, if i want to read and write, use r+
    
  end
end

how to loop all the files to check