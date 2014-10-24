# encoding: utf-8
module WannabeBool
  module Nil
    def to_b
      false
    end
  end
end

class NilClass
  include WannabeBool::Nil
end
