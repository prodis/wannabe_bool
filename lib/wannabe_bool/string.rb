module WannabeBool::String
  TRUES = %W{t true on y yes 1}.freeze

  def to_b
    TRUES.include?(self.strip.downcase)
  end
end

class String
  include WannabeBool::String
end
