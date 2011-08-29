class PlayersController < ApplicationController
  def index
    @position=params[:position]
    logger.info("position = #{@position}")
    @players=Player.position(@position).includes(:draft_pick).order('name').all
  end
  
  def search
    @players=Player.not_drafted.search(params[:term]).order("name")
    
    respond_to do |format|
      format.json { render :json => @players.collect {|player| player.autocomplete_response } }
    end
  end  
end
