require 'rails_helper'

RSpec.describe SubmissionsController do
  describe 'POST #create' do

    let(:proposal) { create(:proposal) }

    context 'with valid attributes' do

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

    context 'with a valid proposal attribute and invalid event and result attributes' do
      let(:invalid_submission) { Submission.new(proposal: proposal, result: '') }

      before do
        allow(Submission).to receive(:new).and_return(invalid_submission)
        allow(invalid_submission).to receive(:save).and_return(false)

        post :create, params: { submission: { event_id: '', proposal_id: proposal.id, result: '' } }
      end

      it { is_expected.to set_flash[:alert].to('Failed to save submission') }
      it { should redirect_to(new_submission_path(proposal: invalid_submission.proposal.id)) }
      it 'should retain its proposal id' do
        expect(response.location).to include("?proposal=#{invalid_submission.proposal.id}")
      end
    end
  end
end

