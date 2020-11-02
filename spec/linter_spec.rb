require_relative '../lib/checks.rb'

describe CheckErrror do
  let(:checks) { CheckErrror.new('style.css') }
  let(:line) { '1'}
 
  describe '#check_trailing_space' do
    it 'should return a error message when there is an empty space at the end of the line' do
      expect(checks.check_trailing_space).to eq(true)
    end
  end

  describe '#check_space_after_colon ' do
    it 'should return a error message when there is not an empty space after colon' do
      expect(checks.check_space_after_colon ).to eq(true)
    end
  end
  
end