require_relative 'constants'

class ToyRobot

  attr_accessor :x
  attr_accessor :y
  attr_accessor :f
  attr_accessor :grid

  def initialize(grid)
    self.grid = grid
  end

  def place(x, y, f)
    self.x = x.to_i
    self.y = y.to_i
    self.f = f
  end

  def move
    new_coords =
      case f
      when NORTH
        [x, y+1]
      when EAST
        [x+1, y]
      when SOUTH
        [x, y-1]
      when WEST
        [x-1, y]
      end

    if grid.coords_exist?(*new_coords)
      self.x, self.y = *new_coords
    end
  end

  def left
    index_of_current_direction = DIRECTIONS.index(f)
    # set curret facing to the previous direction in the list
    self.f = DIRECTIONS[index_of_current_direction-1]
  end

  def right
    index_of_current_direction = DIRECTIONS.index(f)
    # set current facing to the next direction in the list, or the first one if it's the last
    if index_of_current_direction == DIRECTIONS.length-1
      new_index = 0
    else
      new_index = index_of_current_direction + 1
    end
    self.f = DIRECTIONS[new_index]
  end

  def report
    puts "#{x},#{y},#{f}"
  end

end
