class Player < ActiveRecord::Base
  belongs_to :draft_pick
  scope :not_drafted, where("id NOT IN (SELECT player_id FROM draft_picks)")
  scope :drafted, where("id IN (SELECT player_id FROM draft_picks)")
  
  def full_name
    "#{name} (#{position}/#{team})"
  end
  
  def partial_name
    "#{name} (#{team})"
  end  
end
