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

  def paralyze
    cp == player2 ? paralyzes(player2) : paralyzes(player1)
  end

  def poison
    cp == player2 ? poisons(player2) : poisons(player1)
  end

  private

  def poisons(player)
    player.poison
    switch_turns
  end

  def attacks(player)
    player.reduce_hp
    switch_turns unless player.paralyzed == true
    cp.reduce_hp if cp.poisoned == true
    player.healthy
  end

  def paralyzes(player)
    player.paralyze
  end

  def switch_turns
    cp == player2 ? @cp = @player1 : @cp = @player2
  end

end
