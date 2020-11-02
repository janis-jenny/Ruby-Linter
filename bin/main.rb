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
