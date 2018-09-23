class Grid

  attr_accessor :dimension

  def initialize(dimension)
    @dimension = dimension
  end

  # Used for checking if Skippy's next location is out of bounds on the grid
  def out_of_bounds?(point)
    point.x < 0 || point.y < 0 || point.x >= @dimension || point.y >= @dimension
  end

end