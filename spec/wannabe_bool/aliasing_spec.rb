RSpec.describe WannabeBool::Aliasing do
  class FakeAliasing
    # Fake class does not implement #to_b method.
    include WannabeBool::Aliasing
  end

  context 'when #to_b is not available in included class' do
    subject { FakeAliasing.new }

    describe '#to_b' do
      it 'raises NotImplementedError' do
        expect { subject.to_b }.to raise_error(NotImplementedError)
      end
    end

    describe '#to_bool' do
      it 'raises NotImplementedError' do
        expect { subject.to_bool }.to raise_error(NotImplementedError)
      end
    end

    describe '#to_boolean' do
      it 'raises NotImplementedError' do
        expect { subject.to_boolean }.to raise_error(NotImplementedError)
      end
    end
  end
end
