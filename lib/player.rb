class Player
  attr_reader :name, :hp, :paralyzed, :poisoned

  def initialize(name)
    @name = name
    @hp = 100
    @paralyzed = false
    @poisoned = false
  end

  def reduce_hp
    @hp -= rand(1..20)
  end

  def paralyze
    @paralyzed = [true,false].sample
  end

  def healthy
    @paralyzed = false
    @poisoned = false
  end

  def poison
    @poisoned = true
  end

end
