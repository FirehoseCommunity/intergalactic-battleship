require 'rails_helper'

RSpec.describe ShipsController, type: :controller do
  describe "ships#index action" do
    it "should successfully display all ships" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
