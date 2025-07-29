require 'rails_helper'

RSpec.describe SubmissionsController do
  let(:proposal) { create(:proposal) }

  describe 'GET #index' do
    it 'redirects to the proposals create page' do
      get :index
      expect(response).to redirect_to(proposals_path)
      expect(flash[:notice]).to eq('Submissions can be accessed from their respective proposal pages.')
    end
  end

  describe 'GET #new' do
    context 'anonymous user' do
      before do
        get :new
      end

      it { should redirect_to(users_sign_in_path) }
    end

    context 'authenticated user' do
      let(:current_user) { create(:user) }
      before do
        passwordless_sign_in(current_user)
      end

      it 'redirects to the proposals create page' do
        get :new
        expect(response).to redirect_to(proposals_path)
        expect(flash[:notice]).to eq('Submissions are tied to specific proposals. Please create them from a proposal page.')
      end
    end
  end

  describe 'POST #create' do
    context 'anonymous user' do
      before do
        post :create, params: { submission: { event_instance_id: 17, proposal_id: 7, result: 0 } }
      end

      it { should redirect_to(users_sign_in_path) }
    end

    context 'authenticated user' do
      let(:current_user) { create(:user) }
      before do
        passwordless_sign_in(current_user)
      end

      context 'with valid attributes' do
        let(:expected_submission) { Submission.new(proposal: proposal, result: 0) }

        before do
          allow(Submission).to receive(:new).and_return(expected_submission)
          allow(expected_submission).to receive(:save).and_return(true)
          post :create, params: { submission: { event_instance_id: 17, proposal_id: 7, result: 0 } }
        end

        it 'creates a new submission' do
          expect(Submission).to have_received(:new).with(event_instance_id: '17', proposal_id: '7', result: '0')
        end

        it { should redirect_to(proposal_path(assigns(:submission).proposal)) }
      end

      context 'with a valid proposal attribute and invalid event instance and result attributes' do
        let(:invalid_submission) { Submission.new(proposal: proposal, result: '') }

        before do
          allow(Submission).to receive(:new).and_return(invalid_submission)
          allow(invalid_submission).to receive(:save).and_return(false)

        end

        it 'does not save the proposal in the database' do
          expect{
            post :create, params: { submission: { event_instance_id: '', proposal_id: proposal.id, result: '' } }
          }.to_not change(Submission, :count)
        end

        it 'renders the new template' do
          post :create, params: { submission: { event_instance_id: '', proposal_id: proposal.id, result: '' } }
          expect(subject).to render_template(:new)
        end
      end
    end
  end

  describe 'PUT #update' do
    let(:existing_submission) { create(:submission, proposal: proposal, result: 0) }

    context 'anonymous user' do
      before do
        put :update, params: { id: existing_submission.id, submission: { result: 'rejected' } }
      end

      it { should redirect_to(users_sign_in_path) }
    end

    context 'authenticated user' do
      let(:current_user) { create(:user) }
      before do
        passwordless_sign_in(current_user)
      end

      context 'with valid attributes' do
        before do
          put :update, params: { id: existing_submission.id, submission: { result: 'rejected' } }
          existing_submission.reload
        end

        it 'updates the submission details' do
          expect(existing_submission.result).to eq('rejected')
        end

        it { should redirect_to(proposal_path(proposal)) }
      end
    end
  end
end

