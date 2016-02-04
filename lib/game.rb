class Game
  attr_reader :player1, :player2, :cp

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @cp = @player2
  end

  def attack
    cp == player2 ? attacks(player2) : attacks(player1)
  end

  private

  def attacks(player)
    player.reduce_hp
    switch_turns
  end

  def switch_turns
    cp == player2 ? @cp = @player1 : @cp = @player2
  end

end
