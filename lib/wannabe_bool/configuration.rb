module WannabeBool::Configuration
  ALLOWED_INVALID_VALUE_BEHAVIOURS = [:false, :nil, :error]

  def invalid_value_behaviour=(behaviour)
    unless ALLOWED_INVALID_VALUE_BEHAVIOURS.include?(behaviour)
      raise ArgumentError, ":#{behaviour} is not one of allowed behaviours: :#{ALLOWED_INVALID_VALUE_BEHAVIOURS.join(', :')}"
    end

    @invalid_value_behaviour = behaviour
    @invalid_value_behaviour_module = WannabeBool::InvalidValueBehaviour.const_get(behaviour.to_s.capitalize)
  end

  def invalid_value_behaviour
    @invalid_value_behaviour ||= :false
  end

  def invalid_value_behaviour_module
    @invalid_value_behaviour_module ||= WannabeBool::InvalidValueBehaviour::False
  end
end

module WannabeBool
  extend WannabeBool::Configuration
end
