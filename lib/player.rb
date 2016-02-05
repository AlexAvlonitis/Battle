class Player
  attr_reader :name, :hp, :paralyzed, :poisoned, :sleeping

  def initialize(name)
    @name = name
    @hp = 100
    @paralyzed = false
    @poisoned = false
    @sleeping = false
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
    @sleeping = false
  end

  def poison
    @poisoned = true
  end

  def heal
    @hp += 20 unless (@hp + 20) > 100
  end

  def sleeper
    @sleeping = true
  end

end
