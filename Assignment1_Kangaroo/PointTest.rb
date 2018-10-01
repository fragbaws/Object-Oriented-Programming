require 'test/unit'
require_relative 'point.rb'

class PointTest < Test::Unit::TestCase

  def setup
    @sample_point = Point.new(0,0)
  end

  def test_initialize
    assert_instance_of(Point, @sample_point, "sample_point should be an instance of class Point")
  end

  def test_to_s
    assert_equal(@sample_point.to_s, "(#{@sample_point.x},#{@sample_point.y})","sample_point should be printed in the format (x,y)")
  end

end