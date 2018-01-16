local AntWalk = require('antwalk')
local Compass = require('compass')

describe('walk', function()

    it('should move right on an empty board', function()
      local board = {
        location = {x=0, y=0},
        direction = Compass.NORTH
      }
      board = AntWalk(board)
      local result = board.location
      local expected = {x=1, y=0}
      assert.are.same(expected, result)

      result = board.direction
      expected = Compass.EAST
      assert.are.same(expected, result)
    end)

    it('should move left on an active space', function()
      local board = {
        location = {x=0, y=0},
        direction = Compass.NORTH,
        [0] = {[0] = 1}
      }
      board = AntWalk(board)
      local result = board.location
      local expected = {x=-1, y=0}
      assert.are.same(expected, result)

      result = board.direction
      expected = Compass.WEST
      assert.are.same(expected, result)
    end)

    it('should move right twice on an empty board', function()
      local board = {
        location = {x=0, y=0},
        direction = Compass.NORTH
      }
      board = AntWalk(board)
      board = AntWalk(board)
      local result = board.location
      local expected = {x=1, y=-1}
      assert.are.same(expected, result)

      result = board.direction
      expected = Compass.SOUTH
      assert.are.same(expected, result)
    end)

    it('should move left twice on an empty board', function()
      local board = {
        location = {x=0, y=0},
        direction = Compass.NORTH,
        [0] = {[0] = 1},
        [-1] = {[0] = 1}
      }
      board = AntWalk(board)
      board = AntWalk(board)
      local result = board.location
      local expected = {x=-1, y=-1}
      assert.are.same(expected, result)

      result = board.direction
      expected = Compass.SOUTH
      assert.are.same(expected, result)
    end)

    it('should flip an inactive space', function()
      local board = {
        location = {x=0, y=0},
        direction = Compass.NORTH
      }
      board = AntWalk(board)
      local result = board[0][0]
      local expected = true
      assert.are.same(expected, result)
    end)

    it('should flip an active space', function()
      local board = {
        location = {x=0, y=0},
        direction = Compass.NORTH,
        [0] = {[0] = true}
      }
      board = AntWalk(board)
      local result = board[0][0]
      local expected = nil
      assert.are.same(expected, result)
    end)
end)
