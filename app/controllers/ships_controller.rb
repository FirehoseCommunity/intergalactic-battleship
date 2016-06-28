class ShipsController < ApplicationController

  def index
    
  end

  def create
    @ship = Ship.create(ship_params)
    @grid = @grid.create_grid
  end

  private

  def ship_params
    params.require(:ship).permit(:name, :x_coordinate, :y_coordinate, :vertical?)
  end

  

end
