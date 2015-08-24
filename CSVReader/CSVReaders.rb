class CSVReader
  require "csv"
  attr_accessor :name, :age, :department

  def self.inherited(subclass)
    @@subclass = subclass
    @@csv_container = CSV.read("/home/chetan/Desktop/Samples/#{@@subclass}.csv", :headers => true)
  end

  def self.find_by_name(name)
    @@csv_container.each do |row|
      if(row[0] == name)
        process_results(row)
      end
    end
  end

  def self.find_by_age(age)
    @@csv_container.each do |row|
      if(row[1] == age)
        process_results(row)
      end
    end
  end

  def self.find_by_department(department)
    @@csv_container.each do |row|
      if(row[2] == department)
        process_results(row)
      end
    end
  end

  def self.process_results(row)
    subclass_object = @@subclass.new
    subclass_object.name = row[0]
    subclass_object.age = row[1].to_i
    subclass_object.department = row[2]
    p subclass_object
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