RSpec.describe WannabeBool::Boolean do
  context TrueClass do
    subject { true }

    describe '#to_b' do
      it { expect(subject.to_b).to be true }
      it { expect(subject.to_boolean).to be subject.to_b }
      it { expect(subject.to_bool).to be subject.to_b }      
    end
  end

  context FalseClass do
    subject { false }

    describe '#to_b' do
      it { expect(subject.to_b).to be false }
      it { expect(subject.to_boolean).to be subject.to_b }
      it { expect(subject.to_bool).to be subject.to_b }      
    end
  end
end
