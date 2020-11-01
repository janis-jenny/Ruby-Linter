require_relative '../lib/checks.rb'

describe CheckErrror do
  let(:checks) { CheckErrror.new }
  describe '#check_trailing_space' do
    it 'should replace the move of the player with the simbol' do
      expect(game.check_move(0, simbol)).to eq(true)
    end
    it 'invalid move of the player ' do
      n = ans != ans
      expect(n).to eq(false)
    end
  end
end