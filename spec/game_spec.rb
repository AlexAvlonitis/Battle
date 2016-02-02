require_relative '../lib/game.rb'

describe Game do
  let(:player1) {double :player1}
  let(:player2) {double :player2}
  let(:game) {described_class.new(player1, player2)}

  describe '#attack' do
    it "sends the attacked method to player" do
      expect(player1).to receive(:reduce_hp)
      game.attack(player1)
    end
  end

end
