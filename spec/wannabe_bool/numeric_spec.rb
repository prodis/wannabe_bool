# frozen_string_literal: true
require 'bigdecimal'

RSpec.describe WannabeBool::Numeric do
  # Integer
  INTEGER_ZERO = 0
  INTEGER_POSITIVES = (1..9).freeze
  INTEGER_NEGATIVES = (-9..-1).freeze

  # Float
  FLOAT_ZERO = 0.0
  FLOAT_POSITIVE = Random.rand
  FLOAT_NEGATIVE = Random.rand * -1

  # Decimal
  DECIMAL_ZERO = BigDecimal('0.0')
  DECIMAL_POSITIVE = BigDecimal('1.0')
  DECIMAL_NEGATIVE = BigDecimal('-1.0')

  context Integer do
    describe '#to_b' do
      context 'when value is 0' do
        subject { INTEGER_ZERO.to_b }
        it { is_expected.to be false }
      end

      context 'positive values' do
        INTEGER_POSITIVES.each do |value|
          context "when value is #{value}" do
            subject { value.to_b }
            it { is_expected.to be true }
          end
        end
      end

      context 'negative values' do
        INTEGER_NEGATIVES.each do |value|
          context "when value is #{value}" do
            subject { value.to_b }
            it { is_expected.to be true }
          end
        end
      end
    end

    describe '#to_bool' do
      context 'when value is 0' do
        subject { INTEGER_ZERO.to_bool }
        it { is_expected.to be false }
      end

      context 'positive values' do
        INTEGER_POSITIVES.each do |value|
          context "when value is #{value}" do
            subject { value.to_bool }
            it { is_expected.to be true }
          end
        end
      end

      context 'negative values' do
        INTEGER_NEGATIVES.each do |value|
          context "when value is #{value}" do
            subject { value.to_bool }
            it { is_expected.to be true }
          end
        end
      end
    end

    describe '#to_boolean' do
      context 'when value is 0' do
        subject { INTEGER_ZERO.to_boolean }
        it { is_expected.to be false }
      end

      context 'positive values' do
        INTEGER_POSITIVES.each do |value|
          context "when value is #{value}" do
            subject { value.to_boolean }
            it { is_expected.to be true }
          end
        end
      end

      context 'negative values' do
        INTEGER_NEGATIVES.each do |value|
          context "when value is #{value}" do
            subject { value.to_boolean }
            it { is_expected.to be true }
          end
        end
      end
    end

    describe '#true?' do
      context 'when value is 0' do
        subject { INTEGER_ZERO.true? }
        it { is_expected.to be false }
      end

      context 'positive values' do
        INTEGER_POSITIVES.each do |value|
          context "when value is #{value}" do
            subject { value.true? }
            it { is_expected.to be true }
          end
        end
      end

      context 'negative values' do
        INTEGER_NEGATIVES.each do |value|
          context "when value is #{value}" do
            subject { value.true? }
            it { is_expected.to be true }
          end
        end
      end
    end

    describe '#false?' do
      context 'when value is 0' do
        subject { INTEGER_ZERO.false? }
        it { is_expected.to be true }
      end

      context 'positive values' do
        INTEGER_POSITIVES.each do |value|
          context "when value is #{value}" do
            subject { value.false? }
            it { is_expected.to be false }
          end
        end
      end

      context 'negative values' do
        INTEGER_NEGATIVES.each do |value|
          context "when value is #{value}" do
            subject { value.false? }
            it { is_expected.to be false }
          end
        end
      end
    end
  end

  context Float do
    describe '#to_b' do
      context 'when value is 0.0' do
        subject { FLOAT_ZERO.to_b }
        it { is_expected.to be false }
      end

      context "when value is positive" do
        subject { FLOAT_POSITIVE.to_b }
        it { is_expected.to be true }
      end

      context "when value is negative" do
        subject { FLOAT_NEGATIVE.to_b }
        it { is_expected.to be true }
      end
    end

    describe '#to_bool' do
      context 'when value is 0.0' do
        subject { FLOAT_ZERO.to_bool }
        it { is_expected.to be false }
      end

      context "when value is positive" do
        subject { FLOAT_POSITIVE.to_bool }
        it { is_expected.to be true }
      end

      context "when value is negative" do
        subject { FLOAT_NEGATIVE.to_bool }
        it { is_expected.to be true }
      end
    end

    describe '#to_boolean' do
      context 'when value is 0.0' do
        subject { FLOAT_ZERO.to_boolean }
        it { is_expected.to be false }
      end

      context "when value is positive" do
        subject { FLOAT_POSITIVE.to_boolean }
        it { is_expected.to be true }
      end

      context "when value is negative" do
        subject { FLOAT_NEGATIVE.to_boolean }
        it { is_expected.to be true }
      end
    end

    describe '#true?' do
      context 'when value is 0.0' do
        subject { FLOAT_ZERO.true? }
        it { is_expected.to be false }
      end

      context "when value is positive" do
        subject { FLOAT_POSITIVE.true? }
        it { is_expected.to be true }
      end

      context "when value is negative" do
        subject { FLOAT_NEGATIVE.true? }
        it { is_expected.to be true }
      end
    end

    describe '#false?' do
      context 'when value is 0.0' do
        subject { FLOAT_ZERO.false? }
        it { is_expected.to be true }
      end

      context "when value is positive" do
        subject { FLOAT_POSITIVE.false? }
        it { is_expected.to be false }
      end

      context "when value is negative" do
        subject { FLOAT_NEGATIVE.false? }
        it { is_expected.to be false }
      end
    end
  end

  context BigDecimal do
    describe '#to_b' do
      context 'when value is 0.0' do
        subject { DECIMAL_ZERO.to_b }
        it { is_expected.to be false }
      end

      context "when value is positive" do
        subject { DECIMAL_POSITIVE.to_b }
        it { is_expected.to be true }
      end

      context "when value is negative" do
        subject { DECIMAL_NEGATIVE.to_b }
        it { is_expected.to be true }
      end
    end

    describe '#to_bool' do
      context 'when value is 0.0' do
        subject { DECIMAL_ZERO.to_bool }
        it { is_expected.to be false }
      end

      context "when value is positive" do
        subject { DECIMAL_POSITIVE.to_bool }
        it { is_expected.to be true }
      end

      context "when value is negative" do
        subject { DECIMAL_NEGATIVE.to_bool }
        it { is_expected.to be true }
      end
    end

    describe '#to_boolean' do
      context 'when value is 0.0' do
        subject { DECIMAL_ZERO.to_boolean }
        it { is_expected.to be false }
      end

      context "when value is positive" do
        subject { DECIMAL_POSITIVE.to_boolean }
        it { is_expected.to be true }
      end

      context "when value is negative" do
        subject { DECIMAL_NEGATIVE.to_boolean }
        it { is_expected.to be true }
      end
    end

    describe '#true?' do
      context 'when value is 0.0' do
        subject { DECIMAL_ZERO.true? }
        it { is_expected.to be false }
      end

      context "when value is positive" do
        subject { DECIMAL_POSITIVE.true? }
        it { is_expected.to be true }
      end

      context "when value is negative" do
        subject { DECIMAL_NEGATIVE.true? }
        it { is_expected.to be true }
      end
    end

    describe '#false?' do
      context 'when value is 0.0' do
        subject { DECIMAL_ZERO.false? }
        it { is_expected.to be true }
      end

      context "when value is positive" do
        subject { DECIMAL_POSITIVE.false? }
        it { is_expected.to be false }
      end

      context "when value is negative" do
        subject { DECIMAL_NEGATIVE.false? }
        it { is_expected.to be false }
      end
    end
  end
end
