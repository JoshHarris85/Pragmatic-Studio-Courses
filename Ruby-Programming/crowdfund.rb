class Project
  def initialize(name, current_fund, target_fund)
    @name = name
    @current_fund = current_fund
    @target_fund = target_fund
  end

  def to_s
    "Project #{@name} has $#{@current_fund} in funding towards a goal of $#{@target_fund}."
  end

  def add_funds(funds)
    @current_fund += funds

    puts "Project #{@name} got more funds!"
  end

  def remove_funds(funds)
    @current_fund -= funds

    puts "Project #{@name} lost some funds!"
  end
end

project1 = Project.new('LMN', 500, 3000)
project2 = Project.new('XYZ', 25, 75)
puts project1
puts project2
project1.remove_funds(15)
project2.add_funds(25)
puts project1
puts project2
