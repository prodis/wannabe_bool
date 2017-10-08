module WannabeBool::Symbol
  def to_b
    self.to_s.to_b
  end

  alias_method 'to_boolean', 'to_b'
  alias_method 'to_bool', 'to_b'  
end

class Symbol
  include WannabeBool::Symbol
end
