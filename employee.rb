class Employee < Person

  attr_accessor :person, :hours, :rate
  def initialize(name,hour,pay, pps)
    super(name,pps)
    @hours = hour
    @rate = pay
  end

  def to_s
    "#{@name}, PPS: #{@pps}, earns $#{@hours*@rate} per week"
  end
end