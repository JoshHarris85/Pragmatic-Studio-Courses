require_relative 'player'

class Game
  attr_reader :title

  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def play
    puts "There are #{@players.length} players in #{title}: "
    @players.each do |player|
      puts player
    end

    @players.each do |player|
      player.blam
      player.woot
      player.woot
      puts player
    end
  end
end
