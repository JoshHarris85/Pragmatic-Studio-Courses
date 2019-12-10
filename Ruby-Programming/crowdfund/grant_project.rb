require_relative 'project'

class GrantProject < Project
  def remove_funds(funds)
    super(funds)
    puts 'Funds cannot be removed from a grant project'
  end

  def funding_needed
    target_fund - current_fund
  end
end
