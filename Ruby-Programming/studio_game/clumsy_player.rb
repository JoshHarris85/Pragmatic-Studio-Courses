require_relative 'player'

class ClumsyPlayer < Player
  attr_reader :boost_factor

  def initialize(name, health=100, boost_factor=1)
    super(name, health)
    @boost_factor = boost_factor
  end

  def woot
    @boost_factor.times { super }
  end

  def found_treasure(treasure)
    super(Treasure.new(treasure.name, treasure.points / 2))
  end
end

if $PROGRAM_NAME == __FILE__
  clumsy = ClumsyPlayer.new('klutz', 250, 2)

  hammer = Treasure.new(:hammer, 50)
  clumsy.found_treasure(hammer)
  clumsy.found_treasure(hammer)
  clumsy.found_treasure(hammer)

  crowbar = Treasure.new(:crowbar, 400)
  clumsy.found_treasure(crowbar)

  clumsy.each_found_treasure do |treasure|
    puts "#{treasure.points} total #{treasure.name} points"
  end
  puts "#{clumsy.points} grand total points"
end
