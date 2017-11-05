RSpec.describe WannabeBool::Nil do
  context NilClass do
    subject { nil }

    describe '#to_b' do
      it { expect(subject.to_b).to be false }
    end

    describe '#to_bool' do
      it { expect(subject.to_bool).to be false }
    end

    describe '#to_boolean' do
      it { expect(subject.to_boolean).to be false }
    end
  end
end
