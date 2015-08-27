class CSVReader
  require "csv"

  def self.inherited(subclass)

    begin
      @subclass = subclass
      @csv_container = CSV.read("#{@subclass}.csv", :headers => true).to_a
      @headers = CSV.open("#{@subclass}.csv", 'r') { |csv| csv.first }
      @headers.each do |method| 
        class_eval("attr_accessor :#{method}") 

        class_eval %Q"
          def #{@subclass}.find_by_#{method}(argument)
            matched_objects = []
            #{@csv_container}.each do |row|
              row.each do |data|  
                if(data == argument)
                  matched_objects << process_results(row)
                end  
              end
            end
            return matched_objects
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

    rescue IOError => e
      puts "The file #{@subclass}.rb is not available in the specified path, please verify your path and try again."
    rescue StandardError => s
      raise
    end
  end  
end

class Employee < CSVReader
end

class Students < CSVReader
end

student = Students.find_by_name("Rahul")
student.each { |object| p object }

employee = Employee.find_by_department("Finance")
employee.each { |object| p object }