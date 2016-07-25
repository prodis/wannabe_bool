RSpec.describe WannabeBool::String do
  describe '#to_b' do
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

    [ '',
      '0',
      '2', '2 ', ' 2', ' 2 ',
     '-1', '-1 ', ' -1', ' -1 ',
     '-2', '-2 ', ' -2', ' -2 ',
      'f', 'F',
      'false', 'FALSE',
      'off', 'OFF',
      'n', 'N',
      'no', 'NO',
      'not', 'NOT',
      'wherever', 'Prodis'
    ].each do |value|
      context "when string is '#{value}'" do
        subject { value }
        it { expect(subject.to_b).to be false }
      end
    end
  end
end
