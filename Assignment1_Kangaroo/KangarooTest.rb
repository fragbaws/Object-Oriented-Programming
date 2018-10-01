require 'test/unit'
require_relative 'kangaroo.rb'
require_relative 'point.rb'
require_relative 'grid.rb'

class KangarooTest < Test::Unit::TestCase

  def setup
    @skippy = Kangaroo.new
  end

  def test_initialize
    assert_equal(0, @skippy.hops, "Skippy's hops should be initialised to 0")
    assert_equal(0 ,@skippy.skippy_location.x.to_i, "Skippy's X Co-ordinate should be initialised to 0")
    assert_equal(0 ,@skippy.skippy_location.y.to_i, "Skippy's Y Co-ordinate should be initialised to 0")

  end

  def test_hop!
    @skippy.hop!(:north)
    assert_equal(1,@skippy.hops, "Hops counter should increment with each hop.")
    assert_equal(1, @skippy.skippy_location.y.to_i, "Skippy should move up 1 slot on the grid, since direction is :north")
  end

  def test_arrived_at_destination?
    grid = Grid.new(2)
    @skippy.hop!(:north)
    @skippy.hop!(:east)
    assert(@skippy.arrived_at_destination?(grid), "Skippy should be at his destination!")
  end


end