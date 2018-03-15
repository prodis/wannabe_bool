# frozen_string_literal: true
RSpec.describe WannabeBool::Symbol do

  SYMBOL_TRUTHY_VALUES = [
    :'1', :'1 ', :' 1 ', :' 1',
    :t, :'t ', :' t', :' t ',
    :T, :'T ', :' T', :' T ',
    :true, :'true ', :' true', :' true ',
    :TRUE, :'TRUE ', :' TRUE', :' TRUE ',
    :on, :'on ', :' on', :' on ',
    :ON, :'ON ', :' ON ', :' ON ',
    :y, :'y ', :' y', :' y ',
    :Y, :'Y ', :' Y', :' Y ',
    :yes, :'yes ', :' yes', :' yes ',
    :YES, :'YES ', :' YES', :' YES '
  ].freeze

  SYMBOL_FALSEY_VALUES = [
    :'',
    :'0', :'2', :'-1', :'-2',
    :f, :F,
    :false, :FALSE,
    :off, :OFF,
    :n, :N,
    :no, :NO,
    :not, :NOT,
    :wherever, :Prodis
  ].freeze

  describe '#to_b' do
    SYMBOL_TRUTHY_VALUES.each do |value|
      context "when symbol is '#{value}'" do
        subject { value.to_b }
        it { is_expected.to be true }
      end
    end

    SYMBOL_FALSEY_VALUES.each do |value|
      context "when symbol is '#{value}'" do
        subject { value.to_b }
        it { is_expected.to be false }
      end
    end
  end

  describe '#to_bool' do
    SYMBOL_TRUTHY_VALUES.each do |value|
      context "when symbol is '#{value}'" do
        subject { value.to_bool }
        it { is_expected.to be true }
      end
    end

    SYMBOL_FALSEY_VALUES.each do |value|
      context "when symbol is '#{value}'" do
        subject { value.to_bool }
        it { is_expected.to be false }
      end
    end
  end

  describe '#to_boolean' do
    SYMBOL_TRUTHY_VALUES.each do |value|
      context "when symbol is '#{value}'" do
        subject { value.to_boolean }
        it { is_expected.to be true }
      end
    end

    SYMBOL_FALSEY_VALUES.each do |value|
      context "when symbol is '#{value}'" do
        subject { value.to_bool }
        it { is_expected.to be false }
      end
    end
  end

  describe '#true?' do
    SYMBOL_TRUTHY_VALUES.each do |value|
      context "when symbol is '#{value}'" do
        subject { value.true? }
        it { is_expected.to be true }
      end
    end

    SYMBOL_FALSEY_VALUES.each do |value|
      context "when symbol is '#{value}'" do
        subject { value.true? }
        it { is_expected.to be false }
      end
    end
  end

  describe '#false?' do
    SYMBOL_TRUTHY_VALUES.each do |value|
      context "when symbol is '#{value}'" do
        subject { value.false? }
        it { is_expected.to be false }
      end
    end

    SYMBOL_FALSEY_VALUES.each do |value|
      context "when symbol is '#{value}'" do
        subject { value.false? }
        it { is_expected.to be true }
      end
    end
  end
end
