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

emp = [Employee.new("Chetan", 23,"Bangalore"), Employee.new("Akash", 27,"Mangalore")]
p emp.sort