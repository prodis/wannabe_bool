module WannabeBool::Boolean
  def to_b
    self
  end

  alias_method 'to_boolean', 'to_b'
  alias_method 'to_bool', 'to_b'  
end

class TrueClass
  include WannabeBool::Boolean
end

class FalseClass
  include WannabeBool::Boolean
end
