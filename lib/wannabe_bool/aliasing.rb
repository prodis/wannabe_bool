module WannabeBool::Aliasing
  def self.included(base)
    base.send(:alias_method, :to_bool, :to_b)
    base.send(:alias_method, :to_boolean, :to_b)
  end

  def to_b
    raise NotImplementedError
  end
end
