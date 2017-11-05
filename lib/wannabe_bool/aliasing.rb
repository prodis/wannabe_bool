module WannabeBool::Aliasing
  def self.included base
    base.class_eval do
      alias_method :to_bool, :to_b
      alias_method :to_boolean, :to_b
    end
  end

  def to_b
    raise NotImplementedError
  end
end
