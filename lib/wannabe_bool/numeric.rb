module WannabeBool
  module Numeric
    def to_b
      !self.zero?
    end
  end
end

class Numeric
  include WannabeBool::Numeric
end
