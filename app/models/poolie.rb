class Poolie < ActiveRecord::Base
  has_many :draft_picks
  scope :draft_order, order("draft_order asc")
  
end
