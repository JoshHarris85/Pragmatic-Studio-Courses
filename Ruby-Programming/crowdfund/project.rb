require_relative 'project'

class Project
  attr_reader :current_fund, :target_fund
  attr_accessor :name

  def initialize(name, current_fund = 0, target_fund = 0)
    @name = name
    @current_fund = current_fund
    @target_fund = target_fund
  end

  def to_s
    "Project #{@name} has $#{@current_fund} in funding towards a goal of $#{@target_fund} with $#{funding_needed} to go."
  end

  def <=>(other)
    other.funding_needed <=> funding_needed
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
    funding_needed.zero?
  end
end
