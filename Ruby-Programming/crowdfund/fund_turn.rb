require '../studio_game/die.rb'

require_relative 'project'
require_relative 'pledge_pool'

module FundTurn
  def self.take_turn(project)
    number_rolled = Die.new.roll

    number_rolled.even? ? project.add_funds(25) : project.remove_funds(25)

    pledge = PledgePool.random
    puts "Project #{project.name} received a #{pledge.type} pledge worth $#{pledge.funds}."
  end
end
