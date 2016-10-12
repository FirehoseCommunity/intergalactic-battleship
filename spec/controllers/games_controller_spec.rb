require 'rails_helper'

RSpec.describe GamesController, type: :controller do

  let(:user) { FactoryGirl.create(:user) }
  let(:user2) { FactoryGirl.create(:user) }
  # before(:each) do
  #   user = FactoryGirl.create(:user)
  #   user2 = FactoryGirl.create(:user)
  # end

  describe "games#index action" do
    
    it "will successfully show the page" do
      sign_in user
      get :index

      expect(response).to have_http_status(:success)
    end
  end

  describe "games#new action" do
    it "will require user to be logged in" do
      get :new

      expect(response).to redirect_to new_user_session_path
    end

    it "will successfully show the pick a side page" do
      sign_in user
      get :new

      expect(response).to have_http_status(:success)
    end
  end

  describe "games#create action" do
    it "will require users to be logged in" do
      post :create, sith_user_id: 1

      expect(response).to redirect_to new_user_session_path
    end
 
    it "will successfully create a new game in our database as Sith" do
      sign_in user
      count = Game.all.length
      post :create, sith_user_id: user.id 
      count2 = Game.all.length

      expect(count2).to eq(count + 1)
      expect(response).to redirect_to games_path
    end

    it "will properly deal with validation errors" do
      sign_in user
      post :create

      expect(response).to have_http_status(:unprocessable_entity)
    end  
  end

  describe "games#update action"  do

    context "valid join request" do
      it "will allow authenticated user to join a game as Jedi" do
        sign_in user
        g = Game.create(sith_user_id: user2.id) 
        post :update, id: g.id, jedi_user_id: user.id
        last = Game.last

        expect(last.jedi_user_id).to eq(user.id)
        expect(response).to redirect_to ships_path 
        expect(flash[:notice]).to match("You joined the game! Please place your ships.")
        # test that primary game owner is alerted to game update
      end

      it "will allow authenticated user to join a game as Sith" do
        sign_in user
        g = Game.create(jedi_user_id: user2.id)
        post :update, id: g.id, sith_user_id: user.id
        last = Game.last

        expect(last.sith_user_id).to eq(user.id)
        expect(response).to redirect_to ships_path 
        expect(flash[:notice]).to match("You joined the game! Please place your ships.")
        # test that primary game owner is alerted to game update
      end
    end

    context "invalid join request" do

      it "will require user to be logged in" do
        game = Game.create(sith_user_id: user.id)
        post :update, id: game.id, jedi_user_id: user2.id

        # test error/alert
        expect(response).to redirect_to new_user_session_path
      end

      it "will not process invalid request" do
        game = Game.create(jedi_user_id: user.id)
        sign_in user
        # post :update, id: game.id, sith_user_id: "FOO"
        # expect(flash[:alert]).to be_present
# test adding an error in flash
# test redirecting to game detail
        # expect(response).to have_http_status(:unprocessable_entity)
        # expect(response).to redirect_to games_path 
        # expect(response).not_to redirect_to ships_path
        # expect {post :update, id: game.id, sith_user_id: user.id}.to raise_error
        # expect {post :update, id: game.id, sith_user_id: "FOO"}.to raise_error
        # expect(flash[:alert]).to match("Invalid Request.")
        # expect(response).to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Jedi and Sith users cannot be the same!")
        # expect(response).to match(ActiveRecord::RecordInvalid)
        expect {post :update, id: game.id, sith_user_id: user.id}.to raise_error(ActiveRecord::RecordInvalid)
      end


    end
  end
end
