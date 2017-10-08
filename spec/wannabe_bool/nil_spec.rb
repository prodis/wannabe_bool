RSpec.describe WannabeBool::Nil do
  context NilClass do
    subject { nil }

    describe '#to_b' do
      it { expect(subject.to_b).to be false }
      it { expect(subject.to_boolean).to be subject.to_b }
      it { expect(subject.to_bool).to be subject.to_b }
    end
  end
end
