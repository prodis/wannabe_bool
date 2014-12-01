# encoding: utf-8
describe WannabeBool::Integer do
  context Integer do
    describe '#to_b' do
      context 'when value is 0' do
        subject { 0 }
        it { expect(subject.to_b).to eq false }
      end

      context 'when value is 1' do
        subject { 1 }
        it { expect(subject.to_b).to eq true }
      end

      (2..9).each do |value|
        context "when value is #{value}" do
          subject { value }
          it { expect(subject.to_b).to eq false }
        end
      end
    end
  end
end
