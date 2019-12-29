class Flyer
  attr_reader :name, :email, :miles_flown
  attr_accessor :status

  def initialize(name, email, miles_flown, status=:bronze)
    @name = name
    @email = email
    @miles_flown = miles_flown
    @status = status
  end

  def to_s
    "#{name} (#{email}): #{miles_flown} - #{status}"
  end
end

flyers = []
flyers << Flyer.new("Larry", "larry@example.com", 4000, :platinum)
flyers << Flyer.new("Moe", "moe@example.com", 1000)
flyers << Flyer.new("Curly", "curly@example.com", 3000, :gold)
flyers << Flyer.new("Shemp", "shemp@example.com", 2000)

frequent_flyers = flyers.select { |f| f.miles_flown >= 3000 }
puts frequent_flyers

non_frequent_flyers = flyers.reject { |f| f.miles_flown >= 3000 }
puts non_frequent_flyers

puts flyers.any? { |f| f.status == :platinum }

puts flyers.find { |f| f.status == :bronze }

platinum_flyers, regular_flyers = flyers.partition { |f| f.status == :platinum }

puts "platinum flyers:"
puts platinum_flyers

puts "regular flyers:"
puts regular_flyers

puts flyers.map { |f| "#{f.name} (#{f.status.upcase})" }

puts "flown in km:"
km_miles = flyers.map { |f| f.miles_flown * 1.6 }
puts km_miles

sum_miles = flyers.reduce(0) { |sum, f| sum + f.miles_flown }
puts sum_miles

sum_km = km_miles.reduce(0, :+)
puts sum_km

puts flyers.select { |f| f.status == :bronze }
           .reduce(0) { |sum, f| sum + (f.miles_flown * 1.6) }

puts flyers.max_by { |f| f.miles_flown }
