class CustomAttributeAccessors

  def self.myattr_accessor(*args)
    args.each do |method_name|

      #setter_Method
      self.class_eval("def #{method_name}=(argument); @#{method_name}=argument; end")
      
      #getter_Method
      self.class_eval("def #{method_name}; @#{method_name}; end")

    end  
  end

  def self.myattr_reader(*args)
    args.each do |method_name|
      self.class_eval("def #{method_name}; @#{method_name}; end")
    end
  end

  def self.myattr_writer(*args)
    args.each do |method|
      self.class_eval("def #{method_name}=(argument); @#{method_name}=argument; end")
    end      
  end

end