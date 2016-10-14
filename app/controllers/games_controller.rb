class GamesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :index, :update]

  def index
    @games = Game.unjoined_games
  end

  def new
    @game = Game.new
  end

  def create
    if current_user.id == params[:jedi_user_id].to_i
      @game = Game.create(jedi_user_id: current_user.id)
      redirect_to games_path
    elsif current_user.id == params[:sith_user_id].to_i
      @game = Game.create(sith_user_id: current_user.id)
      redirect_to games_path
    else
      render text: "Invalid Request", status: :unprocessable_entity
    end
  end

  def update
    if current_game.sith_user_id.nil?
      current_game.update_attributes(sith_user_id: current_user.id)
    elsif current_game.jedi_user_id.nil?
      current_game.update_attributes(jedi_user_id: current_user.id)
    end
    if current_game.valid?
      redirect_to ships_path, flash: {
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
