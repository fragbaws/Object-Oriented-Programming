require 'test/unit'
require_relative 'die.rb'

class DieTest < Test::Unit::TestCase

  def setup
    @die = Die.new
  end

  def test_initialize
    directions = [:north, :east, :south, :west]
    assert_equal(0, @die.total_rolls.to_i, "Total rolls must be initialized to 0")
    i = 0
    @die.stats.keys do |key|
      assert_equal(directions[i], key, "Current key must be #{directions[i]}")
      i+=1
    end
  end

  def test_totalrolls
    10.times{@die.direction}
    assert_equal(10, @die.total_rolls.to_i, "totalrolls must hold value 10 after 10 rolls")
  end


  def test_direction
    directions = [:north, :east, :south, :west]
    curr_direction = @die.direction
    assert_include(directions, curr_direction, "#{curr_direction} should be contained in array directions")
  end

end
