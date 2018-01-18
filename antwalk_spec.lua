local AntWalk = require('antwalk')

describe('walk', function()

    it('should move right on an empty board', function()
      local board = {
        location = {x=0, y=0},
        direction = 'north'
      }

      board = AntWalk(board)
      assert.are.same({x=1, y=0}, board.location)
      assert.are.same('east', board.direction)
    end)

    it('should move left on an active space', function()
      local board = {
        location = {x=0, y=0},
        direction = 'north',
        ['0,0'] = true
      }

      board = AntWalk(board)
      assert.are.same({x=-1, y=0},  board.location)
      assert.are.same('west', board.direction)
    end)

    it('should move right twice on an empty board', function()
      local board = {
        location = {x=0, y=0},
        direction = 'north'
      }

      board = AntWalk(board)
      board = AntWalk(board)
      assert.are.same({x=1, y=-1}, board.location)
      assert.are.same('south', board.direction)
    end)

    it('should move left twice on an empty board', function()
      local board = {
        location = {x=0, y=0},
        direction = 'north',
        ['0,0'] = true,
        ['-1,0'] = true
      }

      board = AntWalk(board)
      board = AntWalk(board)
      assert.are.same({x=-1, y=-1}, board.location)
      assert.are.same('south', board.direction)
    end)

    it('should flip an inactive space', function()
      local board = {
        location = {x=0, y=0},
        direction = 'north'
      }

      board = AntWalk(board)
      assert.are.same(true, board['0,0'])
    end)

    it('should flip an active space', function()
      local board = {
        location = {x=0, y=0},
        direction = 'north',
        ['0.0'] = true
      }

      board = AntWalk(board)
      assert.are.same(nil, board['0,0'])
    end)
end)
