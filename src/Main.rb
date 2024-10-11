

require '../src/Game'

is_play_again = true

while is_play_again do
	game = Game.new(true)
	is_play_again = game.start
end




