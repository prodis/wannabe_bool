module WannabeBool::Configuration
  def invalid_value_behaviour=(behaviour)
    raise ArgumentError, 'behaviour does not respond to call method' unless behaviour.respond_to?(:call)

    @invalid_value_behaviour = behaviour
  end

  def invalid_value_behaviour
    @invalid_value_behaviour ||= WannabeBool::InvalidValueBehaviour::False
  end
end

module WannabeBool
  extend WannabeBool::Configuration
end
