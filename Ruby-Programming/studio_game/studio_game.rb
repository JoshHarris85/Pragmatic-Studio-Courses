require_relative 'player'
require_relative 'game'

player1 = Player.new('moe')
player2 = Player.new('larry', 60)
player3 = Player.new('curly', 125)

knuckleheads = Game.new('Knuckleheads')
knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.add_player(player3)
knuckleheads.play(10)

chipmunk1 = Player.new('alvin')
chipmunk2 = Player.new('Simon', 60)
chipmunk3 = Player.new('theodore', 125)

chipmunks = Game.new('Chipmunks')
chipmunks.add_player(chipmunk1)
chipmunks.add_player(chipmunk2)
chipmunks.add_player(chipmunk3)
chipmunks.play(3)
