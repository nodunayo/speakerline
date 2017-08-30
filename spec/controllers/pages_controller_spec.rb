require 'rails_helper'

RSpec.describe PagesController do
  it { is_expected.to route(:get, '/').to(action: :homepage) }

  describe "GET #homepage" do
    it 'returns success' do
      get :homepage
      expect(response).to be_a_success
    end
  end
end
