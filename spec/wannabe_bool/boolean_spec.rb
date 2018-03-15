# frozen_string_literal: true
RSpec.describe WannabeBool::Boolean do
  context TrueClass do
    subject { true }

    describe '#to_b' do
      it { expect(subject.to_b).to be true }
    end

    describe '#to_bool' do
      it { expect(subject.to_bool).to be true }
    end

    describe '#to_boolean' do
      it { expect(subject.to_boolean).to be true }
    end

    describe '#true?' do
      it { expect(subject.true?).to be true }
    end

    describe '#false?' do
      it { expect(subject.false?).to be false }
    end
  end

  context FalseClass do
    subject { false }

    describe '#to_b' do
      it { expect(subject.to_b).to be false }
    end

    describe '#to_bool' do
      it { expect(subject.to_bool).to be false }
    end

    describe '#to_boolean' do
      it { expect(subject.to_boolean).to be false }
    end

    describe '#true?' do
      it { expect(subject.true?).to be false }
    end

    describe '#false?' do
      it { expect(subject.false?).to be true }
    end
  end
end
