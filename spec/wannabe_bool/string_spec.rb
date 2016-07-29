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
          subject { value }
          it { expect(subject.to_b).to be true }
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
          subject { value }
          it { expect(subject.to_b).to be false }
        end
      end
    end

    context 'invalid values' do
      after do
        WannabeBool.invalid_value_behaviour = :false
      end

      context 'with :false invalid value behaviour' do
        before do
          WannabeBool.invalid_value_behaviour = :false
        end

        [ '', 'nil',
          '2', '-1', '-2',
          'not', 'NOT',
          'wherever', 'Prodis'
        ].each do |value|
          context "when string is '#{value}'" do
            subject { value }
            it { expect(subject.to_b).to be false }
          end
        end
      end

      context 'with :nil invalid value behaviour' do
        before do
          WannabeBool.invalid_value_behaviour = :nil
        end

        [ '', 'nil',
          '2', '-1', '-2',
          'not', 'NOT',
          'wherever', 'Prodis'
        ].each do |value|
          context "when string is '#{value}'" do
            subject { value }
            it { expect(subject.to_b).to be nil }
          end
        end
      end

      context 'with :exception invalid value behaviour' do
        before do
          WannabeBool.invalid_value_behaviour = :exception
        end

        [ '', 'nil',
          '2', '-1', '-2',
          'not', 'NOT',
          'wherever', 'Prodis'
        ].each do |value|
          context "when string is '#{value}'" do
            subject { value }
            it { expect { subject.to_b }.to raise_error(ArgumentError) }
          end
        end
      end
    end
  end
end
