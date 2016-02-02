require_relative "../lib/player"

describe Player do
  let(:name) {double :name}
  let(:player) {described_class.new(name)}

  it "returns the player's name" do
    expect(player.name).to eq name
  end
end
