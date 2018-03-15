# frozen_string_literal: true
module WannabeBool::Numeric
  def to_b
    !self.zero?
  end

  include WannabeBool::Aliasing
  include WannabeBool::PredicateMethods
end

class Numeric
  include WannabeBool::Numeric
end
