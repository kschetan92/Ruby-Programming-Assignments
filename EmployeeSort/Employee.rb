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

  employee1 = Employee.new("Chetan", 23,"Bangalore")
  employee2 = Employee.new("Akash", 27,"Mangalore")
  employees = [employee1, employee2]
  employees.sort!
  assert_equal([employee2, employee1], employees)

end
end
