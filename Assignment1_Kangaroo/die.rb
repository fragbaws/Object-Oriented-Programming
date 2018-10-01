class Die

  attr_accessor :stats, :total_rolls

  def initialize
    @stats = {:north => 0, :east => 0, :south => 0, :west => 0} # Hash table storing die statistics
    @total_rolls = 0
  end

  # Randomly selects the direction of Skippy's next hop on the grid
  def direction

    @total_rolls +=1

    case rand(4)
    when 0
      @stats[:north] +=1
      :north
    when 1
      @stats[:east] +=1
      :east
    when 2
      @stats[:south] +=1
      :south
    when 3
      @stats[:west] +=1
      :west

    end
  end


end
