class Yahoo
  def self.read_players
    (1..17).to_a.each do |index|  
      read_page index
    end
  end
  
  def self.read_page page
    path = "/Users/cwise/Downloads/page#{page}.html"
    doc = Nokogiri::HTML(open(path))
    nodes = doc.css('.ysf-player-name')
    nodes.each do |node|
      player = Player.new
      player.name = node.css('a').text
      team, position = node.css('span').text.split('-').map{ |token| token.strip }
      player.team = team
      player.position = position
      player.save
    end    
  end
end