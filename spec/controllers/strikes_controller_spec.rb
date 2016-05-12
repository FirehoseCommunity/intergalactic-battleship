require 'rails_helper'

RSpec.describe StrikesController, type: :controller do
  describe "strikes#index action" do
    it "should successfully show the page" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "strikes#new action" do
    it "should successfully show the strike" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "strikes#create action" do
    it "should successfully create a new strike in our database" do
      post :create, strike: {hit: true, x_coordinate: 3, y_coordinate: 4}
      expect(response).to redirect_to root_path

      strike = Strike.last
      expect(strike.hit).to eq(true)
      expect(strike.x_coordinate).to eq(3)
      expect(strike.y_coordinate).to eq(4)
    end  
  end

end
