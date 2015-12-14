module WannabeBool::Boolean
  def to_b
    self
  end
end

class TrueClass
  include WannabeBool::Boolean
end

class FalseClass
  include WannabeBool::Boolean
end
