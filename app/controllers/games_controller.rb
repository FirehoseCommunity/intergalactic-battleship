class GamesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :index]

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.create(jedi_user_id: params[:jedi_user_id], sith_user_id: params[:sith_user_id])
    if @game.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end  
  end

end
