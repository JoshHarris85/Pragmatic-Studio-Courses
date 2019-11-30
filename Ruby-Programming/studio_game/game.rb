require_relative 'player'
require_relative 'game_turn'
require_relative 'treasure_trove'

class Game
  attr_reader :title

  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def play(rounds)
    puts "There are #{@players.length} players in #{title}: "
    @players.each do |player|
      puts player
    end

    treasures = TreasureTrove::TREASURES

    puts "\nThere are #{treasures.size} treasures to be found:\n"

    treasures.each do |treasure|
      puts "A #{treasure.name} is worth #{treasure.points} points"
    end

    1.upto(rounds) do |round|
      puts "\nRound: #{round}"
      @players.each do |player|
        GameTurn.take_turn(player)
        puts player
      end
    end

    print_stats
  end

  def print_stats
    strong, weak = @players.partition(&:strong?)

    puts "\n#{@title} Statistics: \n"

    print_strong_players(strong)

    print_weak_players(weak)

    print_player_points

    puts "\nTotal game points: #{total_points}"

    print_winner
  end

  def print_player_points
    @players.each do |player|
      puts "\n#{player.name}'s point totals:"
      puts "#{player.points} grand total points"
    end
  end

  def print_name_and_heatlh(player)
    puts "#{player.name} (#{player.health})"
  end

  def print_weak_players(weak)
    puts "\n#{weak.count} weak players:"
    weak.each do |player|
      print_name_and_heatlh(player)
    end
  end

  def print_strong_players(strong)
    puts "\n#{strong.count} strong players:"
    strong.each do |player|
      print_name_and_heatlh(player)
    end
  end

  def print_winner
    puts "\n#{@title} High Scores:\n"
    @players.sort.each do |player|
      puts "#{player.name.ljust(20, '.')} #{player.score}\n"
    end
  end

  def total_points
    @players.reduce(0) do |sum, player|
      sum + player.points
    end
  end
end
