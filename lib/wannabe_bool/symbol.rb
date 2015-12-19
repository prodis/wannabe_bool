module WannabeBool::Symbol
  def to_b
    self.to_s.to_b
  end
end

class Symbol
  include WannabeBool::Symbol
end
