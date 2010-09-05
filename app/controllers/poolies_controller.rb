class PooliesController < ApplicationController
  def index
    @poolies=Poolie.draft_order
  end
  
  def randomize_draft_order
    poolies=Poolie.all
    poolies=poolies.sort_by { rand }
    
    pick=0
    poolies.each do |poolie|
      pick=pick+1
      poolie.draft_order=pick
      poolie.save
    end
    
    redirect_to poolies_path
  end
end
