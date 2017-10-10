RSpec.describe WannabeBool::Symbol do
  truthy_values = [ 
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
  ]

  falsey_values = [
    :'',
    :'0', :'2', :'-1', :'-2',
    :f, :F,
    :false, :FALSE,
    :off, :OFF,
    :n, :N,
    :no, :NO,
    :not, :NOT,
    :wherever, :Prodis
  ]

  describe '#to_b' do
    truthy_values.each do |value|
      it "should return true when symbol is '#{value}'" do
        expect(value.to_b).to eq true
      end
    end

    falsey_values.each do |value|
      it "should return false when symbol is '#{value}'" do
        expect(value.to_b).to eq false
      end
    end
  end

  describe '#to_bool' do
    truthy_values.each do |value|
      it "should return true when symbol is '#{value}'" do
        expect(value.to_bool).to eq true
      end
    end

    falsey_values.each do |value|
      it "should return false when symbol is '#{value}'" do
        expect(value.to_bool).to eq false
      end
    end
  end

  describe '#to_boolean' do
    truthy_values.each do |value|
      it "should return true when symbol is '#{value}'" do
        expect(value.to_boolean).to eq true
      end
    end

    falsey_values.each do |value|
      it "should return false when symbol is '#{value}'" do
        expect(value.to_boolean).to eq false
      end
    end
  end  
end
