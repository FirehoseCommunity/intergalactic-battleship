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
    #this needs to be cleaned up seriously using private game_params
    @game = Game.find(params[:id])
    if current_user.id != params[:jedi_user_id].to_i
      @game.update(sith_user_id: current_user.id)
      redirect_to ships_path
    elsif current_user.id != params[:sith_user_id].to_i
      @game.update(jedi_user_id: current_user.id)
      redirect_to ships_path
    else
      render text: "Invalid Request", status: :unprocessable_entity
    end
  end

  private



  # helper_method :find_empty_user

  # def pending_games
  #   @pending_games = Game.where
  # end

  # def find_empty_user(game)
  #   @pending_game = Game.find(game.id)
  #   @join_as
  #   @opponent
  #   if @pending_game.jedi_user_id.present?
  #     @join_as = "Sith"
  #     @opponent = jedi_user_id
  #   elsif @pending_game.sith_user_id.present?
  #     @join_as = "Jedi"
  #     @opponent = sith_user_id
  #   end
  # end  
end
