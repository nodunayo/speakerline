require 'rails_helper'

RSpec.describe TagsController do
  describe 'GET #index' do
    context 'when viewing the Tags#index page' do
      before do
        create(:tag, name: "ruby")
        create(:tag, name: "python")
        create(:tag, name: "activerecord")

        get :index
      end

      it 'lists the tags in alphabetical order' do
        expect(assigns(:tags).pluck(:name)).to eq ["activerecord", "python", "ruby"]
      end
    end
  end
end
