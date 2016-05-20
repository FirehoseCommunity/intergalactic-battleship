require 'rails_helper'

RSpec.describe ShipsController, type: :controller do
  describe "ships#index action" do
    it "should successfully display all ships" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "ships#create action" do
    it "should successfully create a ship" do
      post :create, ship: FactoryGirl.create(:ship)
      expect(response).to have_http_status(:success)
      star_destroyer = Ship.last
      expect(star_destroyer.vertical?).to eq(true)
      expect(star_destroyer.x_coordinate).to eq(3)
      expect(star_destroyer.y_coordinate).to eq(4)
    end
  end

end
