class GamesController < ApplicationController

  def index
    @game = Game.first
  end

end
