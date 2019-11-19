class Project
  attr_reader :current_fund, :target_fund
  attr_accessor :name

  def initialize(name, current_fund, target_fund)
    @name = name
    @current_fund = current_fund
    @target_fund = target_fund
  end

  def to_s
    "Project #{@name} has $#{@current_fund} in funding towards a goal of $#{@target_fund} with $#{funding_needed} to go."
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
end

project1 = Project.new('LMN', 500, 3000)
project2 = Project.new('XYZ', 25, 75)

projects = [project1, project2]

puts project1
puts project2
project1.remove_funds(15)
project2.add_funds(25)

projects.each do |project|
  puts project
end
