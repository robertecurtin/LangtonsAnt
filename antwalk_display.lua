local AntWalk = require('antwalk')

local NUMBER_OF_ITERATIONS = 200

local board = {
  location = {x=0, y=0},
  direction = 'north'
}

local function oriented_character(board)
  if board.direction == 'north' then return '^' end
  if board.direction == 'east' then return '>' end
  if board.direction == 'south' then return 'v' end
  if board.direction == 'west' then return '<' end
end

for tick=1,NUMBER_OF_ITERATIONS do
  print('')
  print('')
  print('Time = ' .. tick)
  os.execute('sleep .1')
  for j=10,-10,-1 do
    line = ''
    for i=-10,10 do
      local character = '-'

      if board[i .. ',' .. j] then
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
