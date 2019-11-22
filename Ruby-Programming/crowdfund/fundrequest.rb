require '../studio_game/die.rb'

class FundRequest
  def initialize(name)
    @name = name
    @projects = []
  end

  def add_project(project)
    @projects << project
  end

  def request_funding
    puts "There are #{@projects.length} projects in this collection."

    @projects.each do |project|
      puts project
    end

    @projects.each do |project|
      number_rolled = Die.new.roll

      number_rolled.even? ? project.add_funds(25) : project.remove_funds(25)

      puts project
    end
  end
end
