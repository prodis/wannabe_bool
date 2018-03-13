# frozen_string_literal: true
module WannabeBool::Boolean
  def to_b
    self
  end

  include WannabeBool::Aliasing
end

class TrueClass
  include WannabeBool::Boolean
end

class FalseClass
  include WannabeBool::Boolean
end
