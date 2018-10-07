require_relative 'die.rb'
require_relative 'point.rb'
require_relative 'grid.rb'
require_relative 'kangaroo.rb'

  puts "Enter dimension of grid >= 1"
  dimension = gets.to_i

  destination_x = dimension - 1
  destination_y = dimension - 1

  grid = Grid.new(dimension)
  die = Die.new
  skippy = Kangaroo.new

  puts "Skippy is located at location: " + skippy.skippy_location.to_s
  puts "Let's see if he can find his way to: (" + destination_x.to_s + "," + destination_y.to_s  + ")"

  while not skippy.arrived_at_destination?(grid)
    direction = die.direction

    if skippy.can_hop_to?(direction,grid)
      skippy.hop!(direction)
      puts "Skippy hopped to: " + skippy.skippy_location.to_s
    else
      puts "Oops, cannot head " + direction.to_s + " as it is out of bounds!"

    end
  end

  puts "\nSkippy has reached his destination in " + skippy.hops.to_s + " hops!"
  puts "\nDie Statistics:"
  puts "Total throws: " + die.total_rolls.to_s

  # Prints die statistics for each direction thrown
  die.stats.each do |key, value|
    puts "\t#{key.to_s}: #{value.to_s}"
  end




