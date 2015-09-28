module WannabeBool
  module Object
    TRUE_VALUES = %W{1 t true on y yes}.freeze

    def to_b
      TRUE_VALUES.include?(self.to_s.strip.downcase)
    end
  end
end

class String
  include WannabeBool::Object
end

class Symbol
  include WannabeBool::Object
end
