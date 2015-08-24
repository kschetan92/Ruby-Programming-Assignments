class CSVReader
  require "csv"
  attr_accessor :name, :age, :department
  @@employees = CSV.read("/home/chetan/Desktop/Samples/Employee.csv", :headers => true)

  def self.find_by_name(employee_name)
    @@employees.each do |employee|
      if(employee[0] == employee_name)
        process_results(employee)
      end
    end
  end

  def self.find_by_age(employee_age)
    @@employees.each do |employee|
      if(employee[1] == employee_age)
        process_results(employee)
      end
    end
  end

  def self.find_by_department(employee_department)
    @@employees.each do |employee|
      if(employee[2] == employee_department)
        process_results(employee)
      end
    end
  end

  def self.process_results(employee)
    employee_object = Employee.new
    employee_object.name = employee[0]
    employee_object.age = employee[1].to_i
    employee_object.department = employee[2]
    p employee_object
  end
end

class Employee < CSVReader

end

Employee.find_by_name("Chetan")
Employee.find_by_age("23")
Employee.find_by_department("ROR")

#Creating a new Employee
new_employee = Employee.new
new_employee.name = "Rahul"
new_employee.age = 34
new_employee.department = "IT"
p new_employee