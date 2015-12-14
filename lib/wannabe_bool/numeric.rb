module WannabeBool::Numeric
  def to_b
    !self.zero?
  end
end

class Numeric
  include WannabeBool::Numeric
end
