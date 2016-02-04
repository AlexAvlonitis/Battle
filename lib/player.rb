class Player
  attr_reader :name, :hp, :paralyzed

  def initialize(name)
    @name = name
    @hp = 100
    @paralyzed = false
  end

  def reduce_hp
    @hp -= rand(1..20)
  end

  def paralyze
    @paralyzed = true
  end

  def healthy
    @paralyzed = false
  end

end
