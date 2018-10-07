require_relative 'person.rb'
require_relative 'employee.rb'
require_relative 'manager.rb'
require_relative 'volunteer.rb'

john = Employee.new('John', 40, 8,123)
aoife = Manager.new('Aoife', 50, 12, 100,321)
kyle = Volunteer.new("Kyle", 1234,30,0,"NCVL")
puts john.to_s
puts aoife.to_s
puts kyle.employee.to_s