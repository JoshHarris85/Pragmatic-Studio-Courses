scores = [83, 71, 92, 64, 98, 87, 75, 69]

high_scores = scores.select { |s| s > 80 }

puts high_scores

low_scores = scores.reject { |s| s > 80 }

puts low_scores

puts scores.any? { |s| s < 70 }

puts scores.find { |s| s < 70 }

# scores.select! { |s| s > 70 }
# scores.reject! { |s| s.even? }
# puts scores

scores_doubled = scores.map { |s| s * 2 }
puts "Double scores:"
puts scores_doubled

puts scores.reduce(0, :+) > 600

evens, odds = scores.partition { |s| s.even? }
puts "evens:"
puts evens

puts "odds:"
puts odds
