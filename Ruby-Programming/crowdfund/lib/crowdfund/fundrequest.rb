require_relative 'fund_turn'

module FundRaiser
  class FundRequest
    def initialize(name)
      @name = name
      @projects = []
    end

    def add_project(project)
      @projects << project
    end

    def load_projects(file)
      File.readlines(file).each do |line|
        name, current, target = line.split(',')
        project = Project.new(name, current.to_i, target.to_i)
        add_project(project)
      end
    end

    def save(to_file = 'bin/project_funds_needed.txt')
      unfunded = @projects.select(&:unfunded?)

      File.open(to_file, 'w') do |file|
        file.puts "\n #{unfunded.length} Still need contributors!:\n"

        unfunded.sort.each do |project|
          file.puts "#{project.name} needs $#{project.funding_needed} more in funding."
        end
      end
    end

    def request_funding(rounds)
      puts "There are #{@projects.length} projects in this collection."

      1.upto(rounds).each do |round|
        puts "\nCurrent Round: #{round}\n"
        @projects.each do |project|
          FundTurn.take_turn(project)
          puts project
        end
      end

      print_stats
    end

    def print_stats
      funded, unfunded = @projects.partition(&:funded?)

      print_funded(funded)
      print_unfunded(unfunded)
      print_project_pledges
      print_contributors_needed(unfunded)
    end

    def print_project_pledges
      @projects.sort.each do |project|
        puts "\nProject #{project.name}'s pledges:"
        total_pledges = 0

        project.each_found_pledge do |pledge|
          puts "$#{pledge.funds} in #{pledge.type} pledges"
          total_pledges += pledge.funds
        end

        puts "$#{total_pledges} in total pledges"
      end
    end

    def print_funded(funded)
      puts "\n #{funded.length} Funded:\n"
      funded.each do |project|
        puts project
      end
    end

    def print_unfunded(unfunded)
      puts "\n #{unfunded.length} Unfunded:\n"
      unfunded.each do |project|
        puts project
      end
    end

    def print_contributors_needed(unfunded)
      puts "\n #{unfunded.length} Still need contributors!:\n"
      unfunded.sort.each do |project|
        puts "#{project.name} needs $#{project.funding_needed} more in funding."
      end
    end
  end
end
