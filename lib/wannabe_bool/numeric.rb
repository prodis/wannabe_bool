module WannabeBool::Numeric
  def to_b
    !self.zero?
  end

  alias_method 'to_boolean', 'to_b'
  alias_method 'to_bool', 'to_b'
end

class Numeric
  include WannabeBool::Numeric
end
