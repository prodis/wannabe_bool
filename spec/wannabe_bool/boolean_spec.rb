# encoding: utf-8
describe WannabeBool::Boolean do
  context TrueClass do
    subject { true }

    describe '#to_b' do
      it { expect(subject.to_b).to eq true }
    end
  end

  context FalseClass do
    subject { false }

    describe '#to_b' do
      it { expect(subject.to_b).to eq false }
    end
  end
end
