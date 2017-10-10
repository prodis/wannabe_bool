RSpec.describe WannabeBool do
  context 'configuration' do
    subject { described_class }

    describe '.invalid_value_behaviour' do
      context 'default behaviour' do
        it 'is WannabeBool::InvalidValueBehaviour::False' do
          expect(subject.invalid_value_behaviour).to eq WannabeBool::InvalidValueBehaviour::False
        end
      end
    end

    describe '.invalid_value_behaviour=' do
      context 'when behaviour responds to call method' do
        let(:behaviour) do
          -> { :whatever }
        end

        before do
          subject.invalid_value_behaviour = behaviour
        end

        after do
          subject.invalid_value_behaviour = WannabeBool::InvalidValueBehaviour::False
        end

        it "sets the behaviour" do
          expect(subject.invalid_value_behaviour).to eq behaviour
        end
      end

      context 'when behaviour does not respond to call method' do
        it 'raises argument error' do
          expect { subject.invalid_value_behaviour = String }.to raise_error(ArgumentError, 'behaviour does not respond to call method')
        end
      end
    end
  end
end
