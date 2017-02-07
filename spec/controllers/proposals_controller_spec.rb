require 'rails_helper'

RSpec.describe ProposalsController do
  describe 'POST #create' do
    context 'with valid attributes' do

      let(:expected_proposal) { Proposal.new(id: 7, title: 'A great talk', body: 'Come listen to a great talk', speaker_id: 5 ) }

      before do
        allow(Proposal).to receive(:create!).and_return(expected_proposal)
        post :create, params: { proposal: { title: 'A great talk', body: 'Come listen to a great talk', speaker_id: 5 } }
      end
 
      it 'creates a new proposal' do
        expect(Proposal).to have_received(:create!).with(title: 'A great talk', body: 'Come listen to a great talk', speaker_id: '5')
      end
      
      it { should redirect_to(proposal_path(assigns(:proposal))) }
    end

    context 'with invalid attributes' do
      before do
        allow(Proposal).to receive(:create!) { fail ActiveRecord::ActiveRecordError }
        post :create, params: { proposal: { name: '' } }
      end

      it { is_expected.to set_flash[:alert].to('Failed to save proposal') }
      it { should redirect_to(new_proposal_path) }
    end
  end
end


