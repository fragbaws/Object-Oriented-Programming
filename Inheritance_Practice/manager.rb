class Manager < Employee

  attr_reader :bonus
  def initialize(name, hours, pay, weekly_bonus, pps)
    super(name,hours,pay,pps)
    @bonus = weekly_bonus
  end

  def to_s
    puts super.to_s + " and a bonus of $#{@bonus}"
  end
end