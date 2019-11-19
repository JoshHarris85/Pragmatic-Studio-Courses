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

player1 = Player.new("moe")
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)

puts player2.name
player2.name = 'lawrence'
puts player2.name
puts player2.health
puts player2.score
puts player2

players = [player1, player2, player3]
puts "There are #{players.size} players in the game:"

players.pop
players.push(Player.new('Shemp', 90))

players.each do |player|
  puts player
  puts player.health
  player.woot
  player.woot
  player.blam
  puts player
end
