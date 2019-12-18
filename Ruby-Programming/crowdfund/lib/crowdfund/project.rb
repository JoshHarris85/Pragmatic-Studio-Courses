require_relative 'project'
require_relative 'pledge_pool'
require_relative 'fundable'

module FundRaiser
  class Project
    include Fundable

    attr_reader :target_fund, :pledges
    attr_accessor :name, :current_fund

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

    def funded?
      funding_needed.zero? || funding_needed.negative?
    end

    def unfunded?
      funding_needed.positive?
    end
  end
end
