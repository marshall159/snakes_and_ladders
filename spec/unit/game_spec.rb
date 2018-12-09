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

    it 'consecutive rolls of the die move token accordingly' do
      allow(die).to receive(:roll).and_return(5, 3)

      game.move
      game.move

      expect(game.token).to eq(9)
    end
  end

  describe '#winner?' do
    before :each do
      allow(die).to receive(:roll).and_return(4)
      24.times { game.move }
    end

    context 'true' do
      it 'returns true if the token has landed on square 100' do
        allow(die).to receive(:roll).and_return(3)
        game.move

        expect(game.winner?).to eq(true)
      end
    end

    context 'false' do
      it 'returns false if the token has not reached square 100' do
        allow(die).to receive(:roll).and_return(4)
        game.move

        expect(game.winner?).to eq(false)
      end
    end
  end
end