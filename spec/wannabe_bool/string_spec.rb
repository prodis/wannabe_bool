# encoding: utf-8
require 'spec_helper'

describe WannabeBool::String do
  context String do
    describe '#to_b' do
      [ '1', '1 ', ' 1 ', ' 1',
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
        context "when value is '#{value}'" do
          subject { value }
          it { expect(subject.to_b).to eq true }
        end
      end

      [ '',
        '0', '2',
        'f', 'F',
        'false', 'FALSE',
        'off', 'OFF',
        'n', 'N',
        'no', 'NO',
        'not', 'NOT',
        'wherever', 'Prodis'
      ].each do |value|
        context "when value is '#{value}'" do
          subject { value }
          it { expect(subject.to_b).to eq false }
        end
      end
    end
  end

  context Symbol do
    describe '#to_b' do
      [ :"1", :"1 ", :" 1 ", :" 1",
        :t, :"t ", :" t", :" t ",
        :T, :"T ", :" T", :" T ",
        :true, :"true ", :" true", :" true ",
        :TRUE, :"TRUE ", :" TRUE", :" TRUE ",
        :on, :"on ", :" on", :" on ",
        :ON, :"ON ", :" ON ", :" ON ",
        :y, :"y ", :" y", :" y ",
        :Y, :"Y ", :" Y", :" Y ",
        :yes, :"yes ", :" yes", :" yes ",
        :YES, :"YES ", :" YES", :" YES "
      ].each do |value|
        context "when value is '#{value}'" do
          subject { value }
          it { expect(subject.to_b).to eq true }
        end
      end

      [ :"",
        :"0", :"2",
        :f, :F,
        :false,
        :FALSE,
        :off, :OFF,
        :n, :N,
        :no, :NO,
        :not, :NOT,
        :wherever, :Prodis
      ].each do |value|
        context "when value is '#{value}'" do
          subject { value }
          it { expect(subject.to_b).to eq false }
        end
      end
    end
  end
end
