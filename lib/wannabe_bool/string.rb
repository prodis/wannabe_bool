# frozen_string_literal: true

module WannabeBool::String
  TRUES  = %W{t true on y yes 1 sim}.freeze
  FALSES = %W{f false off n no 0 nao não}.freeze

  def to_b
    value = self.strip.downcase
    return true  if TRUES.include?(value)
    return false if FALSES.include?(value)

    WannabeBool.invalid_value_behaviour.call
  end

  include WannabeBool::Aliasing
end

class String
  include WannabeBool::String
end
