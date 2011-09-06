require 'csv'

class Player < ActiveRecord::Base
  has_one :draft_pick
  scope :not_drafted, where("id NOT IN (SELECT player_id FROM draft_picks)")
  scope :drafted, where("id IN (SELECT player_id FROM draft_picks)")
  scope :position, lambda {|pos| where(['position = ?', pos])}
  scope :search, lambda {|q| q.blank? ? scoped : where(["lower(name) LIKE ?", "%#{q.downcase}%"])}  
  
  VALID_POSITIONS=%w{QB RB WR TE K}
  
  def full_name
    "#{name} (#{position}/#{team})"
  end
  
  def partial_name
    "#{name} (#{team})"
  end  
  
  def selected?
    !draft_pick.nil?
  end
  
  def self.import_csv filename
    added=0
    skipped=0

    CSV.foreach(filename, {:col_sep => ",", :headers => :firstrow}) do |row|
      Player.transaction do
        team=row['TeamAbbName']
        team.upcase!
        
        player_name=row['PlayerName']
        all_positions=row['PlayerPosition'].split('/').map{|pos| pos=='FB' ? 'RB' : pos}.map{|pos| pos=='KFG' ? 'K' : pos}.select{|pos| VALID_POSITIONS.include?(pos)}
        position=all_positions.first
        
        if position
          Player.create :name => player_name, :team => team, :position => position
          added+=1
        else
          skipped+=1
        end
      end
    end    
    
    "File #{filename} imported: added #{added} skipped #{skipped}"
  end
  
  def autocomplete_response
     {"id" => id, "label" => full_name, "value" => full_name}
  end  
end
