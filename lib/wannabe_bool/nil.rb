module WannabeBool::Nil
  def to_b
    false
  end

  alias_method 'to_boolean', 'to_b'
  alias_method 'to_bool', 'to_b'
end

class NilClass
  include WannabeBool::Nil
end
