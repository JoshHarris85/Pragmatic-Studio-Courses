require_relative 'fund_turn'

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
      FundTurn.take_turn(project)
      puts project
    end
  end
end
