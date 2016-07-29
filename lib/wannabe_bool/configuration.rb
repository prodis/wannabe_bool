module WannabeBool::Configuration
  ALLOWED_INVALID_VALUE_BEHAVIOURS = [:false, :nil, :exception]

  def invalid_value_behaviour=(behaviour)
    unless ALLOWED_INVALID_VALUE_BEHAVIOURS.include?(behaviour)
      raise ArgumentError, ":#{behaviour} is not one of allowed behaviours: :#{ALLOWED_INVALID_VALUE_BEHAVIOURS.join(', :')}"
    end

    @invalid_value_behaviour = behaviour
  end

  def invalid_value_behaviour
    @invalid_value_behaviour ||= :false
  end
end

module WannabeBool
  extend WannabeBool::Configuration
end
