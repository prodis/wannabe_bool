# encoding: utf-8
module WannabeBool
  module String
    TRUE_VALUES = %W{1 t true on y yes}.freeze

    def to_b
      TRUE_VALUES.include?(self.strip.downcase)
    end
  end
end

class String
  include WannabeBool::String
end
