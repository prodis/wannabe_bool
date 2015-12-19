module WannabeBool::Nil
  def to_b
    false
  end
end

class NilClass
  include WannabeBool::Nil
end
