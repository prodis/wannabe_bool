module WannabeBool
  module Integer
    def to_b
      self != 0
    end
  end
end

class Integer
  include WannabeBool::Integer
end
