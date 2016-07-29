RSpec.describe WannabeBool do
  context 'configuration' do
    subject { described_class }

    after do
      subject.invalid_value_behaviour = :false
    end

    describe '.invalid_value_behaviour' do
      context 'default behaviour' do
        it 'is :false' do
          expect(subject.invalid_value_behaviour).to eq :false
        end
      end

      context 'setting a behaviour' do
        before do
          subject.invalid_value_behaviour = :error
        end

        it 'returns set behaviour' do
          expect(subject.invalid_value_behaviour).to eq :error
        end
      end
    end

    describe '.invalid_value_behaviour=' do
      context 'for allowed behaviours' do
        WannabeBool::Configuration::ALLOWED_INVALID_VALUE_BEHAVIOURS.each do |behaviour|
          it "set :#{behaviour} behaviour" do
            subject.invalid_value_behaviour = behaviour
            expect(subject.invalid_value_behaviour).to eq behaviour
          end

          it "set module behaviour" do
            subject.invalid_value_behaviour = behaviour
            expect(subject.invalid_value_behaviour_module.to_s).to eq "WannabeBool::InvalidValueBehaviour::#{behaviour.to_s.capitalize}"
          end
        end
      end

      context 'when behaviour is not allowed' do
        it 'raises argument error' do
          expect { subject.invalid_value_behaviour = :true }.to raise_error(ArgumentError, ':true is not one of allowed behaviours: :false, :nil, :error')
        end
      end
    end
  end
end
