module WannabeBool::Object
  TRUE_VALUES = %W{t true on y yes 1}.freeze

  def to_b
    value = self.to_s.strip.downcase
    TRUE_VALUES.include?(value)
  end
end

class String
  include WannabeBool::Object
end

class Symbol
  include WannabeBool::Object
end
