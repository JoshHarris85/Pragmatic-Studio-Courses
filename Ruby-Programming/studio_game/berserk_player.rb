require_relative 'player'

class BerserkPlayer < Player
  def initialize(name, health)
    super(name, health)
    @woots = 0
  end

  def woot
    super
    @woots += 1
    puts 'Berserker is berserk!' if berserk?
  end

  def blam
    return woot if berserk?
    super
  end

  def berserk?
    @woots > 5
  end
end

if $PROGRAM_NAME == __FILE__
  berserker = BerserkPlayer.new('berserker', 50)
  6.times { berserker.woot }
  2.times { berserker.blam }
  puts berserker.health
end
