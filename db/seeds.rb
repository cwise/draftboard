unless Poolie.exists?
  Poolie.create(:name => 'Chris Wise', :team_name => 'Wise', :draft_order => 1)
  Poolie.create(:name => 'Paul Wong', :team_name => 'Wong', :draft_order => 2)
  Poolie.create(:name => 'Mike Peralta', :team_name => 'Coupon', :draft_order => 3)
  Poolie.create(:name => 'Craig Kavanagh', :team_name => 'Bot', :draft_order => 4)
  Poolie.create(:name => 'Louis-Martin Parent', :team_name => 'Lewis', :draft_order => 9)
  Poolie.create(:name => 'Chris Maloney', :team_name => 'Maloney', :draft_order => 10)
end

unless Player.exists?
  Player.create(:name => ' Aaron Rodgers', :team => 'GB',:position => 'QB')

end