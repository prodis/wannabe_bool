module WannabeBool
  module Object
    TRUE_VALUES = %W{t true on y yes}.freeze

    def to_b
      value = self.to_s.strip.downcase

      if TRUE_VALUES.include?(value)
        true
      else
        value.to_i.to_b
      end
    end
  end
end

class String
  include WannabeBool::Object
end

class Symbol
  include WannabeBool::Object
end
