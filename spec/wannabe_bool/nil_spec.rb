RSpec.describe WannabeBool::Nil do
  context NilClass do
    subject { nil }

    describe '#to_b' do
      it { expect(subject.to_b).to be false }
    end
  end
end
