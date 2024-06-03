require 'rails_helper'

RSpec.describe SpeakersController do
  describe 'GET #index' do
    context 'when viewing the Speakers#index page' do
      before do
        create(:speaker, name: "Zebra")
        create(:speaker, name: "LazyTed")
        create(:speaker, name: "Angel")

        create(:proposal, speaker: Speaker.find_by(name: "Angel"))
        create(:proposal, speaker: Speaker.find_by(name: "Zebra"))

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
end
