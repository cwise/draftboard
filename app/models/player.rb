class Player < ActiveRecord::Base
  has_one :draft_pick
  scope :not_drafted, where("id NOT IN (SELECT player_id FROM draft_picks)")
  scope :drafted, where("id IN (SELECT player_id FROM draft_picks)")
  scope :position, lambda {|pos| where(['position = ?', pos])}
  
  def full_name
    "#{name} (#{position}/#{team})"
  end
  
  def partial_name
    "#{name} (#{team})"
  end  
  
  def selected?
    !draft_pick.nil?
  end
end
