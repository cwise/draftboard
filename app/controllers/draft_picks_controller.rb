class DraftPicksController < ApplicationController
  def new
    round=DraftPick.current_round
    poolies=Poolie.draft_order if round.odd?
    poolies=Poolie.draft_order.reverse! if round.even?
    picks=DraftPick.where(:round => round)
    poolies.reject!{|poolie| !(picks.detect{|pick| pick.poolie_id==poolie.id}.nil?) }
    
    @available_players=Player.not_drafted.order("name")
    @draft_pick=DraftPick.new(:round => round, :poolie_id => poolies.first.id)
  end
  
  def create
    @draft_pick=DraftPick.new(params[:draft_pick])
    @draft_pick.save
    
    redirect_to new_draft_pick_path
  end
  
  def index
    @poolies=Poolie.draft_order.all
    @picks=DraftPick.draft_order.all
    @rounds=@picks.group_by {|dp| dp.round}
  end
  
  def delete_last_pick
    last_pick=DraftPick.last
    last_pick.delete if last_pick
    
    redirect_to new_draft_pick_path
  end
end
