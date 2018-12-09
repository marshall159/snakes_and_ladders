require 'game'

describe Game do
  let(:die) { double(:die) }
  subject(:game) { described_class.new(die) }

  describe '#initialize' do
    it 'token is at square one' do
      game = Game.new

      expect(game.token).to eq(1)
    end
  end

  describe '#move' do
    it 'rolls the die and moves the token' do
      allow(die).to receive(:roll).and_return(5)

      game.move

      expect(game.token).to eq(6)
    end
  end
end