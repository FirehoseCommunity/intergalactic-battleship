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

  # def update
  #   #this needs to be cleaned up seriously using private game_params
  #   @game = Game.find(params[:id])
  #   if (current_user.id != params[:jedi_user_id].to_i) && @game.sith_user_id.nil?
  #     @game.update(sith_user_id: current_user.id)
  #     redirect_to ships_path
  #   elsif current_user.id != params[:sith_user_id].to_i && @game.jedi_user_id.nil?
  #     @game.update(jedi_user_id: current_user.id)
  #     redirect_to ships_path
  #   else
  #     # flash[:alert] = "Invalid Request."
  #     # redirect_to game_path(@game)
  #     # render text: "Invalid Request", status: :unprocessable_entity
  #     redirect_to games_path, flash: {alert: "Invalid Request."} 
  #   end
  # end

  def update
    valid_update
  end

  private

  helper_method :current_game
  
  def current_game
    @current_game ||= Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:jedi_user_id, :sith_user_id)
  end

# # Why doesn't this work?  Why are "game_params" missing :game??
#   def valid_update
#     @game = Game.find(params[:id])
#     if @game.sith_user_id.nil? || @game.jedi_user_id.nil?
#       @game.update_attributes!(game_params)
#     else
#       flash[:alert] = "Invalid Request."
#     end
#   end

  def valid_update
    # @game = Game.find(params[:id])
    if current_game.sith_user_id.nil?
      current_game.update_attributes!(sith_user_id: current_user.id)
      redirect_to ships_path, flash: {notice: "You joined the game! Please place your ships."}
    elsif current_game.jedi_user_id.nil?
      current_game.update_attributes!(jedi_user_id: current_user.id)
      redirect_to ships_path, flash: {notice: "You joined the game! Please place your ships."}
    else
      flash[:alert] = "Invalid Request."
      # redirect_to games_path, flash: {alert: "Invalid Request."}       
    end
  end
end
