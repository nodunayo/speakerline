require 'rails_helper'

RSpec.describe EventInstancesController do
  describe 'POST #create' do
    before do
      stub_const 'EventInstance', double
    end

    context 'with valid attributes' do
      let(:expected_event_instance) { double }
      let(:event) { create(:event) }

      context 'for an existing event' do
        before do
          allow(EventInstance).to receive(:new).and_return(expected_event_instance)
          allow(expected_event_instance).to receive(:save).and_return(true)
          post :create, params: { event_instance: { event_id: event.id, year: '2017' } }
        end

        it 'creates a new instance' do
          expect(EventInstance).to have_received(:new).with(strong_params(event_id: event.id.to_s, year: '2017'))
        end
        it { should redirect_to(speakers_path) }
      end

      context 'for a new event' do
        before do
          allow(EventInstance).to receive(:new).and_return(expected_event_instance)
          allow(expected_event_instance).to receive(:save).and_return(true)
          post :create, params: { event_instance: { new_parent_event_name: 'The Nu Conference', year: '2018' } }
        end

        it 'creates a new event and instance' do
          expect(EventInstance).to have_received(:new).with(strong_params(new_parent_event_name: 'The Nu Conference',
                                                                          year:                  '2018'))
        end
        it { should redirect_to(speakers_path) }
      end
    end

    context 'with invalid attributes' do
      let(:invalid_event_instance) { double }

      context 'with empty attributes' do
        before do
          allow(EventInstance).to receive(:new).and_return(invalid_event_instance)
          allow(invalid_event_instance).to receive(:save).and_return(false)

          post :create, params: { event_instance: { event_id: '', new_parent_event_name: '', year: '' } }
        end
        it { is_expected.to set_flash[:alert].to('Failed to save event') }
        it { should redirect_to(new_event_instance_path) }
      end

      context 'with both an event id and new parent event name' do
        let(:event) { create(:event) }

        before do
          allow(EventInstance).to receive(:new).and_return(invalid_event_instance)
          allow(invalid_event_instance).to receive(:save).and_return(false)
          post :create, params: { event_instance: { event_id:              event.id,
                                                    new_parent_event_name: 'Double double toil and trouble Conf',
                                                    year:                  '2018' } }
        end
        it { is_expected.to set_flash[:alert].to('Failed to save event') }
        it { should redirect_to(new_event_instance_path) }
      end
    end
  end
end
