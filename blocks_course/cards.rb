cards = ["Jack", "Queen", "King", "Ace", "Joker"]

cards.shuffle.each do |card|
  puts "#{card.upcase} - #{card.size}"
end

cards.reverse_each do |card|
  puts "#{card.upcase} - #{card.size}"
end

scores = {"Larry" => 10, "Moe" => 8, "Curly" => 12}

scores.each { |k, v| puts "#{k} scored a #{v}!"}
