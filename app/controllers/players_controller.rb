class PlayersController < ApplicationController
  def index
    @position=params[:position]
    logger.info("position = #{@position}")
    @players=Player.position(@position).includes(:draft_pick).all
  end
end
