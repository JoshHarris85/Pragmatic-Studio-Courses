require_relative 'project'
require_relative 'grant_project'
require_relative 'fundrequest'

collection = FundRequest.new('VC-Friendly Start-up Projects')
collection.load_projects(ARGV.shift || 'projects.csv')

grant_project = GrantProject.new('XYZ', 25, 75)
collection.add_project(grant_project)

loop do
  puts "\n Please enter how many funding rounds you would like to happen:"
  input = gets.chomp.downcase

  case input
  when %r{^\d+$}
    collection.request_funding(input.to_i)
  when 'quit', 'exit'
    collection.print_stats
    collection.save
    break
  else
    puts 'Please enter a number or exit to quit.'
  end
end
