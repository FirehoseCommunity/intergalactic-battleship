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
    if current_game.sith_user_id.nil?
      current_game.update_attributes(sith_user_id: current_user.id)
    elsif current_game.jedi_user_id.nil?
      current_game.update_attributes(jedi_user_id: current_user.id)
    end
    if current_game.valid?
      current_game.initialize_board(current_game.id, current_user.id)
       redirect_to game_ships_path(@game), flash: {
        notice: "You joined the game! Please place your ships."}
    else
      redirect_to games_path, flash: {
        alert: "Invalid Request. #{current_game.errors.full_messages.last}"}
    end    
  end

  private

  helper_method :current_game
  
  def current_game
    @current_game ||= Game.find(params[:id])
  end

end
