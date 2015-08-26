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
                process_results(row)
              end
            end
          end
        end
      "

      class_eval %Q"
        def #{@subclass}.process_results(row)
          subclass_object = #{@subclass}.new 
          p subclass_object
          p subclass_object = row
        end
      "
    end
  end  

end

class Employee < CSVReader
end

class Students < CSVReader
end

Students.find_by_name("Rahul")
Employee.find_by_department("Finance")