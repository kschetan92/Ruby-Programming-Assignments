class CSVReader
  require "csv"

  def self.inherited(subclass)
    @subclass = subclass
    @csv_container = CSV.read("/home/chetan/Desktop/Samples/#{@subclass}.csv", :headers => true).to_a
    @headers = CSV.open("/home/chetan/Desktop/Samples/#{@subclass}.csv", 'r') { |csv| csv.first }

    @headers.each do |method| 

      class_eval("attr_accessor :#{method}") 

      class_eval %Q"
        def self.find_by_#{method}(argument)
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
        def self.process_results(row)
          subclass_object = #{@subclass}.new 
          p subclass_object
          p subclass_object = row
        end
      "

    end
  end

end

class Students < CSVReader

end
puts
Students.find_by_department("Mechanical")

class Employee < CSVReader

end
puts
Employee.find_by_name("Chetan")