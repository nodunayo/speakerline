require 'rails_helper'

RSpec.describe ProposalsController do
  describe 'POST #create' do
    context 'with valid attributes' do

      let(:expected_proposal) { Proposal.new(id: 7, title: 'A great talk', body: 'Come listen to a great talk', tag_list: 'talks, proposals', speaker_id: 5 ) }

      before do
        allow(Proposal).to receive(:new).and_return(expected_proposal)
        allow(expected_proposal).to receive(:save).and_return(true)
        post :create, params: { proposal: { title: 'A great talk', body: 'Come listen to a great talk', tag_list: 'talks, proposals',speaker_id: 5 } }
      end

      it 'creates a new proposal' do
        expect(Proposal).to have_received(:new).with(title: 'A great talk', body: 'Come listen to a great talk', tag_list: 'talks, proposals', speaker_id: '5')
      end

      it { should redirect_to(proposal_path(expected_proposal)) }
    end

    context 'with invalid attributes' do
      render_views
      let(:invalid_proposal) { Proposal.new(title: nil, body: 'My progress should be shown') }

      before do
        allow(Proposal).to receive(:new).and_return(invalid_proposal)
        allow(invalid_proposal).to receive(:save).and_return(false)
      end

      it 'does not save the proposal in the database' do
        expect{
          post :create, params: { proposal: { title: '' } }
        }.to_not change(Proposal, :count)
      end

      it 'renders the new template' do
        post :create, params: { proposal: { title: '' } }
        expect(subject).to render_template(:new)
      end

      it 'saves the user\'s progress' do
        post :create, params: { proposal: { title: '' } }
        expect(response.body).to have_content 'My progress should be shown'
      end
    end
  end

  describe 'PUT #update' do
    context 'when the user is not signed in' do
      let(:proposal) { create(:proposal) }

      it 'does not allow the user to access the Proposal#edit page' do
        put :update, params: { id: proposal.id, proposal: { title: 'New Title' } }

        expect(response).not_to redirect_to(proposal_path)
      end
    end

    context 'with valid attributes' do

      let(:existing_proposal) { create(:proposal, title: "I am an old proposal") }

      before do
        put :update, params: { id: existing_proposal.id, proposal: { title: "I am a new proposal" } }, session: { current_user_id: "123" }
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
        put :update, params: { id: existing_proposal.id, proposal: { title: "" } }, session: { current_user_id: "123" }
        existing_proposal.reload
      end

      it 'fails to update the proposal details' do
        expect(existing_proposal.title).to eq("I am an old proposal")
      end

      it { should render_template(:edit) }

    end
  end

  describe 'GET #edit' do
    context 'when the user is not signed in' do
      let(:proposal) { create(:proposal) }

      it 'does not allow the user to access the Proposal#edit page' do
        get :edit, params: { id: proposal.id }

        expect(response.status).to eq(302)
      end
    end
  end
end
