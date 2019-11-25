require_relative 'die'
require_relative 'player'

module GameTurn
  def self.take_turn(player)
    number_rolled = Die.new.roll

    case number_rolled
    when 1..2
      player.blam
    when 3..4
      puts "#{player.name} was skipped."
    else
      player.woot
    end
  end
end
