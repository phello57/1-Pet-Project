

require '../src/Game'

is_play_again = true

game = Game.new(true)

while is_play_again do
  is_play_again = game.start
end




