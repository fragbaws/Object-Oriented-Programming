class Kangaroo

  attr_accessor :skippy_location, :hops

  def initialize
    @skippy_location = Point.new(0,0)
    @hops = 0
  end


  # Used for checking if Skippy can hop to the passed in direction
  def hop_test!(direction)

    test_location = skippy_location.clone

    if direction == :north
      Point.new(test_location.x, test_location.y+1)
    elsif direction == :east
      Point.new(test_location.x+1, test_location.y)
    elsif direction == :south
      Point.new(test_location.x, test_location.y-1)
    elsif direction == :west
      Point.new(test_location.x-1, test_location.y)

    end
  end

  # Actual method used for moving Skippy around the grid
  def hop!(direction)

    @hops += 1

    if direction == :north
      @skippy_location = Point.new(@skippy_location.x, @skippy_location.y+1)
    elsif direction == :east
      @skippy_location = Point.new(@skippy_location.x+1, @skippy_location.y)
    elsif direction == :south
      @skippy_location = Point.new(@skippy_location.x, @skippy_location.y-1)
    elsif direction == :west
      @skippy_location = Point.new(@skippy_location.x-1, @skippy_location.y)

    end
  end

  # Checking if Skippy is able to hop to the next location on the grid
  def can_hop_to?(direction, grid)

    new_location = hop_test!(direction)

    if grid.out_of_bounds?(new_location)
      false
    else
      true

    end
  end

  def arrived_at_destination?(grid)
    @skippy_location.x == grid.dimension-1 && @skippy_location.y == grid.dimension-1
  end


end