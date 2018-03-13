# frozen_string_literal: true
module WannabeBool::InvalidValueBehaviour
  module False
    def self.call
      false
    end
  end

  module Nil
    def self.call
      nil
    end
  end

  module Error
    def self.call
      raise ArgumentError, 'is not a valid boolean representation'
    end
  end
end
