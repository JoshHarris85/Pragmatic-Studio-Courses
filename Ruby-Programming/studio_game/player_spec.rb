require_relative 'player'
require_relative 'treasure_trove'

describe Player do
  before do
    $stdout = StringIO.new

    @initial_health = 210
    @player = Player.new('charlie', @initial_health)
  end

  it 'Has a capitalized name' do
    expect(@player.name).to eq('Charlie')
  end

  it 'has an initial health' do
    expect(@player.health).to eq(210)
  end

  it 'has a string representation' do
    expect(@player.to_s).to eq("I'm #{@player.name} with health = #{@player.health}, points = #{@player.points} and score = #{@player.score}.")
  end

  it 'computes a score as the sum of its health and length of name' do
    expect(@player.score).to eq(@player.health + @player.points)
  end

  it 'increases health by 15 when w00ted' do
    @player.woot

    expect(@player.health).to eq(@initial_health + 15)
  end

  it 'decreases health by 10 when blammed' do
    @player.blam

    expect(@player.health).to eq(@initial_health - 10)
  end

  it 'computes points as the sum of all treasure points' do
    expect(@player.points).to eq(0)

    @player.found_treasure(Treasure.new(:hammer, 50))

    expect(@player.points).to eq(50)

    @player.found_treasure(Treasure.new(:crowbar, 400))

    expect(@player.points).to eq(450)

    @player.found_treasure(Treasure.new(:hammer, 50))

    expect(@player.points).to eq(500)
  end

  it 'computes a score as the sum of its health and points' do
    @player.found_treasure(Treasure.new(:hammer, 50))
    @player.found_treasure(Treasure.new(:hammer, 50))

    expect(@player.score).to eq(@player.health + @player.points)
  end

  it 'yields each found treasure and its total points' do
    @player.found_treasure(Treasure.new(:skillet, 100))
    @player.found_treasure(Treasure.new(:skillet, 100))
    @player.found_treasure(Treasure.new(:hammer, 50))
    @player.found_treasure(Treasure.new(:bottle, 5))
    @player.found_treasure(Treasure.new(:bottle, 5))
    @player.found_treasure(Treasure.new(:bottle, 5))
    @player.found_treasure(Treasure.new(:bottle, 5))
    @player.found_treasure(Treasure.new(:bottle, 5))

    yielded = []
    @player.each_found_treasure do |treasure|
      yielded << treasure
    end

    expect(yielded).to eq(
      [
        Treasure.new(:skillet, 200),
        Treasure.new(:hammer, 50),
        Treasure.new(:bottle, 25)
      ]
    )
  end

  it 'can create a player from a csv string' do
    player = Player.from_csv(['dog', 200])

    expect(player.name).to eq('Dog')
    expect(player.health).to eq(200)
  end

  context 'with a health greater than 100' do
    before do
      @player = Player.new('test', 110)
    end

    it 'is strong' do
      expect(@player).to be_strong
    end
  end

  context 'with 100 health' do
    before do
      @player = Player.new('test')
    end

    it 'is wimpy' do
      expect(@player).not_to be_strong
    end
  end

  context 'in a collection of players' do
    before do
      @player1 = Player.new('moe', 100)
      @player2 = Player.new('larry', 200)
      @player3 = Player.new('curly', 300)

      @players = [@player1, @player2, @player3]
    end

    it 'is sorted by decreasing score' do
      expect(@players.sort).to eq([@player3, @player2, @player1])
    end
  end
end
