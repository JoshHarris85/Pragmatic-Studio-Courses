require_relative 'project'

module FundRaiser
  class MatchedFundProject < Project
    def add_pledge(pledge)
      super(pledge)
      @current_fund += @current_fund if halfway_met?
    end

    def add_funds(funds)
      super(funds)
      @current_fund += @current_fund if halfway_met?
    end

    def halfway_met?
      @current_fund >= (0.50 * @target_fund)
    end
  end
end
