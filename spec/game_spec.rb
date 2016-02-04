require_relative '../lib/game.rb'

describe Game do
  let(:player1) {double :player1}
  let(:player2) {double :player2}
  let(:game) {described_class.new(player1, player2)}

  describe '#attack' do
    it "attacks a player and returns the next player to play" do
      allow(player2).to receive(:reduce_hp)
      expect(game.attack).to eq player1
    end
  end

end
