require 'bigdecimal'

RSpec.describe WannabeBool::Numeric do
  ZERO = 0.freeze
  INTEGER_POSITIVES = (1..9).freeze
  INTEGER_NEGATIVES = (-9..-1).freeze
  FLOAT_ZERO = (0.0).freeze
  FLOAT_POSITIVES = (Random.rand).freeze
  FLOAT_NEGATIVES = (Random.rand * -1).freeze
  DECIMAL_ZERO = BigDecimal('0.0').freeze
  DECIMAL_POSITIVES = BigDecimal('1.0').freeze
  DECIMAL_NEGATIVES = BigDecimal('-1.0').freeze

  context Integer do
    describe '#to_b' do
      context 'when value is 0' do
        subject { ZERO }
        it { expect(subject.to_b).to be false }
      end

      context 'positive values' do
        INTEGER_POSITIVES.each do |value|
          context "when value is #{value}" do
            subject { value }
            it { expect(subject.to_b).to be true }
          end
        end
      end

      context 'negative values' do
        INTEGER_NEGATIVES.each do |value|
          context "when value is #{value}" do
            subject { value }
            it { expect(subject.to_b).to be true }
          end
        end
      end
    end

    describe '#to_bool' do
      context 'when value is 0' do
        subject { ZERO }
        it { expect(subject.to_bool).to be false }
      end

      context 'positive values' do
        INTEGER_POSITIVES.each do |value|
          context "when value is #{value}" do
            subject { value }
            it { expect(subject.to_bool).to be true }
          end
        end
      end

      context 'negative values' do
        INTEGER_NEGATIVES.each do |value|
          context "when value is #{value}" do
            subject { value }
            it { expect(subject.to_bool).to be true }
          end
        end
      end
    end

    describe '#to_boolean' do
      context 'when value is 0' do
        subject { ZERO }
        it { expect(subject.to_boolean).to be false }
      end

      context 'positive values' do
        INTEGER_POSITIVES.each do |value|
          context "when value is #{value}" do
            subject { value }
            it { expect(subject.to_boolean).to be true }
          end
        end
      end

      context 'negative values' do
        INTEGER_NEGATIVES.each do |value|
          context "when value is #{value}" do
            subject { value }
            it { expect(subject.to_boolean).to be true }
          end
        end
      end
    end
  end

  context Float do
    describe '#to_b' do
      context 'when value is 0.0' do
        subject { FLOAT_ZERO }
        it { expect(subject.to_b).to be false }
      end

      context "when value is positive" do
        subject { FLOAT_POSITIVES }
        it { expect(subject.to_b).to be true }
      end

      context "when value is negative" do
        subject { FLOAT_NEGATIVES }
        it { expect(subject.to_b).to be true }
      end
    end

    describe '#to_bool' do
      context 'when value is 0.0' do
        subject { FLOAT_ZERO }
        it { expect(subject.to_bool).to be false }
      end

      context "when value is positive" do
        subject { FLOAT_POSITIVES }
        it { expect(subject.to_bool).to be true }
      end

      context "when value is negative" do
        subject { FLOAT_NEGATIVES }
        it { expect(subject.to_bool).to be true }
      end
    end

    describe '#to_boolean' do
      context 'when value is 0.0' do
        subject { FLOAT_ZERO }
        it { expect(subject.to_boolean).to be false }
      end

      context "when value is positive" do
        subject { FLOAT_POSITIVES }
        it { expect(subject.to_boolean).to be true }
      end

      context "when value is negative" do
        subject { FLOAT_NEGATIVES }
        it { expect(subject.to_boolean).to be true }
      end
    end
  end

  context BigDecimal do
    describe '#to_b' do
      context 'when value is 0.0' do
        subject { DECIMAL_ZERO }
        it { expect(subject.to_b).to be false }
      end

      context "when value is positive" do
        subject { DECIMAL_POSITIVES }
        it { expect(subject.to_b).to be true }
      end

      context "when value is negative" do
        subject { DECIMAL_NEGATIVES }
        it { expect(subject.to_b).to be true }
      end
    end

    describe '#to_bool' do
      context 'when value is 0.0' do
        subject { DECIMAL_ZERO }
        it { expect(subject.to_bool).to be false }
      end

      context "when value is positive" do
        subject { DECIMAL_POSITIVES }
        it { expect(subject.to_bool).to be true }
      end

      context "when value is negative" do
        subject { DECIMAL_NEGATIVES }
        it { expect(subject.to_bool).to be true }
      end
    end

    describe '#to_boolean' do
      context 'when value is 0.0' do
        subject { DECIMAL_ZERO }
        it { expect(subject.to_boolean).to be false }
      end

      context "when value is positive" do
        subject { DECIMAL_POSITIVES }
        it { expect(subject.to_boolean).to be true }
      end

      context "when value is negative" do
        subject { DECIMAL_NEGATIVES }
        it { expect(subject.to_boolean).to be true }
      end
    end
  end
end
