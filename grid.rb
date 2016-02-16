require_relative 'constants'

class Grid

  attr_accessor :width
  attr_accessor :depth

  def initialize(width=5, depth=5)
    self.width = width
    self.depth = depth
  end

  def coords_exist?(x, y)
    x >= 0 && y >= 0 && x < self.width && y < self.depth 
  end

end
