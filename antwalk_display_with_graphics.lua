local AntWalk = require('antwalk')
local DisplayGrid = require 'lib/lua-board-display/src/DisplayGrid'

local count_x = 16
local count_y = 12

local image_config = {
  width = 50,
  height = 50,
  count_x = count_x,
  count_y = count_y
}

local display_grid = DisplayGrid(image_config, 100)
local ant_board = {
  location = {x=0, y=0},
  direction = 'north'
}

display_grid.run(function()
  ant_board = AntWalk(ant_board)
  for i = 1, count_x do
    for j = 1, count_y do
      local x = i - math.floor(count_x / 2)
      local y = j - math.floor(count_y / 2)
      if ant_board[x .. ',' .. y] then
        display_grid.display_image(i, j, 'images/black.png')
      else
        display_grid.display_image(i, j, 'images/white.png')
      end
      if x == ant_board.location.x and y == ant_board.location.y then
        display_grid.display_image(i, j, 'images/ant_' .. ant_board.direction .. '.png')
      end
    end
  end
end)
