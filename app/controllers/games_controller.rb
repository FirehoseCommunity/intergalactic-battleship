class GamesController < ApplicationController

  def index
    @game = Game.all
  end

end
