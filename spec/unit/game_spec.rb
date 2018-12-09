require 'game'

describe Game do
  let(:die) { double(:die) }
  let(:player) { double(:player) }
  subject(:game) { described_class.new(die: die) }

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

    context 'game won' do
      it 'returns a message that the player has won' do
        allow(die).to receive(:roll).and_return(4)
        24.times { game.move }
        allow(die).to receive(:roll).and_return(3)


        result = game.move

        expect(result).to eq('Player One has won')
      end

      it 'returns the Players name if given' do
        game = Game.new(player: player, die: die)
        allow(die).to receive(:roll).and_return(4)
        allow(player).to receive(:name).and_return('Aneel')
        24.times { game.move }
        allow(die).to receive(:roll).and_return(3)


        result = game.move

        expect(result).to eq('Player Aneel has won')
      end
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
        expect(game.token).to eq(97)
      end
    end
  end
end