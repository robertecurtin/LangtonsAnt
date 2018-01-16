local AntWalk = require('antwalk')
local Compass = require('compass')

local NUMBER_OF_ITERATIONS = 2000

local board = {
  location = {x=0, y=0},
  direction = 0
}

local function oriented_character(board)
  if board.direction == Compass.NORTH then return '^' end
  if board.direction == Compass.EAST then return '>' end
  if board.direction == Compass.SOUTH then return 'v' end
  if board.direction == Compass.WEST then return '<' end
end

for tick=1,NUMBER_OF_ITERATIONS do
  print('')
  print('')
  print('Time = ' .. tick)
  for j=10,-10,-1 do
    line = ''
    for i=-10,10 do
      local character = '-'

      if board[i] and board[i][j] then
        character = 'X'
      end

      if i == board.location.x and j == board.location.y then
        character = oriented_character(board)
      end
      line = line .. character
    end
    print(line)
  end
  board = AntWalk(board)
end
