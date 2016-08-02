RSpec.describe WannabeBool::InvalidValueBehaviour do
  context 'False' do
    describe '#call' do
      subject { WannabeBool::InvalidValueBehaviour::False.call }
      it { is_expected.to be false }
    end
  end

  context 'Nil' do
    describe '#call' do
      subject { WannabeBool::InvalidValueBehaviour::Nil.call }
      it { is_expected.to be nil }
    end
  end

  context 'Error' do
    describe '#call' do
      subject { WannabeBool::InvalidValueBehaviour::Error.call }
      it { expect { subject }.to raise_error(ArgumentError, 'is not a valid boolean representation') }
    end
  end
end
