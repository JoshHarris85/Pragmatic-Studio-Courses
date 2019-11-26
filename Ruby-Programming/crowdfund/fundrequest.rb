require_relative 'fund_turn'

class FundRequest
  def initialize(name)
    @name = name
    @projects = []
  end

  def add_project(project)
    @projects << project
  end

  def request_funding(rounds)
    puts "There are #{@projects.length} projects in this collection."

    1.upto(rounds).each do |round|
      puts "\nCurrent Round: #{round}\n"
      @projects.each do |project|
        FundTurn.take_turn(project)
        puts project
      end
    end

    print_stats
  end

  def print_stats
    funded, unfunded = @projects.partition(&:funded?)

    print_funded(funded)
    print_unfunded(unfunded)
    print_contributors_needed(unfunded)
  end

  def print_funded(funded)
    puts "\n #{funded.length} Funded:\n"
    funded.each do |project|
      puts project
    end
  end

  def print_unfunded(unfunded)
    puts "\n #{unfunded.length} Unfunded:\n"
    unfunded.each do |project|
      puts project
    end
  end

  def print_contributors_needed(unfunded)
    puts "\n #{unfunded.length} Still need contributors!:\n"
    unfunded.sort.each do |project|
      puts "#{project.name} needs $#{project.funding_needed} more in funding."
    end
  end
end
