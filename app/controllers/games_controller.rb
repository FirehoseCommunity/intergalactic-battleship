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
    @game = Game.find(params[:id])
    # This update action is always going to
    # result in games with same player on both sides
    # We NEED to rewrite this
    # if current_user.id == params[:jedi_user_id].to_i
    #   @game.update(sith_user_id: current_user.id)
    #   render template: "ships/index.html.erb" 
    # elsif current_user.id == params[:sith_user_id].to_i
    #   @game.update(jedi_user_id: current_user.id)
    #   render template: "ships/index2.html.erb" 
    # else
    #   render text: "Invalid Request", status: :unprocessable_entity
    # end
  end
  
end
