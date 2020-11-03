require_relative '../lib/checks'

describe CheckErrror do
  let(:checks) { CheckErrror.new('style.css') }

  describe '#check_trailing_space' do
    it 'should return a error message when there is an empty space at the end of the line' do
      expect(checks.check_trailing_space).to eq(true)
    end
  end

  describe '#check_trailing_space' do
    it 'should return false when there is no an empty space at the end of the line' do
      expect(checks.check_trailing_space == false).to eq(false)
    end
  end

  describe '#check_space_after_colon ' do
    it 'should return a error message when there is not an empty space after colon' do
      expect(checks.check_space_after_colon).to eq(true)
    end
  end

  describe '#check_space_after_colon' do
    it 'should return false when there is an empty space after colon' do
      expect(checks.check_space_after_colon == false).to eq(false)
    end
  end

  describe '#check_space_before_open_bracket' do
    it 'should return a error message when there is not an empty space before open bracket' do
      expect(checks.check_space_before_open_bracket).to eq(true)
    end
  end

  describe '#check_space_before_open_bracket' do
    it 'should return false when there is an empty space before open bracket' do
      expect(checks.check_space_before_open_bracket == false).to eq(false)
    end
  end

  describe '#check_before_comment' do
    it 'should return a error message when there is not an empty space before comment' do
      expect(checks.check_before_comment).to eq(true)
    end
  end

  describe '#check_before_comment' do
    it 'should return false when there is an empty space before comment' do
      expect(checks.check_before_comment == false).to eq(false)
    end
  end

  describe '#check_after_comment' do
    it 'should return a error message when there is not an empty space after comment' do
      expect(checks.check_after_comment).to eq(true)
    end
  end

  describe '#check_after_comment' do
    it 'should return false when there is an empty space after comment' do
      expect(checks.check_after_comment == false).to eq(false)
    end
  end

end
