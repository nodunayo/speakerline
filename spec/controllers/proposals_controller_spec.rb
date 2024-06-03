require 'rails_helper'

RSpec.describe ProposalsController do
  describe 'POST #create' do
    context 'anonymous user' do
      before do
        post :create, params: { proposal: { title: "I shouldn't be here", body: "This is clearly a hacking attempt"} }
      end

      it { should redirect_to(users_sign_in_path) }
    end

    context 'signed in user' do
      let(:current_user) { create(:user) }
      before do
        passwordless_sign_in(current_user)
      end

      context 'with valid attributes' do
        let(:create_article) {
          post :create, params: { proposal: { title: 'A great talk', body: 'Come listen to a great talk', tag_list: 'talks, proposals' } }
        }

        it 'creates a new proposal' do
          expect { create_article }.to change(Proposal, :count).by(1)
        end

        it 'redirects to the proposal page' do
          create_article
          expect(response).to redirect_to(proposal_path(Proposal.last.id))
        end
      end

      context 'with invalid attributes' do
        context "too many tags" do
          render_views
          let(:invalid_params) { { proposal: { title: "This is a test", body: "Really cool stuff here", tag_list: "ruby,rails,react,vue,hotwire"}} }

          it "does not save the proposal in the database" do
            expect { post :create, params: invalid_params }.to_not change(Proposal, :count)
          end

          it "renders the new template" do
            post :create, params: invalid_params
            expect(subject).to render_template(:new)
          end

          it "renders the tag list with comma-separation" do
            post :create, params: invalid_params
            expect(response.body).to have_field("Tags (comma-separated, max 3)", with: "ruby, rails, react, vue, hotwire")
          end
        end

        context "without a title" do
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
    end
  end

  describe "GET #edit" do
    context 'anonymous user' do
      before do
        get :edit, params: { id: create(:proposal).id }
      end

      it { should redirect_to(users_sign_in_path) }
    end

    context 'signed in user' do
      let(:current_user) { create(:user) }
      let(:proposal) { create(:proposal, speaker: speaker) }
      before do
        passwordless_sign_in(current_user)
      end

      context "current_user owns the proposal" do
        let(:speaker) { current_user.speaker }

        it 'renders the edit form' do
          get :edit, params: { id: proposal.id }
          response.status.should eq(200)
        end
      end

      context "current_user does not own the proposal" do
        let(:speaker) { create(:speaker) }

        it 'redirects to the proposals index' do
          get :edit, params: { id: proposal.id }
          response.should redirect_to proposals_path
        end
      end
    end
  end

  describe 'PUT #update' do
    let(:proposal) { create(:proposal, title: "I am an old proposal", speaker: speaker) }
    let(:speaker) { create(:speaker) }
    let(:update_proposal) { put :update, params: { id: proposal.id, proposal: { title: "I am a new proposal" } } }

    context 'anonymous user' do
      it "redirects to the sign in page" do
        update_proposal
        expect(response).to redirect_to(users_sign_in_path)
      end
    end

    context 'signed in user' do
      let(:current_user) { create(:user) }
      before do
        passwordless_sign_in(current_user)
      end

      context 'current_user does not own the proposal' do
        it 'redirects to the proposal page' do
          update_proposal
          expect(response).to redirect_to(proposals_path)
        end

        it 'does not update the proposal' do
          expect { update_proposal }.not_to change(proposal, :title)
        end
      end

      context 'current_user owns the proposal' do
        let(:speaker) { current_user.speaker }

        context 'with valid attributes' do
          it 'updates the proposal details' do
            update_proposal
            expect(proposal.reload.title).to eq("I am a new proposal")
          end

          it "redirects to the proposal page" do
            update_proposal
            expect(response).to redirect_to(proposal_path(proposal))
          end
        end

        context 'with invalid attributes' do
          before do
            put :update, params: { id: proposal.id, proposal: { title: "" } }
            proposal.reload
          end

          it 'fails to update the proposal details' do
            expect(proposal.title).to eq("I am an old proposal")
          end

          it { should render_template(:edit) }

        end
      end
    end
  end
end
