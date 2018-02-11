local AntWalk = require('antwalk')
local Board = require 'lib/lua-board-display/src/board'

local count_x = 16
local count_y = 12

local image_config = {
  width = 50,
  height = 50,
  count_x = count_x,
  count_y = count_y
}
local delay = true
local board_display = Board(image_config, 200)
local ant_board = {
  location = {x=0, y=0},
  direction = 'north'
}

board_display.run(function()
  ant_board = AntWalk(ant_board)
  for i = 1, count_x do
    for j = 1, count_y do
      local x = i - ( count_x / 2 )
      local y = j - ( count_y / 2 )
      if ant_board[x .. ',' .. y] then
        board_display.display_image(i, j, 'images/black.png')
      else
        board_display.display_image(i, j, 'images/white.png')
      end
      if x == ant_board.location.x and y == ant_board.location.y then
        board_display.display_image(i, j, 'images/ant_' .. ant_board.direction .. '.png')
      end
    end
  end
end)
