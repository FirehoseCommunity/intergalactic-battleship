require 'rails_helper'

RSpec.describe GamesController, type: :controller do

  describe "games#index action" do

    it "should successfully show the page" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "games#new action" do

    it "should successfully show the pick a side page" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "games#create action" do

    it "should successfully create a new game in our database" do
      post :create, game: {jedi_user: 1, sith_user: 1}
      expect(response).to redirect_to root_path
​
      game = game.last
      expect(game.jedi_user).to eq(1)
      expect(game.sith_user).to eq(1)
    end  
  end

end
