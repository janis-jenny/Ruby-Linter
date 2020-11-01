require 'colorize'
require_relative '../lib/checks.rb'

describe CheckErrror do
  let(:checks) { CheckErrror.new('style.css') }
  let(:line) { '1'}
 
  describe '#check_trailing_space' do
    it 'should return a error message when there is an empty space at the end of the line' do
      expect(checks.check_trailing_space).to eq(true)
    end
  end
end