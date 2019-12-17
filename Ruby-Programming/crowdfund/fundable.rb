module Fundable
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
end
