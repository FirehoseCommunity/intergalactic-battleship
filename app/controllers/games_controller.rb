class GamesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :index]

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    if current_user.id == params[:jedi_user_id].to_i
      @game = Game.create(:jedi_user_id => current_user.id)
    elsif current_user.id == params[:sith_user_id].to_i
      @game = Game.create(:sith_user_id => current_user.id)
    else
      render text: "Invalid Request", status: :unprocessable_entity
    end

    # if @game.valid?
    #   redirect_to games_path
    # else
    #   render :new, status: :unprocessable_entity
    # end  
  end

end
