require_relative 'player'
require_relative 'clumsy_player'
require_relative 'berserk_player'
require_relative 'game'

# player1 = Player.new('moe')
# player2 = Player.new('larry', 60)
# player3 = Player.new('curly', 125)

# knuckleheads = Game.new('Knuckleheads')
# knuckleheads.add_player(player1)
# knuckleheads.add_player(player2)
# knuckleheads.add_player(player3)
# knuckleheads.play(10) do
#   knuckleheads.total_points >= 2000
# end

chipmunks = Game.new('Chipmunks')
chipmunks.load_players(ARGV.shift || 'players.csv')

klutz = ClumsyPlayer.new('klutz', 105)
chipmunks.add_player(klutz)

berserker = BerserkPlayer.new('berserker', 50)
chipmunks.add_player(berserker)

loop do
  puts "\nHow many game rounds? ('quit' to exit)"
  answer = gets.chomp.downcase

  case answer
  when 'exit', 'quit'
    chipmunks.print_stats
    chipmunks.save_high_scores
    break
  when %r{^\d+$}
    chipmunks.play(answer.to_i)
  else
    puts 'Please enter how many rounds or quit'
  end
end
