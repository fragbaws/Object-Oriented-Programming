class Point

  attr_accessor :x, :y

  def initialize(x ,y)
    @x,@y = x,y
  end

  # Overwrites the method to_s to print 'point' in the following format
  def to_s
    "(#{@x}," + "#{@y})"
  end

end



