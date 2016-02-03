class Game
  attr_reader :player1, :player2, :p1

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @p1 = true
  end

  def attack(player)
    player.reduce_hp
    switcher
  end

  private

  def switcher
    @p1 ? @p1 = false : @p1 = true
  end

end
