class GamesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :index]

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    #params[:jedi_user_id] # => "10".to_i => 10
    #params[:sith_user_id] # => 10

    if current_user.id == params[:jedi_user_id].to_i
      @game = Game.create(:jedi_user => current_user)
    elsif current_user.id == params[:sith_user_id].to_i
      @game = Game.create(:sith_user => current_user)
    else
      render :new, status: :unprocessable_entity
    end

    # @game = Game.create(jedi_user_id: params[:jedi_user_id], sith_user_id: params[:sith_user_id])
     # @game = Game.create(game_params)
    if @game.valid?
      redirect_to games_path
    else
      render :new, status: :unprocessable_entity
    end  
  end

  private

  # def game_params
  #   params.require(:game).permit(:jedi_user, :sith_user)
  # end

end
