class StrikesController < ApplicationController
  
  def new
    @strike = Strike.new
  end

  def index
    
  end

  def create
    @strike = Strike.create(strike_params)
    redirect_to root_path
  end

  def strike_params
    params.require(:strike).permit(:hit, :x_coordinate, :y_coordinate)
  end
end
