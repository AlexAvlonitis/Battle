class Game
  attr_reader :player1, :player2, :cp

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @cp = @player1
  end

  def attack
    cp == player1 ? attacks(player2) : attacks(player1)
  end

  def paralyze
    cp == player1 ? paralyzes(player2) : paralyzes(player1)
  end

  def poison
    cp == player1 ? poisons(player2) : poisons(player1)
  end

  def sleeper
    cp == player1 ? sleeps(player2) : sleeps(player1)
  end

  def heal
    cp == player1 ? heals(player1) : heals(player2)
  end

  private

  def heals(player)
    player.heal
    switch_turns
  end

  def poisons(player)
    player.reduce_hp
    player.poison
    switch_turns
  end

  def attacks(player)
    player.reduce_hp
    cp.reduce_hp if cp.poisoned
    switch_turns unless player.paralyzed || player.sleeping
    player.healthy
  end

  def paralyzes(player)
    player.paralyze
  end

  def sleeps(player)
    player.sleeper
  end

  def switch_turns
    cp == player1 ? @cp = @player2 : @cp = @player1
  end

end
