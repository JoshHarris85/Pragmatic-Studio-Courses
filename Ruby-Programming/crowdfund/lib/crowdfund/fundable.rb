module FundRaiser
  module Fundable
    def add_funds(funds)
      self.current_fund += funds

      puts "Project #{self.name} got more funds!"
    end

    def remove_funds(funds)
      self.current_fund -= funds

      puts "Project #{self.name} lost some funds!"
    end

    def funding_needed
      self.target_fund - self.current_fund
    end
  end
end
