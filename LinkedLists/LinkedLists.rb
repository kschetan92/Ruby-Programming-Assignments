class LinkedLists

  def initialize(data)
    @list = []
    @list << data
  end

  def add(data)
    listLength = @list.length
    @list.insert(listLength, data)
  end
  
  def search(searchData)
    listLength = @list.length
    1.upto(listLength) do |nodePosition|
      if(@list[nodePosition] == searchData)
        puts "#{searchData} found at position #{nodePosition + 1}"
        exit
      end
    end
    puts "Sorry!!! ... data was not found"
  end

  def delete(data, position)
    listLength = @list.length
    @list.delete_at(position-1)
    puts "#{data} deleted at position #{position-1}"
  end

  def displayList
    @list.each { |data| print "#{data} -> " }
    puts " "
  end
  
end