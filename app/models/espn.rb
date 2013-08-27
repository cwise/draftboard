class Espn
  include HTTParty
  debug_output $stdout
  base_uri 'api.espn.com/v1'
  
  def self.params
    { :apikey => ENV['ESPN_KEY'] }
  end
  
  def self.get_teams
    teams = self.get('/sports/football/nfl/teams.json', :query => params).parsed_response['sports'][0]['leagues'][0]['teams']
  end
  
  def self.get_roster team_id
    players = self.get("/sports/football/nfl/teams/#{team_id}.json", :query => params.merge(:enable => 'roster')).parsed_response
  end
end