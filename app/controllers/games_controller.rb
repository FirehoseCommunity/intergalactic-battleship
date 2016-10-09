class GamesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :index, :update]

  def index
    @games = Game.unjoined_games
  end

  def create   
    if current_user.id == params[:jedi_user_id].to_i
      @game = Game.create(jedi_user_id: current_user.id)
      @game.initialize_board(@game.id, current_user.id)
      redirect_to game_ships_path(@game)
    elsif current_user.id == params[:sith_user_id].to_i
      @game = Game.create(sith_user_id: current_user.id)
      @game.initialize_board(@game.id, current_user.id)
      redirect_to game_ships_path(@game)
    else
      render text: "Invalid Request", status: :unprocessable_entity
    end
  end

  def update
    @game = Game.find(params[:id])
    if current_user.id == params[:jedi_user_id].to_i
      @game.update(sith_user_id: current_user.id)
      @game.initialize_board(@game.id, current_user.id)
      redirect_to game_ships_path(@game)
    elsif current_user.id == params[:sith_user_id].to_i
      @game.update(jedi_user_id: current_user.id)
      @game.initialize_board(@game.id, current_user.id)
      redirect_to game_ships_path(@game)
    else
      render text: "Invalid Request", status: :unprocessable_entity
    end
  end
  
end
