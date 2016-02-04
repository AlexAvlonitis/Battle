require_relative '../lib/game.rb'

describe Game do
  let(:player1) {double :player1}
  let(:player2) {double :player2}
  let(:game) {described_class.new(player1, player2)}

  before do
    allow(player2).to receive(:paralyzed) {false}
    allow(player2).to receive(:healthy)
    allow(player2).to receive(:reduce_hp)
    allow(player1).to receive(:poisoned).and_return(false)
  end

  describe '#attack' do
    it "attacks a player and returns the next player to play" do
      expect(game.attack).to eq nil
    end
  end

end
