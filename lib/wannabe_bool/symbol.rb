# frozen_string_literal: true
module WannabeBool::Symbol
  def to_b
    self.to_s.to_b
  end

  include WannabeBool::Aliasing
end

class Symbol
  include WannabeBool::Symbol
end
