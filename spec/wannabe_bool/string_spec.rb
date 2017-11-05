RSpec.describe WannabeBool::String do
  # use self:: to make the constant only available to this spec class
  self::TRUTHY_VALUES = [ 
    '1', '1 ', ' 1', ' 1 ',
    't', 't ', ' t', ' t ',
    'T', 'T ', ' T', ' T ',
    'true', 'true ', ' true', ' true ',
    'TRUE', 'TRUE ', ' TRUE', ' TRUE ',
    'on', 'on ', ' on', ' on ',
    'ON', 'ON ', ' ON ', ' ON ',
    'y', 'y ', ' y', ' y ',
    'Y', 'Y ', ' Y', ' Y ',
    'yes', 'yes ', ' yes', ' yes ',
    'YES', 'YES ', ' YES', ' YES '
  ].freeze

  self::FALSEY_VALUES = [
    '0', '0 ', ' 0', ' 0 ',
    'f', 'f ', ' f', ' f ',
    'F', 'F ', ' F', ' F ',
    'false', 'false ', ' false', ' false ',
    'FALSE', 'FALSE ', ' FALSE', ' FALSE ',
    'off', 'off ', ' off', ' off ',
    'OFF', 'OFF ', ' OFF ', ' OFF ',
    'n', 'n ', ' n', ' n ',
    'N', 'N ', ' N', ' N ',
    'no', 'no ', ' no', ' no ',
    'NO', 'NO ', ' NO', ' NO '
  ].freeze

  self::INVALID_VALUES = [ 
    '', 'nil',
    '2', '-1', '-2',
    'not', 'NOT',
    'wherever', 'Prodis'
  ].freeze

  describe '#to_b' do
    context 'truthy values' do
      self::TRUTHY_VALUES.each do |value|
        context "when string is '#{value}'" do
          subject { value.to_b }
          it { is_expected.to be true }
        end    
      end
    end

    context 'falsey values' do
      self::FALSEY_VALUES.each do |value|
        context "when string is '#{value}'" do
          subject { value.to_b }
          it { is_expected.to be false }
        end      
      end
    end

    context 'invalid values' do
      after do
        WannabeBool.invalid_value_behaviour = WannabeBool::InvalidValueBehaviour::False
      end

      context 'when an invalid value behaviour is given' do
        before do
          WannabeBool.invalid_value_behaviour = -> { :whatever }
        end

        self::INVALID_VALUES.each do |value|
          context "when string is '#{value}'" do
            it 'returns the result of the given behaviour' do
              expect(value.to_b).to be :whatever
            end
          end
        end
      end
    end
  end

  describe '#to_bool' do
    context 'truthy values' do
      self::TRUTHY_VALUES.each do |value|
        context "when string is '#{value}'" do
          subject { value.to_bool }
          it { is_expected.to be true }
        end    
      end
    end

    context 'falsey values' do
      self::FALSEY_VALUES.each do |value|
        context "when string is '#{value}'" do
          subject { value.to_bool }
          it { is_expected.to be false }
        end      
      end
    end

    context 'invalid values' do
      after do
        WannabeBool.invalid_value_behaviour = WannabeBool::InvalidValueBehaviour::False
      end

      context 'when an invalid value behaviour is given' do
        before do
          WannabeBool.invalid_value_behaviour = -> { :wherever }
        end

        self::INVALID_VALUES.each do |value|
          context "when string is '#{value}'" do
            it 'returns the result of the given behaviour' do
              expect(value.to_bool).to be :wherever
            end
          end
        end
      end
    end
  end

  describe '#to_boolean' do
    context 'truthy values' do
      self::TRUTHY_VALUES.each do |value|
        context "when string is '#{value}'" do
          subject { value.to_boolean }
          it { is_expected.to be true }
        end    
      end
    end

    context 'falsey values' do
      self::FALSEY_VALUES.each do |value|
        context "when string is '#{value}'" do
          subject { value.to_boolean }
          it { is_expected.to be false }
        end      
      end
    end

    context 'invalid values' do
      after do
        WannabeBool.invalid_value_behaviour = WannabeBool::InvalidValueBehaviour::False
      end

      context 'when an invalid value behaviour is given' do
        before do
          WannabeBool.invalid_value_behaviour = -> { :wherever }
        end

        self::INVALID_VALUES.each do |value|
          context "when string is '#{value}'" do
            it 'returns the result of the given behaviour' do
              expect(value.to_boolean).to be :wherever
            end
          end
        end
      end
    end
  end   
end
