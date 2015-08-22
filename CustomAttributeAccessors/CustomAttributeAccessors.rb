require "test/unit"

class CustomAttributeAccessors

  def self.myattr_reader(*args)
    args.each do |method_name|
      self.class_eval("def #{method_name}; @#{method_name}; end")
    end
  end

  def self.myattr_writer(*args)
    args.each do |method_name|
      self.class_eval("def #{method_name}=(argument); @#{method_name}=argument; end")
    end      
  end

  def self.myattr_accessor(*args)
    args.each do |method_name|

      myattr_writer(method_name)
      
      myattr_reader(method_name)

    end  
  end
end

class CustomAttributeUser < CustomAttributeAccessors
  myattr_accessor :name

  def initialize

  end

  def myattr_accessor_caller
    p name
  end

end

class TestCustomAttributes < Test::Unit::TestCase
  def test_attribute_accessor
    person = CustomAttributeUser.new
    person.name = "Chetan"
    assert_equal("Chetan", person.myattr_accessor_caller)
  end
end