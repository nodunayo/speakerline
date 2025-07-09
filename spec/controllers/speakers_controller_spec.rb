require 'rails_helper'

RSpec.describe SpeakersController do
  describe 'GET #index' do
    context 'when viewing the Speakers#index page' do
      before do
        create(:speaker, name: "Zebra")
        create(:speaker, name: "LazyTed")
        create(:speaker, name: "Angel")

        create(:proposal, speakers: [Speaker.find_by(name: "Angel")])
        create(:proposal, speakers: [Speaker.find_by(name: "Zebra")])

        get :index
      end

      it 'lists the speakers in alphabetical order' do
        expect(assigns(:speakers).first.name).to eq("Angel")
      end

      it 'does not show speakers without proposals' do
        assigns(:speakers).each do |s|
          expect(s.name).not_to eq("LazyTed")
        end
      end
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      let(:expected_speaker) { Speaker.new(name: 'Obama') }

      before do
        allow(Speaker).to receive(:new).and_return(expected_speaker)
        allow(expected_speaker).to receive(:save).and_return(true)
        post :create, params: { speaker: { name: 'Obama' } }
      end

      it 'creates a new speaker' do
        expect(Speaker).to have_received(:new).with(name: 'Obama')
      end

      it { should redirect_to(speakers_path) }
    end

    context 'with invalid attributes' do
      let(:invalid_speaker) { Speaker.new(name: nil) }

      before do
        allow(Speaker).to receive(:new).and_return(invalid_speaker)
        allow(invalid_speaker).to receive(:save).and_return(false)
      end

      it 'does not save the speaker in the database' do
        expect{
          post :create, params: { speaker: { name: '' } }
        }.to_not change(Speaker, :count)
      end

      it 'renders the new template' do
        post :create, params: { speaker: { name: '' } }
        expect(subject).to render_template(:new)
      end
    end
  end
end
