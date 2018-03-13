# frozen_string_literal: true
RSpec.describe WannabeBool::Attributes do
  class FakeAttributes
    include WannabeBool::Attributes

    attr_reader :main, :published, :migrated
    attr_wannabe_bool :main, :published, :migrated

    def initialize(main, published)
      @main = main
      @published = published
    end

    def migrated?
      # Don't worry about the symbol in return, it is just to help in test expectation.
      :original_method_return
    end
  end

  context 'when reader attribute exists' do
    let(:subject_methods) do
      fake = FakeAttributes.new(true, true)
      fake.public_methods - Object.methods
    end

    it 'creates the predicate method' do
      expect(subject_methods).to include(:main?)
      expect(subject_methods).to include(:published?)
    end

    [ { type: 'string',  value: 'true' },
      { type: 'integer', value: 1      },
      { type: 'symbol',  value: :true  },
      { type: 'boolean', value: true   }
    ].each do |info|
      context "with a #{info[:type]} value" do
        subject { FakeAttributes.new(info[:value], info[:value]) }

        it 'returns original value converted to boolean' do
          expect(subject.main?).to be true
          expect(subject.published?).to be true
        end
      end
    end
  end

  context 'when reader attribute does not exist' do
    it 'raises ArgumentError' do
      expect { FakeAttributes.send(:attr_wannabe_bool, :not_exist) }.to raise_error(ArgumentError, 'not_exist method is not defined.')
    end
  end

  context 'when predicate method exists' do
    subject { FakeAttributes.new(true, true) }

    it 'does not overrides the original predicate method' do
      expect(subject.migrated?).to eql :original_method_return
    end
  end
end
