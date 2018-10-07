class Volunteer < Employee

  attr_accessor :employee,:charity

  def initialize(name,pps,hours,pay,charity_name)
    super(name,hours,pay,pps)
    @charity = charity_name
  end
end