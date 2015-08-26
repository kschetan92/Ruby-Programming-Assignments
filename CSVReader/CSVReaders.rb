class CSVReader
  require "csv"

  def self.inherited(subclass)
    @subclass = subclass
    @csv_container = CSV.read("#{@subclass}.csv", :headers => true).to_a
    @headers = CSV.open("#{@subclass}.csv", 'r') { |csv| csv.first }
    @headers.each do |method| 
      class_eval("attr_accessor :#{method}") 

      class_eval %Q"
        def #{@subclass}.find_by_#{method}(argument)
          #{@csv_container}.each do |row|
            0.upto((row.length)-1) do |index|  
              if(row[index] == argument)
                return process_results(row)
              end
            end
          end
        end
      "
  end

    class_eval %Q"
        def #{@subclass}.process_results(row)
          subclass_object = #{@subclass}.new 
          #{@headers}.each_with_index do |method, index|
            method = \"@\"<<method
            subclass_object.instance_variable_set(method, row[index])
          end
          return subclass_object
        end
      "
  end  

end

class Employee < CSVReader
end

class Students < CSVReader
end

student = Students.find_by_name("Rahul")
p student
p student.name
p student.age
p student.address


employee = Employee.find_by_department("Finance")
p employee
p employee.name
p employee.age
p employee.department