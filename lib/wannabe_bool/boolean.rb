module WannabeBool
  module Boolean
    def to_b
      self
    end
  end
end

class TrueClass
  include WannabeBool::Boolean
end

class FalseClass
  include WannabeBool::Boolean
end
