require "test/unit"

class Employee
include Comparable
attr_accessor :name

  def <=>nextEmployeeObject
    self.name <=> nextEmployeeObject.name
  end

  def inspect
    "#{@name}, #{@age}, #{@address}"
  end

  def initialize(name, age, address)
    @name = name
    @age = age
    @address = address
  end

end

class TestEmployee < Test::Unit::TestCase

  def test_EmployeeSort
    employee = [Employee.new("Chetan", 23,"Bangalore"), Employee.new("Akash", 27,"Mangalore")]
    assert_equal([Akash, 27, Mangalore, Chetan, 23, Bangalore], employee.sort)
  end
end

emp = [Employee.new("Chetan", 23,"Bangalore"), Employee.new("Akash", 27,"Mangalore")]
p emp.sort