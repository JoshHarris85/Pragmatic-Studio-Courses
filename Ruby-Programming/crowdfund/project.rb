require_relative 'project'
require_relative 'pledge_pool'

class Project
  attr_reader :current_fund, :target_fund, :pledges
  attr_accessor :name

  def initialize(name, current_fund = 0, target_fund = 0)
    @name = name
    @current_fund = current_fund
    @target_fund = target_fund
    @pledges = Hash.new(0)
  end

  def to_s
    "Project #{@name} has $#{@current_fund} in funding towards a goal of $#{@target_fund} with $#{funding_needed} to go."
  end

  def <=>(other)
    other.funding_needed <=> funding_needed
  end

  def each_found_pledge
    @pledges.each do |name, points|
      yield Pledge.new(name, points)
    end
  end

  def add_pledge(pledge)
    @pledges[pledge.type] += pledge.funds
    @current_fund += pledge.funds
    puts "Project #{@name} received a #{pledge.type} pledge worth $#{pledge.funds}."
    puts "Project #{@name}'s pledges: #{@pledges}"
  end

  def add_funds(funds)
    @current_fund += funds

    puts "Project #{@name} got more funds!"
  end

  def remove_funds(funds)
    @current_fund -= funds

    puts "Project #{@name} lost some funds!"
  end

  def funding_needed
    target_fund - current_fund
  end

  def funded?
    funding_needed.zero? || funding_needed.negative?
  end

  def unfunded?
    funding_needed.positive?
  end
end
