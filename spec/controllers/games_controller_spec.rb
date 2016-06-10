require 'rails_helper'

RSpec.describe GamesController, type: :controller do

  #insert before actions here to create user
  #let command
  describe "games#index action" do
    
    it "should successfully show the page" do
      user = FactoryGirl.create(:user)
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
      user = FactoryGirl.create(:user)
      sign_in user

      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "games#create action" do
    it "should require users to be logged in" do
      
      post :create, :sith_user_id => 1
      expect(response).to redirect_to new_user_session_path
    end
 
    it "should successfully create a new game in our database" do
      user = FactoryGirl.create(:user)
      sign_in user

      count = Game.all.length
      post :create, sith_user_id: user.id 
      count2 = Game.all.length
      expect(count2).to eq(count + 1)
      expect(response).to redirect_to games_path
      
    end

    it "should properly deal with validation errors" do
      user = FactoryGirl.create(:user)
      sign_in user

      post :create
      expect(response).to have_http_status(:unprocessable_entity)
    end  
  end

  describe "games#update action" do

    context "valid credentials" do
      context "valid join request" do
        it "will successfully update a game with second player" do
# test that the record is updated
# test that current_user is redirected to the ship staging page
# test that primary game owner is alerted to game update
        end
      end

      context "invalid join request" do
        it "will prevent user from joining their own game" do
# test adding an error in flash
# test redirecting to game detail
        end
      end
    end

    context "invalid credentials" do
      it "will require user to be logged in" do
# test error/alert
# test redirect to new_user_session_path or new_user_registration_path?
      end
    end

  end

end
