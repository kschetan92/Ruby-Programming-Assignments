require "test/unit"

class Node
  attr_accessor :value, :pointer

    def initialize node_value, next_node
        @value = node_value
        @pointer = next_node
    end
end

class LinkedList

  def initialize(node_value)
    @head_node = Node.new(node_value, nil)
  end

  def add(node_value)
    current_node = @head_node
    while current_node.pointer != nil
      current_node = current_node.pointer
    end
    current_node.pointer = Node.new(node_value, nil)
  end

  def delete(delete_value)
    current_node = @head_node
    if (current_node.value == delete_value)
      @head_node = current_node.pointer
    else

      while (current_node != nil) && (current_node.pointer != nil) && ((current_node.pointer).value != delete_value)
                  current_node = current_node.pointer
      end
      if (current_node != nil) && (current_node.pointer != nil)
        current_node.pointer = (current_node.pointer).pointer  
      end
    end
  end

  def search(search_key)
    current_node = @head_node
    if (current_node.value == search_key)
      "#{search_key} found"
    else
      while (current_node != nil) && (current_node.value == search_key)
       "#{search_key} found"
        exit
      end
      "#{search_key} not found"
    end
  end

  def display_list

    list = []
    current_node = @head_node
      while current_node.pointer != nil 
        list << current_node.value
        current_node = current_node.pointer
      end
      list << current_node.value
    end
end

class TestLinkedList < Test::Unit::TestCase

  def test_linked_list

    linked_list = LinkedList.new(10)
    linked_list.add(20)
    linked_list.add(30)
    linked_list.add(40)
    linked_list.add(50)
    linked_list.add(60)

    assert_equal([10,20,30,40,50,60], linked_list.display_list)
    
    linked_list.delete(30)
    assert_equal([10,20,40,50,60], linked_list.display_list)
  end
end