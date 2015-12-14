describe WannabeBool::Boolean do
  context TrueClass do
    subject { true }

    describe '#to_b' do
      it { expect(subject.to_b).to be true }
    end
  end

  context FalseClass do
    subject { false }

    describe '#to_b' do
      it { expect(subject.to_b).to be false }
    end
  end
end
