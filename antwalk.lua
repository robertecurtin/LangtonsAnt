local function move_in_current_direction(board)
  local direction =
    {
      [0] = {x=0, y=1},  --North
      [1] = {x=1, y=0},  --East
      [2] = {x=0, y=-1}, --South
      [3] = {x=-1, y=0}  --West
    }

  direction = direction[board.direction]
  board.location.x = board.location.x + direction.x
  board.location.y = board.location.y + direction.y
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
  board.direction = board.direction - 1
  if board.direction < 0 then board.direction = 3 end
  return move_in_current_direction(board)
end

local function move_right(board)
  board.direction = board.direction + 1
  if board.direction > 3 then board.direction = 0 end
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
