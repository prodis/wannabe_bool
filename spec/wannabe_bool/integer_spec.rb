describe WannabeBool::Integer do
  context Integer do
    describe '#to_b' do
      context 'when value is 0' do
        subject { 0 }
        it { expect(subject.to_b).to eql false }
      end

      context 'positive values' do
        (1..9).each do |value|
          context "when value is #{value}" do
            subject { value }
            it { expect(subject.to_b).to eql true }
          end
        end
      end

      context 'negative values' do
        (-9..-1).each do |value|
          context "when value is #{value}" do
            subject { value }
            it { expect(subject.to_b).to eql true }
          end
        end
      end
    end
  end
end
