require 'rails_helper'

RSpec.describe ShipsController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  let(:game) {FactoryGirl.create(:game)}

  describe "ships#index action" do
    it "should successfully display all ships" do
      sign_in user
      get :index, game_id: 2, user_id: 1
      expect(response).to have_http_status(:success)
    end
  end

end
