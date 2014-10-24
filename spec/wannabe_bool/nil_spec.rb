# encoding: utf-8
require 'spec_helper'

describe WannabeBool::Nil do
  context NilClass do
    subject { nil }

    describe '#to_b' do
      it { expect(subject.to_b).to eq false }
    end
  end
end
