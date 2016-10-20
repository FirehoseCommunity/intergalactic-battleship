class ShipsController < ApplicationController

  def index
    @ships = Ship.where("game_id = ? AND user_id = ?", params[:game_id], :user_id)
  end

  private

  def ship_params
    params.require(:ship).permit(:name, :x_coordinate, :y_coordinate, :vertical?, :game_id)
  end
  
end
