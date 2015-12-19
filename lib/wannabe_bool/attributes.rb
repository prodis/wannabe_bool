module WannabeBool::Attributes
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def attr_wannabe_bool(*attributes)
      attributes.each do |attr|
        raise ArgumentError, "#{attr} method is not defined." unless method_defined?(attr)

        next if method_defined?("#{attr}?")

        define_method("#{attr}?") do
          send(attr).to_b
        end
      end
    end
  end
end
