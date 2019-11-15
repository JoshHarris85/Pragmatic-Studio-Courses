first_player = "larry"
first_health = 60

second_player = "curly"
second_health = 125

third_player = "moe"
third_heatlh = 100

fourth_player = "shemp"
fourth_health = 90

puts "#{first_player.capitalize}'s health is #{first_health / 9}"
puts "#{first_player.capitalize}'s health is #{first_health / 9.0}"
puts "#{second_player.upcase}'s health is #{second_health}"

second_health = first_health
puts "#{second_player.upcase}'s health is #{second_health}"

first_health = 30
puts "#{first_player.capitalize}'s health is #{first_health}"
puts "#{second_player.upcase}'s health is #{second_health}"

puts "#{third_player.capitalize} has a health of #{third_heatlh}.".center(50, "*")

puts "#{fourth_player.capitalize.ljust(33, ".")} #{fourth_health} health"

name1 = 'larry'
name2 = 'curly'
name3 = 'moe'

puts "Players: \n\t#{name1}\n\t#{name2}\n\t#{name3}"

puts "The game started on #{Time.now.strftime("%A %m/%d/%Y at %I:%M%p")}"
