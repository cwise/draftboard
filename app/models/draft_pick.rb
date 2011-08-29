class DraftPick < ActiveRecord::Base
  belongs_to :poolie
  belongs_to :player
  before_save :set_pick_number
  attr_accessor :player_name
  scope :draft_order, order(:pick)
  
  def self.current_round
    poolie_count=Poolie.count
    draft_pick_count=DraftPick.count
    current_round=(draft_pick_count/poolie_count) + 1
  end
  
  def self.current_pick
    last_pick=0
    last_pick=DraftPick.maximum(:pick) unless DraftPick.maximum(:pick).nil?
    last_pick+1
  end  

  def set_pick_number
    self.pick=DraftPick.current_pick
  end
  
  def player_name
    player ? player.name : ''
  end  
end
