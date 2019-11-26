require_relative 'game'

describe Game do

  before do
    $stdout = StringIO.new

    @game = Game.new('Knuckleheads')

    @initial_health = 100
    @player = Player.new('moe', @initial_health)

    @game.add_player(@player)
  end

  it 'woots the player if a high number occurs' do
    allow_any_instance_of(Die).to receive(:roll).and_return(6)

    @game.play(1)
    expect(@player.health).to be(@initial_health + 15)
  end

  it 'skips the player if a medium number occurs' do
    allow_any_instance_of(Die).to receive(:roll).and_return(4)

    @game.play(1)
    expect(@player.health).to be(@initial_health)
  end

  it 'blams the player if a low number occurs' do
    allow_any_instance_of(Die).to receive(:roll).and_return(2)

    @game.play(1)
    expect(@player.health).to be(@initial_health - 10)
  end
end
