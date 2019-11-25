require '../studio_game/die.rb'

require_relative 'project'

module FundTurn
  def self.take_turn(project)
    number_rolled = Die.new.roll

    number_rolled.even? ? project.add_funds(25) : project.remove_funds(25)
  end
end
