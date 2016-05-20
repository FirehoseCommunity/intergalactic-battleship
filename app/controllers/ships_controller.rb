class ShipsController < ApplicationController

  def index
  end

  def create
    @ship = Ship.create(ship_params)
  end

  private

  def ship_params
    params.require(:ship).permit(:game_id, :user_id)
  end
  
end
