require_relative '../lib/game.rb'

describe Game do
  let(:player) {double :player}
  let(:game) {described_class.new}

  describe '#attack' do
    it "attacks another player" do
      expect(player).to receive(:attacked)
      game.attack(player)
    end
  end
end
