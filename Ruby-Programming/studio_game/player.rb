class Player
  attr_reader :health
  attr_reader :name

  def initialize(name, health = 100)
    @name = name.capitalize
    @health = health
  end

  def name=(new_name)
    @name = new_name.capitalize
  end

  def strong?
    @health > 100
  end

  def to_s
    "I'm #{@name} with a health of #{@health} and a score of #{score}."
  end

  def blam
    @health -= 10
    puts "#{@name} got blammed!"
  end

  def woot
    @health += 15
    puts "#{@name} got w00ted!"
  end

  def score
    @health + @name.length
  end
end

if $PROGRAM_NAME == __FILE__
  player = Player.new('moe')
  puts player.name
  puts player.health
  player.w00t
  puts player.health
  player.blam
  puts player.health
end
