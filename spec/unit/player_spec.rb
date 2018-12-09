require 'player'

describe Player do
  subject(:player) { described_class.new }

  describe '#name' do
    it "returns the player's name" do
      expect(player.name).to eq('One')
    end
  end

  describe '#intialize' do
    it 'creates a default name of "One"' do
      expect(player.name).to eq('One')
    end

    it 'takes a name if given' do
      player = Player.new('Aneel')

      expect(player.name).to eq('Aneel')
    end
  end
end