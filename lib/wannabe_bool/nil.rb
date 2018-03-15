# frozen_string_literal: true
module WannabeBool::Nil
  def to_b
    false
  end

  include WannabeBool::Aliasing
  include WannabeBool::PredicateMethods
end

class NilClass
  include WannabeBool::Nil
end
