def deal(cards_to_deal = 1)
  if block_given?
    faces = ["Jack", "Queen", "King", "Ace"]
    suits = ["Hearts", "Diamonds", "Spades", "Clubs"]

    cards_to_deal.times do
      random_face = faces.sample
      random_suit = suits.sample
      # call the block here
      x = yield(random_face, random_suit)
      puts "You scored a #{x}!"
    end
  else
    puts 'No deal!'
  end
end

deal do |face, suit|
  puts "Dealt a #{face} of #{suit}"
  face.length + suit.length
end

deal

deal(10) do |face, suit|
  puts "Dealt a #{face} of #{suit}"
  face.length + suit.length
end
