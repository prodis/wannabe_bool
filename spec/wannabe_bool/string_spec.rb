RSpec.describe WannabeBool::String do
  describe '#to_b' do
    context 'truthy values' do
      [ '1', '1 ', ' 1', ' 1 ',
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
      ].each do |value|
        context "when string is '#{value}'" do
          subject { value.to_b }
          it { is_expected.to be true }
        end

        context "using aliasing when string is '#{value}'" do
          it 'should return the same value as .to_b' do
            expect(value.to_boolean).to eq value.to_b
          end

          it 'should return the same value as .to_b' do
            expect(value.to_b).to eq value.to_b
          end
        end      
      end
    end

    context 'falsey values' do
      [ '0', '0 ', ' 0', ' 0 ',
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
      ].each do |value|
        context "when string is '#{value}'" do
          subject { value.to_b }
          it { is_expected.to be false }
        end

        context "using aliasing when string is '#{value}'" do
          it 'should return the same value as .to_b' do
            expect(value.to_boolean).to eq value.to_b
          end

          it 'should return the same value as .to_b' do
            expect(value.to_b).to eq value.to_b
          end
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

        [ '', 'nil',
          '2', '-1', '-2',
          'not', 'NOT',
          'wherever', 'Prodis'
        ].each do |value|
          context "when string is '#{value}'" do
            it 'returns the result of the given behaviour' do
              expect(value.to_b).to be :wherever
            end
          end

          context "using aliasing when string is '#{value}'" do
            it 'should return the same value as .to_b' do
              expect(value.to_boolean).to eq value.to_b
            end

            it 'should return the same value as .to_b' do
              expect(value.to_b).to eq value.to_b
            end
          end
        end
      end
    end
  end
end
