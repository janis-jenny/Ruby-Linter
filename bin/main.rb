#init interaction between the user and the program
require_relative '../lib/checks.rb'

#file_object = FileReader.new ('./style.css')   #ARGV.first is to write the file on the terminal
#p file_object.file.readlines(chomp: true)[0].split #chomp: true deletes the new line thing \n
check_error = CheckErrror.new('./style.css') #is an objet
check_error.check_trailing_space
check_error.check_space_after_colon
check_error.check_space_before_open_bracket
check_error.check_before_comment
check_error.check_after_comment
puts check_error.errors

#create a loop to find all the css files and then run all the methods on each file
#then u can puts the errors array

