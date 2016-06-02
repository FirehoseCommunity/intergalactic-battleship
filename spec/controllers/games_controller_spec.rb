require 'rails_helper'

RSpec.describe GamesController, type: :controller do

  #insert before actions here to create user

  describe "games#index action" do
    
    it "should successfully show the page" do
      user = FactoryGirl.create(:sith_user)
      sign_in user

      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "games#new action" do
    it "should require user to be logged in" do
      get :new
      expect(response).to redirect_to new_user_session_path
    end

    it "should successfully show the pick a side page" do
      user = FactoryGirl.create(:sith_user)
      sign_in user

      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "games#create action" do
    it "should require users to be logged in" do
      
      post :create, game: {:sith_user_id => 1}
      expect(response).to redirect_to new_user_session_path
    end
 
    it "should successfully create a new game in our database" do
      user = FactoryGirl.create(:user)
      sign_in user

      post :create, game: {:sith_user_id => 1}
      game = Game.last
      expect(response).to redirect_to games_path
      
    end

    it "should properly deal with validation errors" do
      user = FactoryGirl.create(:sith_user)
      sign_in user

      post :create, game: {:sith_user_id => 0}
      expect(response).to have_http_status(:unprocessable_entity)
    end  
  end



end
