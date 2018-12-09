require 'game'

describe Game do
  subject(:game) { described_class.new }

  describe '#initialize' do
    it 'token is at square one' do
      expect(game.token).to eq(1)
    end
  end
end