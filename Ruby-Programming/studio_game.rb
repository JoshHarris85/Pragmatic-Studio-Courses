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

class Game
  attr_reader :title

  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def play
    puts "There are #{@players.length} players in Knuckleheads: "
    @players.each do |player|
      puts player
    end

    @players.each do |player|
      player.blam
      player.woot
      player.woot
      puts player
    end
  end
end

player1 = Player.new('moe')
player2 = Player.new('larry', 60)
player3 = Player.new('curly', 125)

knuckleheads = Game.new('Knuckleheads')
knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.add_player(player3)
knuckleheads.play

chipmunk1 = Player.new('alvin')
chipmunk2 = Player.new('Simon', 60)
chipmunk3 = Player.new('theodore', 125)

chipmunks = Game.new('Chipmunks')
chipmunks.add_player(chipmunk1)
chipmunks.add_player(chipmunk2)
chipmunks.add_player(chipmunk3)
chipmunks.play
