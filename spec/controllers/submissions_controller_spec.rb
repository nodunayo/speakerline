require 'rails_helper'

RSpec.describe SubmissionsController do
  describe 'POST #create' do
    context 'with valid attributes' do

      let(:proposal) { create(:proposal) }
      let(:expected_submission) { Submission.new(proposal: proposal, result: 0) }

      before do
        allow(Submission).to receive(:new).and_return(expected_submission)
        allow(expected_submission).to receive(:save).and_return(true)
        post :create, params: { submission: { event_id: 17, proposal_id: 7, result: 0 } }
      end
 
      it 'creates a new submission' do
        expect(Submission).to have_received(:new).with(event_id: '17', proposal_id: '7', result: '0')
      end
      
      it { should redirect_to(proposal_path(assigns(:submission).proposal)) }
    end

    context 'with invalid attributes' do
      let(:invalid_submission) { double }

      before do
        allow(Submission).to receive(:new).and_return(invalid_submission)
        allow(invalid_submission).to receive(:save).and_return(false)

        post :create, params: { submission: { result: '' } }
      end

      it { is_expected.to set_flash[:alert].to('Failed to save submission') }
      it { should redirect_to(speakers_path) }
    end
  end
end

