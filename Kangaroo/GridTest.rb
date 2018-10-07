require 'test/unit'
require_relative 'grid.rb'
require_relative 'point.rb'

class GridTest < Test::Unit::TestCase

  def setup
    @grid = Grid.new(10)
  end

  def test_initialize
    assert_compare(@grid.dimension, :>=, 1, "Grid is to be of bigger dimension than 1")
  end

  def test_out_of_bounds
    point = Point.new(-1,0)
    assert_true(@grid.out_of_bounds?(point), "This point should be out of bounds on the grid")
  end

end