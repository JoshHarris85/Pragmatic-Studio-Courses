require_relative 'player'

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
    expect(@player.to_s).to eq("I'm #{@player.name} with a health of #{@player.health} and a score of #{@player.score}.")
  end

  it 'computes a score as the sum of its health and length of name' do
    expect(@player.score).to eq(@player.health + @player.name.length)
  end

  it 'increases health by 15 when w00ted' do
    @player.woot

    expect(@player.health).to eq(@initial_health + 15)
  end

  it 'decreases health by 10 when blammed' do
    @player.blam

    expect(@player.health).to eq(@initial_health - 10)
  end
end
