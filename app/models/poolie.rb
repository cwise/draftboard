class Poolie < ActiveRecord::Base
  has_many :draft_picks
  scope :draft_order, order("draft_order asc")
  
  def self.randomize_draft_order
    poolies=Poolie.all
    poolies=poolies.sort_by { rand }
    
    pick=0
    poolies.each do |poolie|
      pick=pick+1
      poolie.update_attribute(:draft_order, pick)
    end
  end
end
