require 'rails_helper'

RSpec.describe ProposalsController do
  describe 'POST #create' do
    context 'with valid attributes' do

      let(:expected_proposal) { Proposal.new(id: 7, title: 'A great talk', body: 'Come listen to a great talk', speaker_id: 5 ) }

      before do
        allow(Proposal).to receive(:new).and_return(expected_proposal)
        allow(expected_proposal).to receive(:save).and_return(true)
        post :create, params: { proposal: { title: 'A great talk', body: 'Come listen to a great talk', speaker_id: 5 } }
      end

      it 'creates a new proposal' do
        expect(Proposal).to have_received(:new).with(title: 'A great talk', body: 'Come listen to a great talk', speaker_id: '5')
      end

      it { should redirect_to(proposal_path(expected_proposal)) }
    end

    context 'with invalid attributes' do
      render_views
      let(:invalid_proposal) { Proposal.new(title: nil, body: 'My progress should be shown') }

      before do
        allow(Proposal).to receive(:new).and_return(invalid_proposal)
        allow(invalid_proposal).to receive(:save).and_return(false)
        post :create, params: { proposal: { title: '' } }
      end

      it { is_expected.to set_flash[:alert].to('Failed to save proposal') }
      it { expect(response.body).to have_content 'My progress should be shown' }
    end
  end

  describe 'PUT #update' do
    context 'with valid attributes' do

      let(:existing_proposal) { create(:proposal, title: "I am an old proposal") }

      before do
        put :update, params: { id: existing_proposal.id, proposal: { title: "I am a new proposal" } }
        existing_proposal.reload
      end


      it 'updates the proposal details' do
        expect(existing_proposal.title).to eq("I am a new proposal")
      end

      it { should redirect_to(proposal_path(existing_proposal)) }
    end

    context 'with invalid attributes' do
      let(:existing_proposal) { create(:proposal, title: "I am an old proposal") }

      before do
        put :update, params: { id: existing_proposal.id, proposal: { title: "" } }
        existing_proposal.reload
      end

      it 'fails to update the proposal details' do
        expect(existing_proposal.title).to eq("I am an old proposal")
      end

      it { is_expected.to set_flash[:alert].to('Failed to update proposal') }
      it { should render_template(:edit) }

    end
  end
end
