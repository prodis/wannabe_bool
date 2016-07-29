module WannabeBool::InvalidValueBehaviour
  module False
    def self.execute
      false
    end
  end

  module Nil
    def self.execute
      nil
    end
  end

  module Error
    def self.execute
      raise ArgumentError, 'is not a valid boolean representation'
    end
  end
end
