require 'rails_helper'

RSpec.describe SubmissionsController do
  describe 'POST #create' do
    context 'with valid attributes' do

      let(:proposal) { create(:proposal) }
      let(:expected_submission) { Submission.new(proposal: proposal, result: 0) }

      before do
        allow(Submission).to receive(:create!).and_return(expected_submission)
        post :create, params: { submission: { event_id: 17, proposal_id: 7, result: 0 } }
      end
 
      it 'creates a new submission' do
        expect(Submission).to have_received(:create!).with(event_id: '17', proposal_id: '7', result: '0')
      end
      
      it { should redirect_to(proposal_path(assigns(:submission).proposal)) }
    end

    context 'with invalid attributes' do
      before do
        allow(Submission).to receive(:create!) { fail ActiveRecord::ActiveRecordError }
        post :create, params: { submission: { result: '' } }
      end

      it { is_expected.to set_flash[:alert].to('Failed to save submission') }
      it { should redirect_to(new_submission_path) }
    end
  end
end

