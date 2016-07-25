require 'bigdecimal'

RSpec.describe WannabeBool::Numeric do
  context Integer do
    describe '#to_b' do
      context 'when value is 0' do
        subject { 0 }
        it { expect(subject.to_b).to be false }
      end

      context 'positive values' do
        (1..9).each do |value|
          context "when value is #{value}" do
            subject { value }
            it { expect(subject.to_b).to be true }
          end
        end
      end

      context 'negative values' do
        (-9..-1).each do |value|
          context "when value is #{value}" do
            subject { value }
            it { expect(subject.to_b).to be true }
          end
        end
      end
    end
  end

  context Float do
    describe '#to_b' do
      context 'when value is 0.0' do
        subject { 0.0 }
        it { expect(subject.to_b).to be false }
      end

      context "when value is positive" do
        subject { Random.rand }
        it { expect(subject.to_b).to be true }
      end

      context "when value is negative" do
        subject { Random.rand * -1 }
        it { expect(subject.to_b).to be true }
      end
    end
  end

  context BigDecimal do
    describe '#to_b' do
      context 'when value is 0.0' do
        subject { BigDecimal('0.0') }
        it { expect(subject.to_b).to be false }
      end

      context "when value is positive" do
        subject { BigDecimal('1.0') }
        it { expect(subject.to_b).to be true }
      end

      context "when value is negative" do
        subject { BigDecimal('-1.0') }
        it { expect(subject.to_b).to be true }
      end
    end
  end
end
