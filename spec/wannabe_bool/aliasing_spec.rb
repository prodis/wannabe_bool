RSpec.describe WannabeBool::Aliasing do
  let(:anonymous_class) { Class.new { include WannabeBool::Aliasing } }

  # When there is no to_b method on the parent class,
  # this module should raise NotImplementedError for all the three methods
  describe '#to_b' do
    it 'should raise NotImplementedError' do
      expect{ anonymous_class.new.to_b }.to raise_error(NotImplementedError)
    end
  end

  describe '#to_bool' do
    it 'should raise NotImplementedError' do
      expect{ anonymous_class.new.to_bool }.to raise_error(NotImplementedError)
    end
  end

  describe '#to_boolean' do
    it 'should raise NotImplementedError' do
      expect{ anonymous_class.new.to_boolean }.to raise_error(NotImplementedError)
    end
  end
end
