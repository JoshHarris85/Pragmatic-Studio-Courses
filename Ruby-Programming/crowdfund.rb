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

class ProjectCollection
  def initialize(name)
    @name = name
    @projects = []
  end

  def add_project(project)
    @projects << project
  end

  def request_funding
    puts "There are #{@projects.length} projects in this collection."

    @projects.each do |project|
      puts project
    end

    @projects.each do |project|
      project.remove_funds(15)
      project.add_funds(25)
      project.add_funds(25)
      puts project
    end
  end
end

project1 = Project.new('LMN', 500, 3000)
project2 = Project.new('XYZ', 25, 75)

collection = ProjectCollection.new('VC-Friendly Start-up Projects')
collection.add_project(project1)
collection.add_project(project2)
collection.request_funding
