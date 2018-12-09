require 'die'

describe Die do
  subject(:die) { described_class.new }

  describe '#roll' do
    it { is_expected.to respond_to :roll }

    it 'returns a number between one and six' do
      allow(Kernel).to receive(:rand).and_return(5)

      expect(die.roll).to eq(6)
    end

    it 'returns a random number' do
      allow(Kernel).to receive(:rand).and_return(5, 0)

      expect(die.roll).to eq(6)
      expect(die.roll).to eq(1)
    end
  end
end