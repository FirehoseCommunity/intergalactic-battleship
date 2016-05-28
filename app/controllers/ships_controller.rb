class ShipsController < ApplicationController

  def index
  end

  def create
    @ship = Ship.create(ship_params)
    render action: "index"
  end

  private

  def ship_params
    params.require(:ship).permit(:name, :x_coordinate, :y_coordinate, :vertical?)
  end
  
end
