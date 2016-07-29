RSpec.describe WannabeBool::InvalidValueBehaviour do
  context 'False' do
    describe '#execute' do
      subject { WannabeBool::InvalidValueBehaviour::False.execute }
      it { is_expected.to be false }
    end
  end

  context 'Nil' do
    describe '#execute' do
      subject { WannabeBool::InvalidValueBehaviour::Nil.execute }
      it { is_expected.to be nil }
    end
  end

  context 'Error' do
    describe '#execute' do
      subject { WannabeBool::InvalidValueBehaviour::Error.execute }
      it { expect { subject }.to raise_error(ArgumentError, 'is not a valid boolean representation') }
    end
  end
end
