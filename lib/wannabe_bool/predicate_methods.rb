# frozen_string_literal: true
module WannabeBool::PredicateMethods
  def true?
    self.to_b
  end

  def false?
    !self.to_b
  end
end
