require "test/unit"

class Employee
include Comparable
attr_accessor :name

  def <=>(other_Employee)
    self.name <=> other_Employee.name
  end

  def initialize(name, age, address)
    @name = name
    @age = age
    @address = address
  end

end

class TestEmployee < Test::Unit::TestCase

def test_employee_test

  emp1 = Employee.new("Chetan", 23,"Bangalore")
  emp2 = Employee.new("Akash", 27,"Mangalore")
  emps = [emp1, emp2]
  emps.sort!
  assert_equal([emp2, emp1], emps)

end
end
# emp1 = [Employee.new("Chetan", 23,"Bangalore").instance_variables, Employee.new("Akash", 27,"Mangalore")]
# p emps