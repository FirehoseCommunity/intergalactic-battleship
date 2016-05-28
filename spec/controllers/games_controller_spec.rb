require 'rails_helper'

RSpec.describe GamesController, type: :controller do

  describe "games#index action" do
    it "should require user to be logged in" do
      get :new
      expect(response).to redirect_to new_user_session_path
    end

    it "should successfully show the page" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "games#new action" do
    it "should successfully show the pick a side page" do
      user = FactoryGirl.create(:user)
      sign_in user

      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "games#create action" do
    it "should require users to be logged in" do
      post :create, game: {jedi_user: 1, sith_user: 1}
      expect(response).to redirect_to new_user_session_path
    end

    it "should successfully create a new game in our database" do
      user = FactoryGirl.create(:user)
      sign_in user

      post :create, game: {
        jedi_user: 1, 
        sith_user: 1
      }
      expect(response).to redirect_to root_path
      game = Game.last
      expect(game.jedi_user).to eq(1)
      expect(game.sith_user).to eq(1)
      expect(game.user).to eq(user)
    end

    it "should properly deal with validation errors" do
      user = FactoryGirl.create(:user)
      sign_in user

      game_count = Game.count
      post :create, game: {jedi_user: }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(Game.count).to eq Game.count
    end  
  end



end
