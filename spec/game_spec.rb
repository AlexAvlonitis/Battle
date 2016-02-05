require_relative '../lib/game.rb'

describe Game do
  let(:player1) {double :player1}
  let(:player2) {double :player2}
  let(:game) {described_class.new(player1, player2)}

  before do
    allow(player2).to receive(:paralyzed) {false}
    allow(player2).to receive(:healthy)
    allow(player1).to receive(:healthy)
    allow(player2).to receive(:reduce_hp)
    allow(player1).to receive(:poisoned) {false}
    allow(player2).to receive(:sleeping) {false}
  end

  describe '#attack' do
    it "attacks a player and returns the next player to play" do
      expect(game.attack).to eq nil
    end
  end

  describe '#paralyze' do
    it "sends paralyze to the player" do
      expect(player2).to receive(:paralyze)
      game.paralyze
    end
  end

  describe '#poison' do
    it "poisons the player" do
      expect(player2).to receive(:poison)
      game.poison
    end
  end

  describe '#sleeper' do
    it "sends the player to sleep" do
      expect(player2).to receive(:sleeper)
      game.sleeper
    end
  end

end
