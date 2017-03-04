require 'rails_helper'

RSpec.describe EventsController do
  describe 'POST #create' do
    before do
      stub_const 'Event', double
    end

    context 'with valid attributes' do
      let(:expected_event) { double }

      before do
        allow(Event).to receive(:create!).and_return(expected_event)
        post :create, params: { event: { name: 'RubyConf', year: '2017' } }
      end

      it 'creates a new event' do
        expect(Event).to have_received(:create!).with(hash_including(name: 'RubyConf', year: '2017'))
      end

      it { should redirect_to(speakers_path) }
    end

    context 'with invalid attributes' do
      before do
        allow(Event).to receive(:create!) { fail ActiveRecord::ActiveRecordError }
        post :create, params: { event: { name: '', year: '' } }
      end

      it { is_expected.to set_flash[:alert].to('Failed to save event') }
      it { should redirect_to(new_event_path) }
    end
  end
end
