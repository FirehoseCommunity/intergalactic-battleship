class GamesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :index]

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    #@game = Game.create(jedi_user: params[:jedi_user], sith_user: params[:sith_user])
    @game = Game.create(game_params)
    if @game.valid?
      redirect_to games_path
    else
      render :new, status: :unprocessable_entity
    end  
  end

  private

  def game_params
    params.require(:game).permit(:jedi_user, :sith_user)
  end

end
