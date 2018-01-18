  local left =
    {
      north = 'west',
      west = 'south',
      south = 'east',
      east = 'north'
    }

  local right =
    {
      north = 'east',
      west = 'north',
      south = 'west',
      east = 'south'
    }

  local direction =
  {
    north = {x = 0, y = 1},
    west = {x = -1, y = 0},
    south = {x = 0, y = -1},
    east = {x = 1, y = 0}
  }

local function move_in_current_direction(board)
  movement = direction[board.direction]
  board.location.x = board.location.x + movement.x
  board.location.y = board.location.y + movement.y
  return board
end

local function current_space_is_set(board)
  return board[board.location.x] and board[board.location.x][board.location.y]
end

local function clear_current_space(board)
  board[board.location.x][board.location.y] = nil
  if board[board.location.x] == {} then
    board[board.location.x] = nil
  end
  return board
end

local function set_current_space(board)
  if not board[board.location.x] then board[board.location.x] = {} end
  board[board.location.x][board.location.y] = true
  return board
end

local function flip_current_space(board)
  if current_space_is_set(board) then
    return clear_current_space(board)
  else
    return set_current_space(board)
  end
end

local function move_left(board)
  board.direction = left[board.direction]
  return move_in_current_direction(board)
end

local function move_right(board)
  board.direction = right[board.direction]
  return move_in_current_direction(board)
end

return function (board)
  if current_space_is_set(board) then
    board = flip_current_space(board)
    return move_left(board)
  else
    board = flip_current_space(board)
    return move_right(board)
  end
end
